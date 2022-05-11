import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monsters_front_end/pages/annoyance_resolve.dart';
import 'package:monsters_front_end/pages/history.dart';

class History_detail extends StatefulWidget {
  const History_detail({Key? key}) : super(key: key);

  @override
  _History_detailState createState() => _History_detailState();
}

class _History_detailState extends State<History_detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffffdeb),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 52.0, middle: 0.5),
            Pin(size: 54.0, end: 13.0),
            child: SvgPicture.string(
              _svg_oh6n4,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 88.0, end: 0.0),
            child: Stack(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      color: const Color(0xffffed97),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 69.0, start: 15.0),
            Pin(size: 68.0, start: 102.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xfff4a460),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 69.0, start: 15.0),
            Pin(size: 68.0, middle: 0.5662),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xfff4a460),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 223.0, middle: 0.5926),
            Pin(size: 60.0, start: 107.0),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.2),
                  child: SizedBox.expand(
                      child: SvgPicture.string(
                    _svg_nhjq4,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  )),
                ),
                Pinned.fromPins(
                  Pin(size: 149.0, end: 31.0),
                  Pin(size: 48.0, end: 0.0),
                  child: Text(
                    '寫下你的心情吧 ！\n',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 18,
                      color: const Color(0xffa0522d),
                    ),
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment(0.254, 0.1),
            child: SizedBox(
              width: 235.0,
              height: 93.0,
              child: Stack(
                children: <Widget>[
                  SizedBox.expand(
                      child: SvgPicture.string(
                    _svg_i382sl,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  )),
                  Pinned.fromPins(
                    Pin(size: 126.0, middle: 0.4954),
                    Pin(size: 24.0, start: 8.6),
                    child: Text(
                      '是否要畫心情？',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 18,
                        color: const Color(0xffa0522d),
                      ),
                      softWrap: false,
                    ),
                  ),
                  Align(
                    alignment: Alignment(-0.57, 0.14),
                    child: SizedBox(
                      width: 49.0,
                      height: 24.0,
                      child: Stack(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xffffed97),
                                      borderRadius: BorderRadius.circular(7.0),
                                    ),
                                  ),
                                ],
                              ),
                              Pinned.fromPins(
                                Pin(size: 18.0, middle: 0.5),
                                Pin(start: 0.0, end: 0.0),
                                child: Text(
                                  '是',
                                  style: TextStyle(
                                    fontFamily: 'Segoe UI',
                                    fontSize: 18,
                                    color: const Color(0xffa0522d),
                                  ),
                                  softWrap: false,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.527, 0.14),
                    child: SizedBox(
                      width: 49.0,
                      height: 24.0,
                      child: Stack(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xffffed97),
                                      borderRadius: BorderRadius.circular(7.0),
                                    ),
                                  ),
                                ],
                              ),
                              Pinned.fromPins(
                                Pin(size: 18.0, middle: 0.5),
                                Pin(start: 0.0, end: 0.0),
                                child: Text(
                                  '否',
                                  style: TextStyle(
                                    fontFamily: 'Segoe UI',
                                    fontSize: 18,
                                    color: const Color(0xffa0522d),
                                  ),
                                  softWrap: false,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 235.0, middle: 0.6328),
            Pin(size: 93.4, end: 90.8),
            child: Stack(
              children: <Widget>[
                SizedBox.expand(
                    child: SvgPicture.string(
                  _svg_s7xcmg,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                )),
                Pinned.fromPins(
                  Pin(size: 108.0, middle: 0.5157),
                  Pin(size: 24.0, start: 7.7),
                  child: Text(
                    '是否要分享？',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 18,
                      color: const Color(0xffa0522d),
                    ),
                    softWrap: false,
                  ),
                ),
                Align(
                  alignment: Alignment(-0.559, 0.134),
                  child: SizedBox(
                    width: 49.0,
                    height: 24.0,
                    child: Stack(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xffffed97),
                                    borderRadius: BorderRadius.circular(7.0),
                                  ),
                                ),
                              ],
                            ),
                            Pinned.fromPins(
                              Pin(size: 18.0, middle: 0.5),
                              Pin(start: 0.0, end: 0.0),
                              child: Text(
                                '是',
                                style: TextStyle(
                                  fontFamily: 'Segoe UI',
                                  fontSize: 18,
                                  color: const Color(0xffa0522d),
                                ),
                                softWrap: false,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.527, 0.134),
                  child: SizedBox(
                    width: 49.0,
                    height: 24.0,
                    child: Stack(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xffffed97),
                                    borderRadius: BorderRadius.circular(7.0),
                                  ),
                                ),
                              ],
                            ),
                            Pinned.fromPins(
                              Pin(size: 18.0, middle: 0.5),
                              Pin(start: 0.0, end: 0.0),
                              child: Text(
                                '否',
                                style: TextStyle(
                                  fontFamily: 'Segoe UI',
                                  fontSize: 18,
                                  color: const Color(0xffa0522d),
                                ),
                                softWrap: false,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 288.0, end: 28.0),
            Pin(size: 108.4, middle: 0.7279),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                  child: SizedBox.expand(
                      child: SvgPicture.string(
                    _svg_f7pmtp,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  )),
                ),
                Pinned.fromPins(
                  Pin(start: 40.0, end: 32.0),
                  Pin(size: 24.0, start: 8.6),
                  child: Text(
                    '為今天的心情打個分數吧！',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 18,
                      color: const Color(0xffa0522d),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 48.5, middle: 0.2976),
                  Pin(size: 66.0, end: 2.0),
                  child: Stack(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Pinned.fromPins(
                            Pin(start: 0.0, end: 0.0),
                            Pin(size: 23.2, start: 0.0),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xffffed97),
                                    borderRadius: BorderRadius.circular(7.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 9.0, middle: 0.5),
                            Pin(start: 0.0, end: 0.0),
                            child: Text(
                              '2\n\n',
                              style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 17,
                                color: const Color(0xffa0522d),
                              ),
                              softWrap: false,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 48.5, start: 22.8),
                  Pin(size: 44.0, middle: 0.6271),
                  child: Stack(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Pinned.fromPins(
                            Pin(start: 0.0, end: 0.0),
                            Pin(size: 23.2, start: 0.0),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xffffed97),
                                    borderRadius: BorderRadius.circular(7.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 9.0, middle: 0.5),
                            Pin(start: 0.0, end: 0.0),
                            child: Text(
                              '1\n',
                              style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 17,
                                color: const Color(0xffa0522d),
                              ),
                              softWrap: false,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 48.5, middle: 0.5002),
                  Pin(size: 66.0, end: 2.0),
                  child: Stack(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Pinned.fromPins(
                            Pin(start: 0.0, end: 0.0),
                            Pin(size: 23.2, start: 0.0),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xffffed97),
                                    borderRadius: BorderRadius.circular(7.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 9.0, middle: 0.5),
                            Pin(start: 0.0, end: 0.0),
                            child: Text(
                              '3\n\n',
                              style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 17,
                                color: const Color(0xffa0522d),
                              ),
                              softWrap: false,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment(0.405, 1.0),
                  child: SizedBox(
                    width: 49.0,
                    height: 68.0,
                    child: Stack(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Pinned.fromPins(
                              Pin(start: 0.0, end: 0.0),
                              Pin(size: 23.2, start: 0.0),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xffffed97),
                                      borderRadius: BorderRadius.circular(7.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 9.0, middle: 0.5),
                              Pin(start: 2.0, end: 0.0),
                              child: Text(
                                '4\n\n',
                                style: TextStyle(
                                  fontFamily: 'Segoe UI',
                                  fontSize: 17,
                                  color: const Color(0xffa0522d),
                                ),
                                softWrap: false,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 48.5, end: 22.7),
                  Pin(size: 66.0, end: 2.7),
                  child: Stack(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Pinned.fromPins(
                            Pin(start: 0.0, end: 0.0),
                            Pin(size: 23.2, start: 0.0),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xffffed97),
                                    borderRadius: BorderRadius.circular(7.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 9.0, middle: 0.5),
                            Pin(start: 0.0, end: 0.0),
                            child: Text(
                              '5\n\n',
                              style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 17,
                                color: const Color(0xffa0522d),
                              ),
                              softWrap: false,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 69.0, start: 17.0),
            Pin(size: 68.0, middle: 0.7127),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xfff4a460),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 69.0, start: 17.0),
            Pin(size: 68.0, end: 108.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xfff4a460),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 232.0, end: 11.0),
            Pin(size: 82.8, middle: 0.2533),
            child: SvgPicture.string(
              _svg_ujf864,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 88.0, start: 0.0),
            child: Stack(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      color: const Color(0xffffed97),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //箭頭
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
                  pageBuilder: () => History(),
                ),
              ],
              child: SvgPicture.string(
                _svg_c4osv9,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 232.0, end: 11.0),
            Pin(size: 82.8, middle: 0.3975),
            child: SvgPicture.string(
              _svg_z2zx0w,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 61.0, end: 61.0),
            Pin(size: 43.0, end: 22.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => Annoyance_resolve(),
                ),
              ],
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(6.0),
                      border: Border.all(
                          width: 2.0, color: const Color(0xffa0522d)),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(start: 35.0, end: 35.0),
                    Pin(size: 27.0, middle: 0.5),
                    child: Text(
                      '我已經解決這個煩惱了！',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 20,
                        color: const Color(0xffa0522d),
                      ),
                      softWrap: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_oh6n4 =
    '<svg viewBox="180.0 711.0 52.0 54.0" ><path transform="translate(180.0, 710.88)" d="M 25.54673194885254 54.12040328979492 C 21.82439994812012 54.05290222167969 18.86386680603027 50.56230926513672 18.9357967376709 46.32462692260742 C 18.94706535339355 45.6369514465332 19.03806304931641 44.97177505493164 19.19753074645996 44.33990478515625 L 18.9687328338623 44.33540344238281 L 19.1403923034668 34.1219482421875 L 7.389199733734131 34.1219482421875 L 7.115333080291748 34.1219482421875 L 7.115333080291748 34.11744689941406 C 3.16159987449646 33.98153305053711 0 30.9013843536377 0 27.12095642089844 C 0 23.34142684936523 3.16159987449646 20.26128196716309 7.115333080291748 20.12536430358887 L 7.115333080291748 20.11996459960938 L 19.37573432922363 20.11996459960938 L 19.58493232727051 7.673354625701904 L 19.59013175964355 7.388922691345215 L 19.5944652557373 7.388922691345215 C 19.79466438293457 3.285358190536499 22.81499862670898 0.05579237267374992 26.45413398742676 0.1223999261856079 C 30.09239959716797 0.1881073564291 33.00266265869141 3.524784803390503 33.06505966186523 7.632848262786865 L 33.06939315795898 7.633748531341553 L 32.85968780517578 20.11996459960938 L 42.69546508789062 20.11996459960938 L 42.69546508789062 20.35758972167969 C 43.30646133422852 20.2027759552002 43.94866180419922 20.11996459960938 44.61079788208008 20.11996459960938 C 48.69192886352539 20.11996459960938 51.99999618530273 23.25501823425293 51.99999618530273 27.12095642089844 C 51.99999618530273 30.98779296875 48.69192886352539 34.1219482421875 44.61079788208008 34.1219482421875 C 43.94866180419922 34.1219482421875 43.30646133422852 34.04004287719727 42.69546508789062 33.88432312011719 L 42.69546508789062 34.1219482421875 L 32.62451553344727 34.1219482421875 L 32.4488639831543 44.58023834228516 L 32.22006607055664 44.57573318481445 C 32.35873413085938 45.2130012512207 32.42719650268555 45.88088226318359 32.41506195068359 46.5694580078125 C 32.34469604492188 50.76549530029297 29.32918548583984 54.12139129638672 25.6562557220459 54.12140274047852 C 25.61980628967285 54.12140274047852 25.58330917358398 54.12107849121094 25.54673194885254 54.12040328979492 Z" fill="#ffed97" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_nhjq4 =
    '<svg viewBox="155.0 112.0 223.0 54.8" ><path transform="translate(155.0, 980.0)" d="M 20.36400604248047 -821.189697265625 L 19.99979972839355 -821.189697265625 C 8.954100608825684 -821.189697265625 0 -830.1447143554688 0 -841.1904296875 L 0 -847.9998168945312 C 0 -859.0455322265625 8.954100608825684 -867.9996337890625 19.99979972839355 -867.9996337890625 L 203.0004119873047 -867.9996337890625 C 214.0461120605469 -867.9996337890625 223.0001983642578 -859.0455322265625 223.0001983642578 -847.9998168945312 L 223.0001983642578 -841.1904296875 C 223.0001983642578 -830.1447143554688 214.0461120605469 -821.189697265625 203.0004119873047 -821.189697265625 L 34.30353546142578 -821.189697265625 L 20.23830032348633 -813.1527099609375 L 20.36400604248047 -821.189697265625 Z" fill="#ffffff" stroke="#ffed97" stroke-width="3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_i382sl =
    '<svg viewBox="106.0 289.6 235.0 93.4" ><path transform="translate(106.0, 1157.59)" d="M 21.45980262756348 -788.2767333984375 L 19.99979972839355 -788.2767333984375 C 8.954100608825684 -788.2767333984375 0 -797.2308349609375 0 -808.2764892578125 L 0 -847.9998168945312 C 0 -859.0455322265625 8.954100608825684 -867.9996337890625 19.99979972839355 -867.9996337890625 L 215.0001068115234 -867.9996337890625 C 226.0458068847656 -867.9996337890625 234.9999084472656 -859.0455322265625 234.9999084472656 -847.9998168945312 L 234.9999084472656 -808.2764892578125 C 234.9999084472656 -797.2308349609375 226.0458068847656 -788.2767333984375 215.0001068115234 -788.2767333984375 L 36.14965438842773 -788.2767333984375 L 21.32730102539062 -774.588623046875 L 21.45980262756348 -788.2767333984375 Z" fill="#ffffff" stroke="#ffed97" stroke-width="3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_s7xcmg =
    '<svg viewBox="112.0 593.8 235.0 93.4" ><path transform="translate(112.0, 1461.78)" d="M 21.45980262756348 -788.2767333984375 L 19.99979972839355 -788.2767333984375 C 8.954100608825684 -788.2767333984375 0 -797.2308349609375 0 -808.2764892578125 L 0 -847.9998168945312 C 0 -859.0455322265625 8.954100608825684 -867.9996337890625 19.99979972839355 -867.9996337890625 L 215.0001068115234 -867.9996337890625 C 226.0458068847656 -867.9996337890625 234.9999084472656 -859.0455322265625 234.9999084472656 -847.9998168945312 L 234.9999084472656 -808.2764892578125 C 234.9999084472656 -797.2308349609375 226.0458068847656 -788.2767333984375 215.0001068115234 -788.2767333984375 L 36.14965438842773 -788.2767333984375 L 21.32730102539062 -774.588623046875 L 21.45980262756348 -788.2767333984375 Z" fill="#ffffff" stroke="#ffed97" stroke-width="3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_f7pmtp =
    '<svg viewBox="96.0 661.8 288.0 93.4" ><path transform="translate(96.0, 1529.83)" d="M 26.30019950866699 -788.2767333984375 L 19.99979972839355 -788.2767333984375 C 8.954100608825684 -788.2767333984375 0 -797.2308349609375 0 -808.2764892578125 L 0 -847.9998168945312 C 0 -859.0455322265625 8.954100608825684 -867.9996337890625 19.99979972839355 -867.9996337890625 L 268.0002136230469 -867.9996337890625 C 279.0458984375 -867.9996337890625 288 -859.0455322265625 288 -847.9998168945312 L 288 -808.2764892578125 C 288 -797.2308349609375 279.0458984375 -788.2767333984375 268.0002136230469 -788.2767333984375 L 44.30284118652344 -788.2767333984375 L 26.1378002166748 -774.588623046875 L 26.30019950866699 -788.2767333984375 Z" fill="#ffffff" stroke="#ffed97" stroke-width="3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ujf864 =
    '<svg viewBox="169.0 176.1 232.0 82.8" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 401.0, 258.9)" d="M 19.99979972839355 82.8468017578125 C 8.954100608825684 82.8468017578125 0 73.8927001953125 0 62.84700012207031 L 0 32.13990020751953 C 0 21.09420013427734 8.954100608825684 12.14010047912598 19.99979972839355 12.14010047912598 L 21.18630218505859 12.14010047912598 L 21.05550003051758 0 L 35.68844985961914 12.14010047912598 L 212.0004119873047 12.14010047912598 C 223.0461120605469 12.14010047912598 232.0001983642578 21.09420013427734 232.0001983642578 32.13990020751953 L 232.0001983642578 62.84700012207031 C 232.0001983642578 73.8927001953125 223.0461120605469 82.8468017578125 212.0004119873047 82.8468017578125 L 19.99979972839355 82.8468017578125 Z" fill="#ffed97" stroke="none" stroke-width="3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_c4osv9 =
    '<svg viewBox="14.4 23.4 45.6 41.1" ><path transform="translate(8.76, 17.11)" d="M 47.28736877441406 22.92952919006348 L 19.54702568054199 22.92952919006348 L 30.30613327026367 13.09178352355957 C 31.84870529174805 11.54302215576172 31.84870529174805 9.040220260620117 30.30613327026367 7.491456031799316 C 28.76356315612793 5.942692756652832 26.26174545288086 5.942692756652832 24.70621109008789 7.491456031799316 L 6.791648864746094 24.09420013427734 C 6.013882637023926 24.81282615661621 5.624999046325684 25.79164695739746 5.624999046325684 26.86958694458008 L 5.624999046325684 26.91914939880371 C 5.624999046325684 27.99708938598633 6.013882637023926 28.97590446472168 6.791648864746094 29.69453430175781 L 24.69325065612793 46.29727935791016 C 26.24878120422363 47.84604263305664 28.75060272216797 47.84604263305664 30.29317092895508 46.29727935791016 C 31.83573913574219 44.74851226806641 31.83573913574219 42.2457160949707 30.29317092895508 40.69694900512695 L 19.5340633392334 30.85920524597168 L 47.27440643310547 30.85920524597168 C 49.46512222290039 30.85920524597168 51.24102020263672 29.08742141723633 51.24102020263672 26.89437294006348 C 51.25398254394531 24.66414642333984 49.47808074951172 22.92952919006348 47.28736877441406 22.92952919006348 Z" fill="#f4a460" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_z2zx0w =
    '<svg viewBox="169.0 276.3 232.0 82.8" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 401.0, 359.17)" d="M 19.99979972839355 82.8468017578125 C 8.954100608825684 82.8468017578125 0 73.8927001953125 0 62.84700012207031 L 0 32.13990020751953 C 0 21.09420013427734 8.954100608825684 12.14010047912598 19.99979972839355 12.14010047912598 L 21.18630218505859 12.14010047912598 L 21.05550003051758 0 L 35.68844985961914 12.14010047912598 L 212.0004119873047 12.14010047912598 C 223.0461120605469 12.14010047912598 232.0001983642578 21.09420013427734 232.0001983642578 32.13990020751953 L 232.0001983642578 62.84700012207031 C 232.0001983642578 73.8927001953125 223.0461120605469 82.8468017578125 212.0004119873047 82.8468017578125 L 19.99979972839355 82.8468017578125 Z" fill="#ffed97" stroke="none" stroke-width="3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
