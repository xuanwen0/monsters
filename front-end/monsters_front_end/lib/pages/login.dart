import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monsters_front_end/pages/home.dart';
import 'package:monsters_front_end/pages/login_selfacount.dart';

class LoginPage extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
      backgroundColor: const Color(0xfffffed4),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 42.0, end: 42.0),
            Pin(size: 312.0, start: 93.0),
            child:
                // Adobe XD layer: 'logo' (shape)
                Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/image/icon_main.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.005, 0.139),
            child: SizedBox(
              width: 225.0,
              height: 39.0,
              child: PageLink(
                links: [
                  PageLinkInfo(
                    transition: LinkTransition.Fade,
                    ease: Curves.easeOut,
                    duration: 0.3,
                    pageBuilder: () => Login_selfacount(),
                  ),
                ],
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffd8b963),
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 50.0, middle: 0.5029),
                      Pin(start: 3.0, end: 3.0),
                      child: Text(
                        '登入',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 20,
                          color: const Color(0xffffffff),
                        ),
                        softWrap: false,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.005, 0.283),
            child: SizedBox(
              width: 225.0,
              height: 39.0,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffd8b963),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 50.0, middle: 0.5029),
                    Pin(start: 3.0, end: 3.0),
                    child: Text(
                      '註冊',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 20,
                        color: const Color(0xffffffff),
                      ),
                      softWrap: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.005, 0.426),
            child: SizedBox(
              width: 225.0,
              height: 39.0,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 30.0, start: 15.0),
                    Pin(start: 5.0, end: 4.0),
                    child:
                        // Adobe XD layer: '2824095' (shape)
                        Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              const AssetImage('assets/image/icon_google.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 137.0, end: 23.0),
                    Pin(start: 5.0, end: 4.0),
                    child: Text(
                      '從Google登入',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 16,
                        color: const Color(0xffa0522d),
                      ),
                      softWrap: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.005, 0.57),
            child: SizedBox(
              width: 225.0,
              height: 39.0,
              child: Stack(
                children: <Widget>[
                  SizedBox.expand(
                      child: SvgPicture.string(
                    _svg_xppp1q,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  )),
                  Pinned.fromPins(
                    Pin(size: 30.0, start: 15.0),
                    Pin(start: 5.0, end: 4.0),
                    child:
                        // Adobe XD layer: 'appicon_01_f9ed1cf0…' (shape)
                        Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage('assets/image/icon_line.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 110.0, middle: 0.687),
                    Pin(start: 5.0, end: 4.0),
                    child: Text(
                      '從LINE登入',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 16,
                        color: const Color(0xffa0522d),
                      ),
                      softWrap: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 225.0, middle: 0.5027),
            Pin(size: 39.0, end: 106.0),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 30.0, start: 15.0),
                  Pin(start: 5.0, end: 4.0),
                  child:
                      // Adobe XD layer: 'Facebook-logo-2021' (shape)
                      Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            const AssetImage('assets/image/icon_facebook.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 165.0, end: 9.0),
                  Pin(start: 5.0, end: 4.0),
                  child: Text(
                    '從Facebook登入',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 16,
                      color: const Color(0xffa0522d),
                    ),
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_xppp1q =
    '<svg viewBox="94.0 580.0 225.0 39.0" ><path transform="translate(94.0, 580.0)" d="M 7 0 L 218 0 C 221.8659973144531 0 225 3.134006500244141 225 7 L 225 32 C 225 35.86599349975586 221.8659973144531 39 218 39 L 7 39 C 3.134006500244141 39 0 35.86599349975586 0 32 L 0 7 C 0 3.134006500244141 3.134006500244141 0 7 0 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
