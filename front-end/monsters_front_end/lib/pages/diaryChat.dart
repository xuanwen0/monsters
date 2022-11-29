// ignore_for_file: use_key_in_widget_constructors, unnecessary_string_interpolations, prefer_const_constructors, file_names, avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names, camel_case_types
import 'dart:developer';
import 'dart:io';
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:monsters_front_end/main.dart';
import 'package:monsters_front_end/model/audio_model/audio_player.dart';
import 'package:monsters_front_end/model/diaryModel.dart';
import 'package:monsters_front_end/pages/Timer_Widget.dart';
import 'package:monsters_front_end/pages/manual.dart';
import 'package:monsters_front_end/pages/monsters_information.dart';
import 'package:monsters_front_end/pages/drawing_colors.dart';
import 'package:monsters_front_end/pages/history.dart';
import 'package:monsters_front_end/pages/style.dart';
import 'package:monsters_front_end/repository/diaryRepo.dart';
import 'package:video_player/video_player.dart';
import 'package:monsters_front_end/pages/audio_main.dart';

class diaryChat extends StatefulWidget {
  @override
  _diaryChat createState() => _diaryChat();
}

class _diaryChat extends State<diaryChat> with WidgetsBindingObserver {
  final messageInsert = TextEditingController();
  final timerController = TimerController();
  final player = AudioPlayer();
  late final VideoPlayerController _videoPlayerController;
  int chatRound = 0;
  bool lastSpeaking = false;
  bool robotSpeakable = true;
  bool pickable = false;
  List<Map> messages = [];
  int acceptShare = 0;
  var userAnswers = [];
  File? contentFile;
  File? moodFile;

  //新增煩惱-照相
  takePhoto() async {
    final media = await ImagePicker().pickImage(source: ImageSource.camera);
    if (media == null) return;
    final imageTemporary = File(media.path);

    contentFile = imageTemporary;
    if (contentFile != null) {
      messages.insert(0, {"data": 2, "image": contentFile});
      response(null, contentFile);
    }
    setState(() {});
  }

  //新增煩惱-錄影
  recordVideo() async {
    XFile? recordedVideo = await ImagePicker().pickVideo(
        source: ImageSource.camera, maxDuration: Duration(seconds: 15));
    if (recordedVideo == null) return;
    contentFile = File(recordedVideo.path);
    _videoPlayerController = VideoPlayerController.file(contentFile!)
      ..initialize().then((_) {
        messages.insert(0, {"data": 3, "video": contentFile});
        _videoPlayerController.play();
        response(null, contentFile);
      });
    setState(() {});
  }

  //新增煩惱-相簿匯入照片
  pickPhoto() async {
    final media = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (media == null) return;
    final imageTemporary = File(media.path);

    contentFile = imageTemporary;
    if (contentFile != null) {
      messages.insert(0, {"data": 2, "image": contentFile});
      response(null, contentFile);
    }
    setState(() {});
  }

  //新增煩惱-相簿匯入影片
  pickVideo() async {
    XFile? pickedVideo =
        await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (pickedVideo == null) return;
    contentFile = File(pickedVideo.path);
    _videoPlayerController = VideoPlayerController.file(contentFile!)
      ..initialize().then((_) {
        messages.insert(0, {"data": 3, "video": contentFile});
        _videoPlayerController.play();
        response(null, contentFile);
      });
    setState(() {});
  }

  //錄音功能
  recordAudio(BuildContext context) async {
    final media = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AudioMainPage()),
    );

    if (media == null) return;
    final audioTemporary = File(media);
    contentFile = audioTemporary;
    if (contentFile != null) {
      messages.insert(0, {"data": 4, "audio": contentFile});
      response(null, contentFile);
    }
    setState(() {});
  }

  //畫心情功能
  _navigateAndDisplayPaint(BuildContext context) async {
    //TODO: Level 2
    //ADD HERO https://youtu.be/1xipg02Wu8s?t=657
    final moodImage = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Draw_mood()),
    );
    if (moodImage == null) {
      reply("畫心情失敗，請通知官方平台");
    } else {
      final imageTemporary = File(moodImage.path);
      this.moodFile = imageTemporary;
      messages.insert(0, {"data": 5, "image": moodFile});
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //TODO:後端修改

    final DiaryRepository diaryRepository = DiaryRepository();

    if (chatRound == 0) {
      response("get intro"); //intro
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 164, 78, 38), //修改颜色
        ),
        backgroundColor: Color.fromRGBO(255, 237, 151, 1),
        elevation: 2.0,
        title: Text("巴古",
            style: TextStyle(
                fontSize: 22, color: Color.fromARGB(255, 164, 78, 38))),
        centerTitle: true,
      ),
      body: Container(
        color: Color.fromARGB(255, 255, 255, 229),
        child: Column(
          children: <Widget>[
            //聊天室框
            Flexible(
                child: ListView.builder(
                    reverse: true,
                    itemCount: messages.length,
                    //只要回傳直是一個container裡面放照片就好
                    itemBuilder: (context, index) => chat(
                          messages[index]["message"].toString(),
                          messages[index]["data"],
                          /*
                          data type list
                          0 : robot message text 
                          1 : user message text
                          2 : user message image 
                          3 : user message video 
                          4 : user message audio from Recording 
                          5 : user message image from Draw_paint() 
                          */
                        ))),
            SizedBox(
              height: 10,
            ),
            //底部功能列
            Container(
              decoration:
                  BoxDecoration(color: Color.fromRGBO(255, 237, 151, 1)),
              alignment: Alignment.bottomCenter,
              height: 60,
              //margin: EdgeInsets.only(bottom: 30),
              child: lastSpeaking == false
                  //彈出選單(選擇照相、錄影、錄音、相簿)
                  ? ListTile(
                      leading: (pickable == true)
                          ? PopUpMen(
                              icon: Icon(
                                Icons.drive_folder_upload,
                                color: Color.fromARGB(255, 164, 78, 38),
                                size: 30,
                              ),
                              menuList: [
                                PopupMenuItem(
                                  child: ListTile(
                                      leading: Icon(Icons.camera_alt_rounded),
                                      title: Text("照相"),
                                      onTap: () => {
                                            ////照相選項
                                            takePhoto(),
                                            Navigator.pop(context)
                                          }),
                                ),
                                PopupMenuItem(
                                  child: ListTile(
                                      leading: Icon(
                                          Icons.video_camera_front_rounded),
                                      title: Text("錄影"),
                                      onTap: () => {
                                            //錄影選項
                                            recordVideo(),
                                            Navigator.pop(context)
                                          }),
                                ),
                                PopupMenuItem(
                                  child: ListTile(
                                      leading:
                                          Icon(Icons.keyboard_voice_rounded),
                                      title: Text("錄音"),
                                      onTap: () => {
                                            //錄音選項
                                            Navigator.pop(context),
                                            recordAudio(context),
                                          }),
                                ),
                                PopupMenuItem(
                                    child: ListTile(
                                        leading: Icon(Icons.image_rounded),
                                        title: Text("從相簿匯入圖片"),
                                        onTap: () => {
                                              //匯入圖片
                                              pickPhoto(),
                                              Navigator.pop(context)
                                            })),
                                PopupMenuItem(
                                    child: ListTile(
                                        leading: Icon(Icons.video_collection),
                                        title: Text("從相簿匯入影片"),
                                        onTap: () => {
                                              //匯入影片
                                              pickVideo(),
                                              Navigator.pop(context)
                                            })),
                              ],
                            )
                          : null,
                      //輸入框
                      title: Container(
                        height: 35,
                        alignment: Alignment.bottomLeft,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(13)),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.only(left: 20),
                        child: TextFormField(
                          textAlign: TextAlign.left,
                          controller: messageInsert,
                          decoration: InputDecoration(
                            hintText: "Enter a Message...",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                          style: TextStyle(fontSize: 12, color: Colors.black),
                          onChanged: (value) {},
                        ),
                      ),

                      //傳送紐
                      trailing: IconButton(
                          icon: Icon(
                            Icons.send,
                            size: 30.0,
                            color: Color.fromARGB(255, 164, 78, 38),
                          ),
                          onPressed: () {
                            if (messageInsert.text.isEmpty) {
                            } else {
                              robotSpeakable = true;
                              messages.insert(0,
                                  {"data": 1, "message": messageInsert.text});
                              response(messageInsert.text);
                              setState(() {});

                              if (lastSpeaking == true) {
                                popUp(context);
                                Container(
                                    color: Colors.black,
                                    height: 100.0,
                                    alignment: Alignment.bottomCenter);
                              }
                              messageInsert.clear();
                            }
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);
                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                          }),
                    )
                  //前往歷史記錄
                  : ListTile(
                      title: Container(
                        child: TextButton(
                          child: Container(
                            width: 250,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: BackgroundColorWarm, width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0))),
                            child: Center(
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 3),
                                child: Text(
                                  //TODO: 加陰影
                                  "前往歷史記錄",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 28, color: BackgroundColorWarm),
                                ),
                              ),
                            ),
                          ),
                          onPressed: () {
                            // 內容、是否畫心情、是否畫圖
                            diaryRepository.createDiary(
                              Diary(
                                id: 0,
                                account: user_Account, //"Lin"
                                content: userAnswers[0], //"純文字不分享無多媒體"
                                index: userAnswers[1], //3
                                share: userAnswers[2], //0
                                time: '',
                                contentFile: null,
                              ),
                            );
                            log(userAnswers.toString());

                            // Navigator.pushReplacement(
                            //     //TODO: Level 2
                            //     //ADD HERO https://youtu.be/1xipg02Wu8s?t=657
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => History()));
                          },
                        ),
                      ),
                    ),
            ),
            Container(color: Color.fromRGBO(255, 237, 151, 1), height: 10),
          ],
        ),
      ),
    );
  }

  //聊天功能
  Widget chat(String message, int data) {
    Container userChatContainer = Container();
    //text container
    if (data < 2) {
      userChatContainer = Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment:
              data == 1 ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            data == 0
                //巴古頭貼
                ? Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(width: 1, color: const Color(0xffa0522d)),
                    ),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(getMonsterAvatarPath("Baku")),
                    ),
                  )
                : Container(),
            //訊息框
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Bubble(
                  radius: Radius.circular(15.0),
                  color: data == 0
                      ? Colors.white
                      : Color.fromRGBO(255, 237, 151, 1),
                  elevation: 2.0,
                  //訊息文字格式
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(
                          width: 3.0,
                        ),
                        Flexible(
                            child: Container(
                          constraints: BoxConstraints(maxWidth: 200),
                          child: Text(
                            message,
                            style: TextStyle(
                                color: data == 0
                                    ? Color.fromRGBO(160, 82, 45, 1)
                                    : Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 17),
                          ),
                        ))
                      ],
                    ),
                  )),
            ),
          ],
        ),
      );
    }

    //picture container
    if (data == 2) {
      userChatContainer = Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //訊息框
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Bubble(
                  radius: Radius.circular(15.0),
                  color: Color.fromRGBO(255, 237, 151, 1),
                  elevation: 2.0,
                  //訊息文字格式
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(
                          width: 3.0,
                        ),
                        Flexible(
                            child: Container(
                                child: Image.file(contentFile!,
                                    width: (MediaQuery.of(context).size.width >
                                            MediaQuery.of(context).size.height)
                                        ? 288
                                        : 162,
                                    height: (MediaQuery.of(context).size.width <
                                            MediaQuery.of(context).size.height)
                                        ? 240
                                        : 162,
                                    filterQuality: FilterQuality.medium))),
                        SizedBox(
                          width: 3.0,
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      );
    }

    //video container
    if (data == 3) {
      userChatContainer = Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //訊息框
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Bubble(
                  radius: Radius.circular(15.0),
                  color: Color.fromRGBO(255, 237, 151, 1),
                  elevation: 2.0,
                  //訊息文字格式
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(
                          width: 3.0,
                        ),
                        Flexible(
                            child: Container(
                                width:
                                    (_videoPlayerController.value.size.width >
                                            _videoPlayerController
                                                .value.size.height)
                                        ? 288
                                        : 162,
                                height:
                                    (_videoPlayerController.value.size.width >
                                            _videoPlayerController
                                                .value.size.height)
                                        ? 162
                                        : 288,
                                alignment: Alignment.centerRight,
                                child: AspectRatio(
                                  aspectRatio:
                                      (_videoPlayerController.value.size.width >
                                              _videoPlayerController
                                                  .value.size.height)
                                          ? 16 / 9
                                          : 9 / 16,
                                  child:
                                      _videoPlayerController.value.isInitialized
                                          ? VideoPlayer(_videoPlayerController)
                                          : Container(),
                                ))),
                        SizedBox(
                          width: 3.0,
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      );
    }

    //audio container
    if (data == 4) {
      userChatContainer = Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //訊息框
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Bubble(
                  radius: Radius.circular(15.0),
                  color: Color.fromRGBO(255, 237, 151, 1),
                  elevation: 2.0,
                  //訊息文字格式
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(
                          width: 3.0,
                        ),
                        Flexible(
                            child: Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'The Audio',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 20),
                              CircleAvatar(
                                radius: 35,
                                child: IconButton(
                                  icon: Icon(Icons.play_circle_fill),
                                  iconSize: 30,
                                  onPressed: () async {
                                    await player.togglePlaying(
                                        whenFinished: () => {setState(() {})});
                                  },
                                ),
                              )
                            ],
                          ),
                        )),
                        SizedBox(
                          width: 3.0,
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      );
    }

    //painting container
    if (data == 5) {
      //TODO: Level 2
      ///ADD HERO https://youtu.be/1xipg02Wu8s?t=657
      ///wrap by something make it clickable to watch
      userChatContainer = Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //訊息框
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Bubble(
                  radius: Radius.circular(15.0),
                  color: Color.fromRGBO(255, 237, 151, 1),
                  elevation: 2.0,
                  //訊息文字格式
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(
                          width: 3.0,
                        ),
                        Flexible(
                            child: Container(
                                child: Image.file(moodFile!,
                                    width: 200,
                                    height: 200,
                                    filterQuality: FilterQuality.medium))),
                        SizedBox(
                          width: 3.0,
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      );
    }

    //moodImage container
    if (data == 6) {
      userChatContainer = Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: const Color(0xffa0522d)),
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage(getMonsterAvatarPath("Baku")),
              ),
            ),
            //訊息框
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Bubble(
                  radius: Radius.circular(15.0),
                  color: Colors.white,
                  elevation: 2.0,
                  //訊息格式 以圖表示煩惱指數
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(
                          width: 3.0,
                        ),
                        Flexible(
                            child: Container(
                                constraints: BoxConstraints(maxWidth: 200),
                                child: emotionPointRows()))
                      ],
                    ),
                  )),
            ),
          ],
        ),
      );
    }

    return userChatContainer;
  }

  //怪獸訊息(提示輸入格式)
  void hint() {
    String hintDiaryMethod = "請用以下幾種方式記錄：\n★以文字記錄日記\n★點選左下角圖示新增";
    String hintAccept = "[請擇一輸入]\n是 / 否";
    if (chatRound == 0) {
      pickable = true;
      reply(hintDiaryMethod);
    } else if (chatRound == 1) {
      pickable = false;
      reply(hintAccept);
    } else if (chatRound == 2) {
      replyImage();
    } else if (chatRound == 3) {
      reply(hintAccept);
    }
  }

  //提示輸入格式錯誤
  void cannotRead() {
    String hintCannotRead = "員工手冊上沒有這個選項耶...麻煩確認一下好嗎？";
    String secHintEmotionGrade = "心情指數有多高呢？\n1分是最高的喔！";
    String secHintSharingAcception = "想分享日記給別人看看嗎？";
    String secHintDrawingAcception = "要不要把你的心情畫下來呢？";

    chatRound--;
    reply(hintCannotRead);
    if (chatRound == 1) {
      reply(secHintDrawingAcception);
    }
    if (chatRound == 2) {
      reply(secHintEmotionGrade);
    }
    if (chatRound == 3) {
      reply(secHintSharingAcception);
    }
  }

  //確認是否符合選擇格式，符合->回覆 不符合->提示再次輸入
  Future<void> response([String? text, File? media]) async {
    List<String> emotionGradeMembers = ["", "1", "2", "3", "4", "5"];
    List<String> acceptDrawingMembers = ["是", "否"];
    //進入時自動訊息問安
    if (chatRound == 0) {
      int hourNow = DateTime.now().hour.toInt();
      if (hourNow < 5) {
        reply("凌晨睡不好嗎？\n正在想甚麼呢？\n來寫個日記舒壓一下吧？"); //0~5點
      } else if (hourNow < 12) {
        reply("早上好啊！\n我願意當一個好聽眾！"); //5~12點
      } else if (hourNow < 14) {
        reply("中午好啊！\n午餐吃了嗎？發生任何事都可以找我聊聊喔！"); //12~14點
      } else {
        reply("下午好～今天過得如何呀！有發生什麼事情嗎?"); //14~24點
      }
    }

    if (chatRound < 5) {
      if (robotSpeakable == true) {
        //取得內容
        if (chatRound == 1) {
          log("--完成內容");
          if (text != null) {
            userAnswers.add(text);
          }
          if (media != null) {
            userAnswers.add(media);
          }
          reply("想畫點甚麼表達你的感受嗎？");
        }

        //取得是否畫心情
        if (chatRound == 2) {
          if (acceptDrawingMembers.contains(text)) {
            if (text == "是") {
              await _navigateAndDisplayPaint(context);
            }
            // userAnswers.add(text);
          } else {
            cannotRead();
          }
          reply("給心情程度打一個分數～");
          log("--完成畫心情");
        }
        //取得是否分享
        if (chatRound == 3) {
          if (emotionGradeMembers.contains(text)) {
            userAnswers.add(emotionGradeMembers.indexOf(text!));
            reply("想不想把這件事分享給別人呢？");

            log("--完成心情分數");
          } else {
            cannotRead();
          }
        }
        if (chatRound == 4) {
          if (text == "是" || text == "否") {
            if (text == "是") {
              userAnswers.add(1);
            }
            if (text == "否") {
              userAnswers.add(0);
            }
            lastSpeaking = true;
            reply("我幫你記錄下來囉，想回顧的時候隨時跟我說！");
            setState(() {});
            log("--完成分享");
          } else {
            cannotRead();
          }
        }
      }
    }

    hint();
    chatRound++;
    setState(() {});
  }

  //怪獸回覆
  void reply(String text) {
    messages.insert(0, {"data": 0, "message": text});
  }

  void replyImage() {
    messages.insert(0, {"data": 6, "message": "print image"});
  }

  Row emotionPointRow() {
    Row emotionPointRow = Row();
    emotionPointRow = Row(
      children: [
        emotionPointColumn("1"),
        Spacer(),
        emotionPointColumn("2"),
        Spacer(),
        emotionPointColumn("3"),
        Spacer(),
        emotionPointColumn("4"),
        Spacer(),
        emotionPointColumn("5"),
        Spacer(),
      ],
    );

    return emotionPointRow;
  }

  Column emotionPointColumns(String point) {
    Column emotionImageColumns = Column();
    emotionImageColumns = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 19,
          backgroundImage: AssetImage('assets/image/mood/moodPoint_$point.png'),
        ),
        SizedBox(height: 1),
        Text(point,
            style:
                TextStyle(fontSize: 17, color: Color.fromRGBO(160, 82, 45, 1)))
      ],
    );

    return emotionImageColumns;
  }

  Row emotionPointRows() {
    Row emotionPointRows = Row();
    emotionPointRows = Row(
      children: [
        emotionPointColumn("1"),
        Spacer(),
        emotionPointColumn("2"),
        Spacer(),
        emotionPointColumn("3"),
        Spacer(),
        emotionPointColumn("4"),
        Spacer(),
        emotionPointColumn("5"),
        Spacer(),
      ],
    );

    return emotionPointRows;
  }

  Column emotionPointColumn(String point) {
    Column annoyanceImageColumn = Column();
    annoyanceImageColumn = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 19,
          backgroundImage: AssetImage('assets/image/mood/moodPoint_$point.png'),
        ),
        SizedBox(height: 1),
        Text(point,
            style:
                TextStyle(fontSize: 17, color: Color.fromRGBO(160, 82, 45, 1)))
      ],
    );

    return annoyanceImageColumn;
  }

  Future<dynamic> popUp(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return const PresentWidget();
      },
    );
  }
}

//彈出選單設置
class PopUpMen extends StatelessWidget {
  final List<PopupMenuEntry> menuList;
  final Widget? icon;

  const PopUpMen({Key? key, required this.menuList, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: ((context) => menuList),
      icon: icon,
    );
  }
}

class PresentWidget extends StatefulWidget {
  const PresentWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PresentWidget();
  }
}

class _PresentWidget extends State<PresentWidget> {
  String present_name = getRandomMonsterName_CH();
  final DiaryRepository diaryRepository = DiaryRepository();
  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Center(
          child: Container(
            height: 420,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: BackgroundColorLight,
              border: Border.all(width: 5, color: BackgroundColorWarm),
              borderRadius: BorderRadius.circular(22.0),
            ),
            child: Column(
              children: [
                Container(
                  height: 220,
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: const BoxDecoration(
                    color: BackgroundColorLight,
                  ),
                  child: Center(
                    child: Container(
                      height: 220,
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/image/present.png'),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "恭喜你獲得一隻怪獸！ \n",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: BackgroundColorWarm, fontSize: 20),
                ),
                Text(
                  "${present_name}",
                  style: TextStyle(
                      color: BackgroundColorWarm,
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Manual())),
                      child: Container(
                        width: 105,
                        height: 45,
                        margin: EdgeInsets.only(
                          left: 30,
                          bottom: 3,
                        ),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            color: BackgroundColorWarm,
                            border: Border.all(
                                color: BackgroundColorWarm, width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0))),
                        child: Center(
                          child: Text(
                            "查看圖鑑",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 105,
                        height: 45,
                        margin: EdgeInsets.only(
                          right: 30,
                          bottom: 3,
                        ),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            color: BackgroundColorWarm,
                            border: Border.all(
                                color: BackgroundColorWarm, width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0))),
                        child: Center(
                          child: Text(
                            "謝謝",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
