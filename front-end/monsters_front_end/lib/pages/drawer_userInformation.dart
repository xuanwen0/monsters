// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Drawer_userInformation extends StatefulWidget {
  Drawer_userInformation({
    Key? key,
  }) : super(key: key);
  @override
  _Drawer_userInformationState createState() => _Drawer_userInformationState();
}

class _Drawer_userInformationState extends State<Drawer_userInformation> {
  @override
  Widget build(BuildContext context) {
    const String userName = '洪靖翔';
    const String userNickname = '阿翔';
    const String userGender = '男';
    const String userBirthday = '08/22';
    const String userMail = '10846028@ntub.edu.tw';
    return Scaffold(
      backgroundColor: const Color(0xfffffed4),
      body: Stack(
        children: <Widget>[
          //白底
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 544.0, start: 103.0),
            child: Container(
              color: const Color(0xffffffff),
            ),
          ),
          //上一頁
          Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back_rounded),
                color: Color(0xffffbb00),
                iconSize: 57.0,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )),
          //標題
          Pinned.fromPins(
            Pin(size: 200.0, middle: 0.5),
            Pin(size: 63.0, start: 20.0),
            child: Text(
              '個人資料',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 40,
                color: const Color(0xffa0522d),
              ),
              softWrap: false,
            ),
          ),
          //編輯紐
          Pinned.fromPins(
            Pin(size: 136.0, end: 25.0),
            Pin(size: 64.0, end: 33.0),
            child: Stack(
              children: <Widget>[
                //編輯底
                Stack(
                  children: <Widget>[
                    Pinned.fromPins(
                      Pin(size: 66.0, middle: 0.5),
                      Pin(start: 0.0, end: 0.0),
                      child: Container(
                        color: const Color(0xffffed97),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 70.0, start: 0.0),
                      Pin(start: 0.0, end: 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffffed97),
                          borderRadius: BorderRadius.all(
                              Radius.elliptical(9999.0, 9999.0)),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 70.0, end: 0.0),
                      Pin(start: 0.0, end: 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffffed97),
                          borderRadius: BorderRadius.all(
                              Radius.elliptical(9999.0, 9999.0)),
                        ),
                      ),
                    ),
                  ],
                ),
                Pinned.fromPins(
                  Pin(size: 80.0, middle: 0.5),
                  Pin(start: 6.0, end: 5.0),
                  child: Text(
                    '編輯',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 40,
                      color: const Color(0xffa0522d),
                    ),
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
          //頭貼
          Pinned.fromPins(
            Pin(size: 257.0, middle: 0.5),
            Pin(size: 178.0, start: 120.0),
            child: SizedBox(
              width: 257.0,
              height: 178.0,
              child: Stack(
                children: <Widget>[
                  //框
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      border: Border.all(
                          width: 1.0, color: const Color(0xffa0522d)),
                    ),
                  ),
                  //圖
                  Pinned.fromPins(
                    Pin(size: 140, middle: 0.5),
                    Pin(start: 26.1, end: 26.1),
                    child:
                        // Adobe XD layer: 'baku_chat' (shape)
                        Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        image: DecorationImage(
                          image: const AssetImage('assets/image/baku1.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //個人資料列
          Pinned.fromPins(
            Pin(start: 50.0, end: 61.0),
            Pin(size: 301.0, middle: 0.7),
            child: Center(
                child: SingleChildScrollView(
              primary: false,
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 20,
                runSpacing: 20,
                children: [
                  {
                    'text': '姓名',
                    'content': userName,
                  },
                  {
                    'text': '暱稱',
                    'content': userNickname,
                  },
                  {
                    'text': '性別',
                    'content': userGender,
                  },
                  {
                    'text': '生日',
                    'content': userBirthday,
                  },
                  {
                    'text': '信箱',
                    'content': userMail,
                  }
                ].map((itemData) {
                  final text = itemData['text']!;
                  final content = itemData['content']!;
                  return SizedBox(
                    width: 300.0,
                    height: 40.0,
                    child: Stack(
                      children: <Widget>[
                        //標
                        Pinned.fromPins(
                          Pin(size: 60.0, start: 0.0),
                          Pin(start: 0.0, end: 0.0),
                          child: Text(
                            text,
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 30,
                              color: const Color(0xffa0522d),
                            ),
                            softWrap: false,
                          ),
                        ),
                        //底線
                        Pinned.fromPins(
                          Pin(size: 168.0, end: 0.0),
                          Pin(size: 1.0, end: 6.0),
                          child: SvgPicture.string(
                            _svg_pjak95,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                        //內容
                        Pinned.fromPins(
                          Pin(size: 200.0, middle: 1.4),
                          Pin(size: 25.0, end: 7.0),
                          child: Text(
                            content,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 18,
                              color: const Color(0xff000000),
                            ),
                            softWrap: false,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            )),
          ),
        ],
      ),
    );
  }
}

const String _svg_pjak95 =
    '<svg viewBox="167.0 404.0 168.0 1.0" ><path transform="translate(167.0, 404.0)" d="M 0 0 L 168 0" fill="none" stroke="#a0522d" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_s6wsvh =
    '<svg viewBox="144.8 189.1 122.4 125.9" ><path transform="translate(138.8, 183.06)" d="M 67.2003173828125 68.94334411621094 C 84.10691070556641 68.94334411621094 97.80047607421875 54.85977935791016 97.80047607421875 37.47167205810547 C 97.80047607421875 20.08357048034668 84.10691070556641 5.999998092651367 67.2003173828125 5.999998092651367 C 50.29373168945312 5.999998092651367 36.60015869140625 20.08357048034668 36.60015869140625 37.47167205810547 C 36.60015869140625 54.85977935791016 50.29373168945312 68.94334411621094 67.2003173828125 68.94334411621094 Z M 67.2003173828125 84.67918395996094 C 46.77471160888672 84.67918395996094 6 95.22219848632812 6 116.1508560180664 L 6 131.8866882324219 L 128.400634765625 131.8866882324219 L 128.400634765625 116.1508560180664 C 128.400634765625 95.22219848632812 87.62593078613281 84.67918395996094 67.2003173828125 84.67918395996094 Z" fill="#a0522d" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
