// ignore_for_file: use_key_in_widget_constructors, unnecessary_string_interpolations, prefer_const_constructors, file_names, avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names
import 'dart:developer';
import 'dart:io';
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:monsters_front_end/main.dart';
import 'package:monsters_front_end/model/audio_Model/audio_player.dart';
import 'package:monsters_front_end/pages/Timer_Widget.dart';
import 'package:monsters_front_end/pages/manual.dart';
import 'package:monsters_front_end/pages/monsters_information.dart';
import 'package:monsters_front_end/pages/drawing_colors.dart';
import 'package:monsters_front_end/pages/history.dart';
import 'package:monsters_front_end/pages/style.dart';
import 'package:video_player/video_player.dart';
import '../model/annoyanceModel.dart';
import '../repository/annoyanceRepo.dart';
import 'package:monsters_front_end/pages/audio_main.dart';

class AnnoyanceChat extends StatefulWidget {
  @override
  _AnnoyanceChat createState() => _AnnoyanceChat();
}

class _AnnoyanceChat extends State<AnnoyanceChat> with WidgetsBindingObserver {
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
  //TODO: LEVEL 3
  ///when user comes after using interactionPage and some feature
  ///we can ask whether that stuff make it feels better
  var userAnswers = [];
  File? contentFile;
  File? moodFile;

  @override
  void dispose() {
    messageInsert.dispose();
    super.dispose();
  }

  void init() {
    super.initState();
  }

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
    //TODO: Level 2
    ///ADD HERO https://youtu.be/1xipg02Wu8s?t=657
    final media = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AudioMainPage()),
    );

    if (media == null) return;
    final audioTemporary = File(media);
    this.contentFile = audioTemporary;
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
    final AnnoyanceRepository annoyanceRepository = AnnoyanceRepository();
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
                                            //照相選項
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
                  : Container(
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
                          // log("user_Account: " + user_Account.toString());
                          // log("type:" + userAnswers[0].toString());
                          // log("content: " + userAnswers[1].toString());
                          // log("mood: " + userAnswers[2].toString());
                          // log("index: " + userAnswers[3].toString());
                          // log("share: " + userAnswers[4].toString());
                          // log("moodFile: " + moodFile.toString());
                          // log("contentFile: " + contentFile.toString());
                          annoyanceRepository.createAnnoyance(
                            Annoyance(
                              id: 0,
                              account: user_Account, //"Lin"
                              monsterId: 1,
                              type: userAnswers[0], //4
                              content: userAnswers[1], //"純文字不分享無多媒體"
                              mood: userAnswers[2], //"否"
                              index: userAnswers[3], //3
                              share: userAnswers[4], //0
                              contentFile: contentFile, //null
                              moodFile: moodFile, //null
                              time: '',
                              solve: 0,
                            ),
                          );
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
            Container(color: Color.fromRGBO(255, 237, 151, 1), height: 10),
          ],
        ),
      ),
    );
  }

  //聊天功能
  Widget chat(String message, int data) {
    Container chatContainer = Container();
    //text container
    if (data < 2) {
      chatContainer = Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment:
              data == 1 ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            data == 0
                //巴古頭貼
                ? Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(width: 1, color: const Color(0xffa0522d)),
                    ),
                    height: 50,
                    width: 50,
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
      //TODO: Level 2
      //ADD HERO https://youtu.be/1xipg02Wu8s?t=657
      ///wrap by something make it clickable
      chatContainer = Container(
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
      ///TODO: Level 2
      ///ADD HERO https://youtu.be/1xipg02Wu8s?t=657
      ///wrap by something make it clickable
      chatContainer = Container(
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
      chatContainer = Container(
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
      chatContainer = Container(
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
      chatContainer = Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: 50,
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
                                child: annoyancePointRow()))
                      ],
                    ),
                  )),
            ),
          ],
        ),
      );
    }

    return chatContainer;
  }

  //怪獸訊息(提示輸入格式)
  void hint() {
    String hintAnnoyType = "[請擇一輸入]\n課業 / 事業 / 愛情 \n友情 / 親情 / 其他";
    String hintAccept = "[請擇一輸入]\n是 / 否";
    String hintAnnoyMethod = "請用以下幾種方式記錄：\n★以文字記錄煩惱\n★點選左下角圖示新增";

    if (chatRound == 0) {
      reply(hintAnnoyType);
    } else if (chatRound == 1) {
      pickable = true;
      reply(hintAnnoyMethod);
    } else if (chatRound == 2) {
      pickable = false;
      reply(hintAccept);
    } else if (chatRound == 3) {
      replyImage();
    } else if (chatRound == 4) {
      reply(hintAccept);
    } else {
      reply("還想新增更多煩惱嗎，再找下一位同伴來幫忙吧！");
    }
  }

  //確認是否符合選擇格式，符合->回覆 不符合->提示再次輸入
  Future<void> response([String? text, File? media]) async {
    List<String> annoyTypeMembers = ["", "課業", "事業", "愛情", "友情", "親情", "其他"];
    List<String> emotionGradeMembers = ["", "1", "2", "3", "4", "5"];
    List<String> acceptDrawingMembers = ["是", "否"];
    //進入時自動訊息問安
    if (chatRound == 0) {
      int hourNow = DateTime.now().hour.toInt();
      if (hourNow < 5) {
        reply("凌晨睡不好嗎？\n有甚麼煩惱都可以跟我說"); //0~5點
      } else if (hourNow < 12) {
        reply("早上好啊！\n發生甚麼事情都可以跟我說"); //5~12點
      } else if (hourNow < 14) {
        reply("中午好啊！\n午餐吃了嗎？發生任何事都可以找我聊聊"); //12~14點
      } else {
        reply("下午好，今天過得如何呀！正在煩惱什麼事情嗎?"); //14~24點
      }
      reply("什麼樣子的煩惱呢？");
    }

    if (chatRound < 7) {
      if (robotSpeakable == true) {
        //取得類別
        if (chatRound == 1) {
          if (annoyTypeMembers.contains(text)) {
            userAnswers.add(annoyTypeMembers.indexOf(text!));
            reply("關於" + text + "的煩惱嗎？跟我說發生什麼事了吧！");
            log("--完成類別");
          } else {
            cannotRead();
          }
        }
        //取得內容
        if (chatRound == 2) {
          if (text != null) {
            userAnswers.add(text);
          } else {
            userAnswers.add(null);
          }
          log("--完成內容");
          reply("真是辛苦你了，想做一幅畫表達你的感受嗎？");
        }
        //取得是否畫心情
        if (chatRound == 3) {
          if (acceptDrawingMembers.contains(text)) {
            if (text == "是") {
              await _navigateAndDisplayPaint(context);
            }
            userAnswers.add(text);
            //提示輸入煩惱程度
            // reply("給煩惱程度打一個分數～\n5分是最煩惱的喔！");
            reply("給煩惱程度打一個分數～");
            log("--完成畫心情");
          } else {
            cannotRead();
          }
        }
        //取得心情分數
        if (chatRound == 4) {
          if (emotionGradeMembers.contains(text)) {
            userAnswers.add(emotionGradeMembers.indexOf(text!));
            reply("想不想把這件事分享給別人呢？");

            log("--完成心情分數");
          } else {
            cannotRead();
          }
        }
        //取得是否分享
        if (chatRound == 5) {
          if (text != "是" || text != "否") {
            if (text == "是") {
              userAnswers.add(1);
            }
            if (text == "否") {
              userAnswers.add(0);
            }
            lastSpeaking = true;
            reply("解決煩惱請馬上跟我說！我已經迫不及待想吃飯了！");
            reply("（歷史記錄點擊單一煩惱後按下完成按鈕！）");

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

  //怪獸文字回覆
  void reply(String text) {
    messages.insert(0, {"data": 0, "message": text});
  }

  void replyImage() {
    messages.insert(0, {"data": 6, "message": "print image"});
  }

  Row annoyancePointRow() {
    Row annoyancePointRow = Row();
    annoyancePointRow = Row(
      children: [
        annoyancePointColumn("1"),
        Spacer(),
        annoyancePointColumn("2"),
        Spacer(),
        annoyancePointColumn("3"),
        Spacer(),
        annoyancePointColumn("4"),
        Spacer(),
        annoyancePointColumn("5"),
        Spacer(),
      ],
    );

    return annoyancePointRow;
  }

  Column annoyancePointColumn(String point) {
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

  //提示輸入格式錯誤
  void cannotRead() {
    String hintCannotRead = "員工手冊上沒有這個選項耶...麻煩確認一下答案好嗎？";
    String secHintAnnoyType = "煩惱是關於什麼的呢？";
    String secHintEmotionGrade = "煩惱指數有多高呢？\n1分是最低的喔！";
    String secHintDrawingAcception = "要不要把你的心情畫下來呢？";
    String secHintSharingAcception = "想分享給別人看看嗎？";
    chatRound--;
    reply(hintCannotRead);
    if (chatRound == 0) {
      reply(secHintAnnoyType);
    }
    if (chatRound == 2) {
      reply(secHintDrawingAcception);
    }
    if (chatRound == 3) {
      reply(secHintEmotionGrade);
    }
    if (chatRound == 4) {
      reply(secHintSharingAcception);
    }
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
