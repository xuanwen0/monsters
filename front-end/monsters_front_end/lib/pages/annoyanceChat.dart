// ignore_for_file: use_key_in_widget_constructors, unnecessary_string_interpolations, prefer_const_constructors, file_names, avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monsters_front_end/pages/drawing_colors.dart';

class AnnoyanceChat extends StatefulWidget {
  @override
  _AnnoyanceChat createState() => _AnnoyanceChat();
}

class _AnnoyanceChat extends State<AnnoyanceChat> {
  final messageInsert = TextEditingController();
  int chatRound = 0;
  String username = "Sean";
  bool firstSpeaking = true;
  bool lastSpeaking = false;
  bool robotSpeakable = false;
  List<Map> messsages = [];
  List<String> annoyTypeMembers = ["", "課業", "事業", "愛情", "友情", "親情", "其他"];
  List<String> emotionGradeMembers = ["", "1", "2", "3", "4", "5"];
  List<String> acceptDrawingMembers = ["", "是", "否"];
  List<String> acceptSharingMembers = ["", "是", "否"];
  String hintAnnoyType = "[請擇一輸入]\n課業 / 事業 / 愛情 \n友情 / 親情 / 其他";
  String hintEmotionGrade = "[請擇一輸入]\n1 / 2 / 3 / 4 / 5";
  String hintAccept = "[請擇一輸入]\n是 / 否";
  String hintAnnoyMethod =
      "請選擇以下幾種方式開始記錄：\n★以文字記錄煩惱\n★按麥克風開始錄音\n★按相簿從手機存取\n★按相機開始照相或錄影";
  String hintCannotRead = "員工手冊上沒有這個選項耶...麻煩你確認一下答案好嗎？";
  String secHintAnnoyType = "煩惱是關於什麼的呢？";
  String secHintEmotionGrade = "煩惱指數有多高呢？\n1分是最低的喔！";
  String secHintDrawingAcception = "要不要把你的心情畫下來呢？";
  String secHintSharingAcception = "想分享給別人看看嗎？";
  String predictAns_annoyType = "";
  String predictAns_emotionGrade = "";
  String predictAns_accept = "";
  var userAnswers = [];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    if (firstSpeaking == true) {
      response("0");
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
            Flexible(
                child: ListView.builder(
                    reverse: true,
                    itemCount: messsages.length,
                    itemBuilder: (context, index) => chat(
                        messsages[index]["message"].toString(),
                        messsages[index]["data"]))),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration:
                  BoxDecoration(color: Color.fromRGBO(255, 237, 151, 1)),
              alignment: Alignment.bottomCenter,
              height: 60,
              //margin: EdgeInsets.only(bottom: 30),
              child: lastSpeaking == false
                  ? ListTile(
                      leading: IconButton(
                        alignment: Alignment.centerLeft,
                        icon: Icon(
                          Icons.camera_alt,
                          color: Color.fromARGB(255, 164, 78, 38),
                          size: 28,
                        ),
                        onPressed: () {},
                      ),
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
                      trailing: IconButton(
                          icon: Icon(
                            Icons.send,
                            size: 30.0,
                            color: Color.fromARGB(255, 164, 78, 38),
                          ),
                          onPressed: () {
                            if (messageInsert.text.isEmpty) {
                            } else {
                              setState(() {
                                robotSpeakable = true;
                                messsages.insert(0,
                                    {"data": 1, "message": messageInsert.text});
                              });
                              response(messageInsert.text);

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
                  : ListTile(
                      title: Container(
                        child: Text(
                          "怪獸正在工作中",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25, color: Colors.orange),
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

  Widget chat(String message, int data) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment:
            data == 1 ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          data == 0
              ? Container(
                  height: 50,
                  width: 50,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/image/Baku.png'),
                  ),
                )
              : Container(),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Bubble(
                radius: Radius.circular(15.0),
                color:
                    data == 0 ? Colors.white : Color.fromRGBO(255, 237, 151, 1),
                elevation: 2.0,
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

  void hint() {
    if (chatRound == 0) {
      reply(hintAnnoyType);
    } else if (chatRound == 1) {
      reply(hintAnnoyMethod);
    } else if (chatRound == 2) {
      reply(hintAccept);
    } else if (chatRound == 3) {
      reply(hintEmotionGrade);
    } else if (chatRound == 4) {
      reply(hintAccept);
    } else {
      reply("還想新增更多煩惱嗎，再找下一位同伴來幫忙吧！");
    }
  }

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

  void response([String? text]) async {
    setState(() {
      if (chatRound < 7) {
        if (robotSpeakable == true) {
          if (chatRound == 1) {
            if (annoyTypeMembers.contains(text)) {
              userAnswers.add(annoyTypeMembers.indexOf(text!));
              reply("關於$text的煩惱嗎？跟我說發生什麼事了吧！");
            } else {
              cannotRead();
            }
          }
          if (chatRound == 2) {
            userAnswers.add(text!);
            reply("真是辛苦你了，想做一幅畫表達你的感受嗎？");
          }
          if (chatRound == 3) {
            if (acceptDrawingMembers.contains(text)) {
              if (text == "是") {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Drawing_colors()));
              }
              userAnswers.add(text!);
              reply("給煩惱程度打一個分數～\n5分是最煩惱的喔！");
            } else {
              cannotRead();
            }
          }
          if (chatRound == 4) {
            if (emotionGradeMembers.contains(text)) {
              userAnswers.add(emotionGradeMembers.indexOf(text!));
              reply("想不想把這件事分享給別人呢？");
            } else {
              cannotRead();
            }
          }
          if (chatRound == 5) {
            if (acceptSharingMembers.contains(text)) {
              lastSpeaking = true;
              userAnswers.add(acceptSharingMembers.indexOf(text!));
              reply("解決煩惱請馬上跟我說！我已經迫不及待想吃飯了！");
            } else {
              cannotRead();
            }
          }
        }

        if (firstSpeaking == true) {
          firstSpeaking = false;
          int hourNow = DateTime.now().hour.toInt() + 8;
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

        hint();
        chatRound++;
      }
    });
  }

  void reply(String text) {
    messsages.insert(0, {"data": 0, "message": text});
  }
}
