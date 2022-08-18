// ignore_for_file: use_key_in_widget_constructors, unnecessary_string_interpolations, prefer_const_constructors, file_names, avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names
import 'dart:developer';
import 'dart:io';
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:monsters_front_end/API/audio_player.dart';
import 'package:monsters_front_end/pages/Timer_Widget.dart';
import 'package:monsters_front_end/pages/drawing_colors.dart';
import 'package:monsters_front_end/pages/history.dart';
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
  final player = AudioPlayer();
  final timerController = TimerController();
  int chatRound = 0;
  String username = "Sean";
  bool lastSpeaking = false;
  bool robotSpeakable = true;
  bool pickable = false;

  List<Map> messages = [];
  List<String> annoyTypeMembers = ["", "課業", "事業", "愛情", "友情", "親情", "其他"];
  List<String> emotionGradeMembers = ["", "1", "2", "3", "4", "5"];
  List<String> acceptDrawingMembers = ["", "是", "否"];
  int acceptShare = 0;
  String hintAnnoyType = "[請擇一輸入]\n課業 / 事業 / 愛情 \n友情 / 親情 / 其他";
  String hintEmotionGrade = "[請擇一輸入]\n1 / 2 / 3 / 4 / 5";
  String hintAccept = "[請擇一輸入]\n是 / 否";
  String hintAnnoyMethod = "請用以下幾種方式記錄：\n★以文字記錄煩惱\n★點選左下角圖示新增";
  String hintCannotRead = "員工手冊上沒有這個選項耶...麻煩確認一下答案好嗎？";
  String secHintAnnoyType = "煩惱是關於什麼的呢？";
  String secHintEmotionGrade = "煩惱指數有多高呢？\n1分是最低的喔！";
  String secHintDrawingAcception = "要不要把你的心情畫下來呢？";
  String secHintSharingAcception = "想分享給別人看看嗎？";
  String predictAns_annoyType = "";
  String predictAns_emotionGrade = "";
  String predictAns_accept = "";
  var userAnswers = [];

  File? _media;
  File? _moodImage;
  late final VideoPlayerController _videoPlayerController;

  //新增煩惱-照相
  takePhoto() async {
    final media = await ImagePicker().pickImage(source: ImageSource.camera);
    if (media == null) return;
    final imageTemporary = File(media.path);

    this._media = imageTemporary;
    if (_media != null) {
      messages.insert(0, {"data": 2, "image": _media});
      response(null, _media);
    }
    setState(() {});
  }

  //新增煩惱-錄影
  recordVideo() async {
    XFile? recordedVideo = await ImagePicker().pickVideo(
        source: ImageSource.camera, maxDuration: Duration(seconds: 15));
    if (recordedVideo == null) return;
    _media = File(recordedVideo.path);
    _videoPlayerController = VideoPlayerController.file(_media!)
      ..initialize().then((_) {
        messages.insert(0, {"data": 3, "video": _media});
        _videoPlayerController.play();
        response(null, _media);
      });
    setState(() {});
  }

  //新增煩惱-相簿匯入照片
  pickPhoto() async {
    final media = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (media == null) return;
    final imageTemporary = File(media.path);

    this._media = imageTemporary;
    if (_media != null) {
      messages.insert(0, {"data": 2, "image": _media});
      response(null, _media);
    }
    setState(() {});
  }

  //新增煩惱-相簿匯入影片
  pickVideo() async {
    XFile? pickedVideo =
        await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (pickedVideo == null) return;
    _media = File(pickedVideo.path);
    _videoPlayerController = VideoPlayerController.file(_media!)
      ..initialize().then((_) {
        messages.insert(0, {"data": 3, "video": _media});
        _videoPlayerController.play();
        response(null, _media);
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
    this._media = audioTemporary;
    if (_media != null) {
      messages.insert(0, {"data": 4, "audio": _media});
      response(null, _media);
    }
    setState(() {});
  }

  //畫心情功能
  _navigateAndDisplayPaint(BuildContext context) async {
    final moodImage = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Draw_mood()),
    );
    if (moodImage == null) {
      reply("畫心情失敗，請通知官方平台");
    } else {
      final imageTemporary = File(moodImage.path);
      this._moodImage = imageTemporary;
      messages.insert(0, {"data": 5, "image": _moodImage});
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
                  //前往歷史紀錄
                  : ListTile(
                      title: Container(
                        child: TextButton(
                          child: Container(
                            width: 250,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromARGB(255, 255, 255, 229),
                                    width: 3),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0))),
                            child: Text(
                              "前往歷史紀錄",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 30, color: Colors.black),
                            ),
                          ),
                          onPressed: () {
                            log(userAnswers.toString());
/* 新增煩惱
                            annoyanceRepository.createAnnoyance(
                              Annoyance(
                                  id: 0,
                                  account: 'Lin',
                                  content: userAnswers[1],
                                  monsterId: 1,
                                  type: userAnswers[0],
                                  mood: userAnswers[2],
                                  index: userAnswers[3],
                                  time: '',
                                  solve: 0,
                                  share: acceptShare),
                            );
*/
/* 前往歷史紀錄                           
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => History()));
                          
*/
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
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/image/Baku.png'),
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
                                child: Image.file(_media!,
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
                                child: Image.file(_moodImage!,
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

    return userChatContainer;
  }

  //怪獸訊息(提示輸入格式)
  void hint() {
    if (chatRound == 0) {
      reply(hintAnnoyType);
    } else if (chatRound == 1) {
      pickable = true;
      reply(hintAnnoyMethod);
    } else if (chatRound == 2) {
      pickable = false;
      reply(hintAccept);
    } else if (chatRound == 3) {
      reply(hintEmotionGrade);
    } else if (chatRound == 4) {
      reply(hintAccept);
    } else {
      reply("還想新增更多煩惱嗎，再找下一位同伴來幫忙吧！");
    }
  }

  //提示輸入格式錯誤
  void cannotRead() {
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

  //確認是否符合選擇格式，符合->回覆 不符合->提示再次輸入
  Future<void> response([String? text, File? media]) async {
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
          } else {
            cannotRead();
          }
        }
        //取得內容
        if (chatRound == 2) {
          log("--完成類別");
          if (text != null) {
            userAnswers.add(text);
          }
          if (media != null) {
            userAnswers.add(media);
          }
          reply("真是辛苦你了，想做一幅畫表達你的感受嗎？");
        }
        //取得是否畫心情
        if (chatRound == 3) {
          log("--完成內容");
          if (acceptDrawingMembers.contains(text)) {
            if (text == "是") {
              await _navigateAndDisplayPaint(context);
            }
            userAnswers.add(text);
            //提示輸入煩惱程度
            reply("給煩惱程度打一個分數～\n5分是最煩惱的喔！");
          } else {
            cannotRead();
          }
        }
        //取得心情分數
        if (chatRound == 4) {
          log("--完成畫心情");
          if (emotionGradeMembers.contains(text)) {
            userAnswers.add(emotionGradeMembers.indexOf(text!));
            reply("想不想把這件事分享給別人呢？");
          } else {
            cannotRead();
          }
        }
        //取得是否分享
        if (chatRound == 5) {
          log("--完成心情分數");
          if (acceptShare == 0 || acceptShare == 1) {
            if (text == "是") {
              userAnswers.add(emotionGradeMembers.indexOf("1"));
              acceptShare = 1;
            } else if (text == "否") {
              acceptShare = 0;
              userAnswers.add(emotionGradeMembers.indexOf("0"));
            }
            lastSpeaking = true;
            reply("解決煩惱請馬上跟我說！我已經迫不及待想吃飯了！");
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
