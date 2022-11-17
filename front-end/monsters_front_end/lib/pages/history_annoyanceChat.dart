// ignore_for_file: use_key_in_widget_constructors, unnecessary_string_interpolations, prefer_const_constructors, file_names, avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names, camel_case_types
import 'dart:developer';
import 'dart:io';

import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monsters_front_end/model/annoyanceModel.dart';
import 'package:monsters_front_end/pages/Timer_Widget.dart';
import 'package:monsters_front_end/pages/manual.dart';
import 'package:monsters_front_end/pages/monsters_information.dart';
import 'package:monsters_front_end/pages/history.dart';
import 'package:monsters_front_end/pages/style.dart';
import 'package:video_player/video_player.dart';

import '../model/audio_Model/audio_player.dart';
import '../repository/annoyanceRepo.dart';

class historyAnnoyanceChat extends StatefulWidget {
  var data;
  historyAnnoyanceChat({required this.data});

  @override
  _historyAnnoyanceChat createState() => _historyAnnoyanceChat(data);
}

class _historyAnnoyanceChat extends State<historyAnnoyanceChat> {
  final messageInsert = TextEditingController();
  final timerController = TimerController();
  final player = AudioPlayer();
  late final VideoPlayerController _videoPlayerController;
  var data;
  //int choosedId;
  _historyAnnoyanceChat(this.data);
  int chatRound = 0;
  bool firstSpeaking = true;
  bool lastSpeaking = false;
  bool robotSpeakable = false;
  List<Map> messages = [];
  String hintAnnoyType = "[請擇一輸入]\n課業 / 事業 / 愛情 \n友情 / 親情 / 其他";
  String hintEmotionGrade = "[請擇一輸入]\n1 / 2 / 3 / 4 / 5";
  String hintAccept = "[請擇一輸入]\n是 / 否";
  String hintAnnoyMethod =
      "請選擇以下幾種方式開始記錄：\n★以文字記錄煩惱\n★按麥克風開始錄音\n★按相簿從手機存取\n★按相機開始照相或錄影";
  int finalId = 0;
  int solve = 0;
  List userAnswers = [];
  File? contentFile;
  File? moodFile;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    response();
    /**
     * 
            'id': value.data.elementAt(index).id,
            'avatar': value.data.elementAt(index).monsterId,
            'content': value.data.elementAt(index).content,
            'type': type,
            'monsterId': value.data.elementAt(index).monsterId,
            'time': value.data.elementAt(index).time,
            'solve': value.data.elementAt(index).solve,
     */
    response(data["type"]);
    response(data["content"]);
    response(data["mood"]);
    response(data["index"].toString());

    if (data["share"] == 0) {
      response("否");
    } else {
      response("是");
    }

    debugPrint(data["type"]);
    setState(() {});
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 164, 78, 38), //修改颜色
        ),
        backgroundColor: Color.fromRGBO(255, 237, 151, 1),
        elevation: 2.0,
        title: Text(getMonsterAvatarName_CH(),
            style: TextStyle(
                fontSize: 22, color: Color.fromARGB(255, 164, 78, 38))),
        centerTitle: true,
      ),
      body: Container(
        color: Color.fromARGB(255, 255, 255, 229),
        child: Column(
          children: <Widget>[
            Flexible(
                child: ListView.builder(
                    reverse: true,
                    itemCount: messages.length,
                    itemBuilder: (context, index) => chat(
                        messages[index]["message"].toString(),
                        messages[index]["data"]))),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration:
                  BoxDecoration(color: Color.fromRGBO(255, 237, 151, 1)),
              alignment: Alignment.bottomCenter,
              height: 60,
              //margin: EdgeInsets.only(bottom: 30),
              child: Container(
                child: TextButton(
                  child: getSolved() == false
                      ? Row(
                          children: [
                            GestureDetector(
                              onTap: () => popUp(context),
                              child: Container(
                                width: 220,
                                margin: EdgeInsets.only(
                                  left: 15,
                                  bottom: 3,
                                ),
                                padding: EdgeInsets.only(left: 13),
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                    color: BackgroundColorWarm,
                                    border: Border.all(
                                        color: BackgroundColorWarm, width: 2),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(50.0))),
                                child: Center(
                                  child: Text(
                                    "我解決煩惱了！",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            Container(
                              width: 110,
                              margin: EdgeInsets.only(
                                right: 15,
                                bottom: 3,
                              ),
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                  color: getShared()
                                      ? Colors.white
                                      : BackgroundColorWarm,
                                  border: Border.all(
                                      color: BackgroundColorWarm, width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50.0))),
                              child: Center(
                                child: Text(
                                  getShared() ? "取消分享" : "分享",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: getShared()
                                          ? BackgroundColorWarm
                                          : Colors.white),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Center(
                          child: Container(
                            width: 110,
                            margin: EdgeInsets.only(
                              right: 15,
                              bottom: 3,
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: getShared()
                                    ? Colors.white
                                    : BackgroundColorWarm,
                                border: Border.all(
                                    color: BackgroundColorWarm, width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0))),
                            child: Center(
                              child: Text(
                                getShared() ? "取消分享" : "分享",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: getShared()
                                        ? BackgroundColorWarm
                                        : Colors.white),
                              ),
                            ),
                          ),
                        ),
                  onPressed: () {},
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
                //左方巴古頭貼
                ? Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(width: 1, color: const Color(0xffa0522d)),
                    ),
                    height: 50,
                    width: 50,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        getMonsterAvatarPath(getMonsterAvatarName()),
                      ),
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
                backgroundImage:
                    AssetImage(getMonsterAvatarPath(getMonsterAvatarName())),
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
    String hintAnnoyMethod = "請用以下幾種方式記錄：\n★以文字記錄煩惱\n★點選左下角圖示新增";
    if (chatRound == 1) {
      reply(hintAnnoyMethod);
    } else if (chatRound == 3) {
      replyImage();
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
      if (robotSpeakable == false) {
        //取得類別
        if (chatRound == 1) {
          insert(text!);
          debugPrint("DEBUG");
          debugPrint(text);
          reply("關於" + text + "的煩惱嗎？跟我說發生什麼事了吧！");
        }
        //取得內容
        if (chatRound == 2) {
          insert(text!);
          reply("真是辛苦你了，想做一幅畫表達你的感受嗎？");
        }
        //取得是否畫心情
        if (chatRound == 3) {
          insert(text!);
          reply("給煩惱程度打一個分數～");
        }
        //取得心情分數
        if (chatRound == 4) {
          insert(text!);
          reply("想不想把這件事分享給別人呢？");
          log("--完成心情分數");
        }
        //取得是否分享
        if (chatRound == 5) {
          insert(text!);
          lastSpeaking = true;
          reply("解決煩惱請馬上跟我說！我已經迫不及待想吃飯了！");
          log(getSolved().toString());
          if (getSolved()) {
            insert("我解決煩惱了！");
            reply("剩下的交給${getMonsterAvatarName_CH()}吧！");
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

  //歷史文字回覆
  void insert(String text) {
    messages.insert(0, {"data": 1, "message": text});
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

  String getMonsterAvatarName() {
    return monsterNamesList[data["monsterId"]];
  }

  String getMonsterAvatarName_CH() {
    return monsterNamesList_CH[data["monsterId"]];
  }

  bool getSolved() {
    bool isSolved;
    if (data["solve"] == 1) {
      isSolved = true;
    } else {
      isSolved = false;
    }
    log("this is: " + isSolved.toString());
    return isSolved;
  }

  bool getShared() {
    bool isShared;
    if (data["share"] == 1) {
      isShared = true;
    } else {
      isShared = false;
    }
    return isShared;
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
            height: 250,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: BackgroundColorLight,
              border: Border.all(width: 5, color: BackgroundColorWarm),
              borderRadius: BorderRadius.circular(22.0),
            ),
            child: Center(
              child: Container(
                height: 180,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 30),
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: const BoxDecoration(
                  color: BackgroundColorLight,
                  image: DecorationImage(
                    image: AssetImage('assets/image/animatedImage/eating.gif'),
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
