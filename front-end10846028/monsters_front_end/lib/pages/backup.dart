// ignore_for_file: use_key_in_widget_constructors, unnecessary_string_interpolations, prefer_const_constructors, file_names, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';

class trying extends StatefulWidget {
  @override
  _trying createState() => _trying();
}

class _trying extends State<trying> {
  final messageInsert = TextEditingController();
  List<Map> messsages = [];
  int chatRound = 0;
  String robotReply = "";
  String username = "Sean";
  bool firstSpeaking = true;
  bool robotSpeakable = false;

  void reply(String text) {
    messsages.insert(0, {"data": 0, "message": text});
  }

  void response([String? text]) async {
    setState(() {
      if (robotSpeakable == true) {
        if (chatRound == 1) {
          reply("first reply");
        }
        if (chatRound == 2) {
          reply("second reply");
        }
      }

      if (firstSpeaking == true) {
        firstSpeaking = false;
        int hourNow = DateTime.now().hour.toInt() + 8;
        if (hourNow < 5) {
          reply("凌晨睡不好嗎？"); //0~5點
        } else if (hourNow < 12) {
          reply("早上好啊！"); //5~12點
        } else if (hourNow < 14) {
          reply("中午好啊！"); //12~14點
        } else {
          reply("下午好啊！"); //14~24點
        }
        reply("有甚麼想分享的煩惱嗎？");
      }

      robotSpeakable = false;
      chatRound++;
    });
  }

  @override
  Widget build(BuildContext context) {
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
        title: Text("MonsterName",
            style: TextStyle(color: Color.fromARGB(255, 164, 78, 38))),
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
              //margin: EdgeInsets.only(bottom: 30),
              child: ListTile(
                leading: IconButton(
                  icon: Icon(
                    Icons.camera_alt,
                    color: Color.fromARGB(255, 164, 78, 38),
                    size: 30,
                  ),
                  onPressed: () {},
                ),
                title: Container(
                  height: 30,
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.only(left: 12),
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
                    style: TextStyle(fontSize: 16, color: Colors.black),
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
                          messsages.insert(
                              0, {"data": 1, "message": messageInsert.text});
                        });
                        response(messageInsert.text);
                        messageInsert.clear();
                      }
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //for better one i have use the bubble package check out the pubspec.yaml

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
                    backgroundImage: AssetImage("images/robot.jpg"),
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
                              fontWeight: FontWeight.normal),
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
}
