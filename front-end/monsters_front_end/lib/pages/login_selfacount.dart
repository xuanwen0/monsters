import 'package:adobe_xd/page_link.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:monsters_front_end/pages/home.dart';

class Login_selfacount extends StatefulWidget {
  @override
  _Login_selfacountState createState() => _Login_selfacountState();
}

class _Login_selfacountState extends State<Login_selfacount> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _accountController = TextEditingController();
    TextEditingController _pwdController = TextEditingController();
    GlobalKey _formKey = GlobalKey<FormState>();

    return Scaffold(
      key: _formKey, //设置globalKey，用于后面获取FormState
      backgroundColor: const Color(0xfffffed4),
      body: Stack(
        children: <Widget>[
          //標題
          Pinned.fromPins(
            Pin(size: 94.0, middle: 0.5),
            Pin(size: 63.0, start: 11.0),
            child: Text(
              '登入',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 47,
                color: Color.fromRGBO(160, 82, 45, 1),
              ),
              softWrap: false,
            ),
          ),
          //帳號輸入框
          Pinned.fromPins(
              Pin(size: 260.0, end: 31.0), Pin(size: 54.0, middle: 0.308),
              child: TextFormField(
                autofocus: true,
                controller: _accountController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    ///設定邊框四個角的弧度
                    borderRadius: BorderRadius.all(Radius.circular(90)),

                    ///用來配置邊框的樣式
                    borderSide: BorderSide(
                      ///設定邊框的顏色
                      color: Color.fromRGBO(160, 82, 45, 1),
                      width: 2.0,
                    ),
                  ),
                  fillColor: Color.fromRGBO(255, 255, 255, 1),
                  filled: true,
                ),
              )),
          //password輸入框
          Pinned.fromPins(
            Pin(size: 260.0, end: 31.0),
            Pin(size: 54.0, middle: 0.442),
            child: TextFormField(
              controller: _pwdController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  ///設定邊框四個角的弧度
                  borderRadius: BorderRadius.all(Radius.circular(90)),

                  ///用來配置邊框的樣式
                  borderSide: BorderSide(
                    ///設定邊框的顏色
                    color: Color.fromRGBO(160, 82, 45, 1),
                    width: 2.0,
                  ),
                ),
                fillColor: Color.fromRGBO(255, 255, 255, 1),
                filled: true,
              ),
              obscureText: true,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 60.0, start: 31.0),
            Pin(size: 40.0, middle: 0.3117),
            child: Text(
              '帳號',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 30,
                color: Color.fromRGBO(160, 82, 45, 1),
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 60.0, start: 31.0),
            Pin(size: 40.0, middle: 0.4431),
            child: Text(
              '密碼',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 30,
                color: Color.fromRGBO(160, 82, 45, 1),
              ),
              softWrap: false,
            ),
          ),
          const Align(
            alignment: Alignment(-0.205, 0.06),
            child: SizedBox(
              width: 80.0,
              height: 27.0,
              child: Text(
                '忘記密碼',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 20,
                  color: Color.fromRGBO(136, 136, 136, 1),
                ),
                softWrap: false,
              ),
            ),
          ),
          //登入button
          Align(
            alignment: const Alignment(0.005, 0.304),
            child: SizedBox(
              width: 199.0,
              height: 60.0,
              child: Stack(
                children: <Widget>[
                  PageLink(
                      links: [
                        PageLinkInfo(
                          transition: LinkTransition.Fade,
                          ease: Curves.easeOut,
                          duration: 0.3,
                          pageBuilder: () => MainPage(),
                        ),
                      ],
                      child: Stack(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(160, 82, 45, 1),
                              borderRadius: BorderRadius.circular(22.0),
                            ),
                          ),
                          const Align(
                            alignment: Alignment(-0.007, 0.0),
                            child: SizedBox(
                              width: 60.0,
                              height: 40.0,
                              child: Text(
                                '登入',
                                style: TextStyle(
                                  fontFamily: 'Segoe UI',
                                  fontSize: 30,
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                ),
                                softWrap: false,
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
