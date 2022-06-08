import 'package:adobe_xd/page_link.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:monsters_front_end/pages/home.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monsters_front_end/pages/login.dart';

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
      resizeToAvoidBottomInset: false,
      key: _formKey, //设置globalKey，用于后面获取FormState
      backgroundColor: const Color(0xfffffed4),
      body: Stack(
        children: <Widget>[
          //標題
          Pinned.fromPins(
            Pin(size: 94.0, middle: 0.5),
            Pin(size: 63.0, start: 100.0),
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
              Pin(size: 230.0, end: 31.0), Pin(size: 54.0, middle: 0.308),
              child: TextFormField(
                autofocus: false,
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
            Pin(size: 230.0, end: 31.0),
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
              textAlign: TextAlign.left,
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
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 30,
                color: Color.fromRGBO(160, 82, 45, 1),
              ),
              softWrap: false,
            ),
          ),
          const Align(
            alignment: Alignment(0.0, 0.06),
            child: SizedBox(
              width: 199.0,
              height: 27.0,
              child: Text(
                '忘記密碼',
                textAlign: TextAlign.center,
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
                            alignment: Alignment(0.0, 0.0),
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

          Pinned.fromPins(
            Pin(size: 45.6, start: 14.4),
            Pin(size: 41.1, start: 23.4),
            child:
                // Adobe XD layer: 'Icon ionic-md-arrow…' (shape)
                PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => LoginPage(),
                ),
              ],
              child: SvgPicture.string(
                _svg_ryq30,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_ryq30 =
    '<svg viewBox="13.7 21.9 45.6 41.1" ><path transform="translate(8.07, 15.61)" d="M 47.28736877441406 22.92952919006348 L 19.54702568054199 22.92952919006348 L 30.30613327026367 13.09178352355957 C 31.84870529174805 11.54302215576172 31.84870529174805 9.040220260620117 30.30613327026367 7.491456031799316 C 28.76356315612793 5.942692756652832 26.26174545288086 5.942692756652832 24.70621109008789 7.491456031799316 L 6.791648864746094 24.09420013427734 C 6.013882637023926 24.81282615661621 5.624999046325684 25.79164695739746 5.624999046325684 26.86958694458008 L 5.624999046325684 26.91914939880371 C 5.624999046325684 27.99708938598633 6.013882637023926 28.97590446472168 6.791648864746094 29.69453430175781 L 24.69325065612793 46.29727935791016 C 26.24878120422363 47.84604263305664 28.75060272216797 47.84604263305664 30.29317092895508 46.29727935791016 C 31.83573913574219 44.74851226806641 31.83573913574219 42.2457160949707 30.29317092895508 40.69694900512695 L 19.5340633392334 30.85920524597168 L 47.27440643310547 30.85920524597168 C 49.46512222290039 30.85920524597168 51.24102020263672 29.08742141723633 51.24102020263672 26.89437294006348 C 51.25398254394531 24.66414642333984 49.47808074951172 22.92952919006348 47.28736877441406 22.92952919006348 Z" fill="#ffbb00" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
