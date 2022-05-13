import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Drawer_settings extends StatefulWidget {
  Drawer_settings({
    Key? key,
  }) : super(key: key);
  @override
  _Drawer_settingsState createState() => _Drawer_settingsState();
}

class _Drawer_settingsState extends State<Drawer_settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffffed4),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 546.0, start: 101.0),
            child: Container(
              color: const Color(0xffffffff),
            ),
          ),
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
          Pinned.fromPins(
            Pin(size: 94.0, middle: 0.5),
            Pin(size: 63.0, start: 11.0),
            child: Text(
              '設定',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 47,
                color: const Color(0xffa0522d),
              ),
              softWrap: false,
            ),
          ),
          Align(
            alignment: Alignment(0.0, -0.443),
            child: SizedBox(
              width: 265.0,
              height: 53.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(size: 80.0, start: 0.0),
                    Pin(start: 0.0, end: 0.0),
                    child: Text(
                      '通知',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 40,
                        color: const Color(0xffa0522d),
                      ),
                      softWrap: false,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 88.6, middle: 0.6175),
                    Pin(start: 1.0, end: 2.0),
                    child: SvgPicture.string(
                      _svg_l96ld,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 88.6, end: 0.0),
                    Pin(start: 1.0, end: 2.0),
                    child: SvgPicture.string(
                      _svg_gnu,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.0, -0.241),
            child: SizedBox(
              width: 265.0,
              height: 53.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(size: 80.0, start: 0.0),
                    Pin(start: 0.0, end: 0.0),
                    child: Text(
                      '鎖定',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 40,
                        color: const Color(0xffa0522d),
                      ),
                      softWrap: false,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 88.6, middle: 0.6175),
                    Pin(start: 1.0, end: 2.0),
                    child: SvgPicture.string(
                      _svg_l96ld,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 88.6, end: 0.0),
                    Pin(start: 1.0, end: 2.0),
                    child: SvgPicture.string(
                      _svg_gnu,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.0, -0.04),
            child: SizedBox(
              width: 265.0,
              height: 53.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(size: 80.0, start: 0.0),
                    Pin(start: 0.0, end: 0.0),
                    child: Text(
                      '音樂',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 40,
                        color: const Color(0xffa0522d),
                      ),
                      softWrap: false,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 88.6, middle: 0.6175),
                    Pin(start: 1.0, end: 2.0),
                    child: SvgPicture.string(
                      _svg_l96ld,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 88.6, end: 0.0),
                    Pin(start: 1.0, end: 2.0),
                    child: SvgPicture.string(
                      _svg_gnu,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.492, -0.434),
            child: SizedBox(
              width: 30.0,
              height: 40.0,
              child: Text(
                '開',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 30,
                  color: const Color(0xffffffff),
                ),
                softWrap: false,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.492, -0.238),
            child: SizedBox(
              width: 30.0,
              height: 40.0,
              child: Text(
                '開',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 30,
                  color: const Color(0xffffffff),
                ),
                softWrap: false,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.492, -0.434),
            child: SizedBox(
              width: 30.0,
              height: 40.0,
              child: Text(
                '開',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 30,
                  color: const Color(0xffffffff),
                ),
                softWrap: false,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.492, -0.043),
            child: SizedBox(
              width: 30.0,
              height: 40.0,
              child: Text(
                '開',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 30,
                  color: const Color(0xffffffff),
                ),
                softWrap: false,
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.554, 0.164),
            child: SizedBox(
              width: 80.0,
              height: 53.0,
              child: Text(
                '顏色',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 40,
                  color: const Color(0xffa0522d),
                ),
                softWrap: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_l96ld =
    '<svg viewBox="167.7 203.0 88.6 50.0" ><path transform="translate(167.68, 160.66)" d="M 69.41712188720703 92.33885192871094 L 69.41736602783203 92.33821105957031 L 2.44140608174348e-07 92.33821105957031 L 2.44140608174348e-07 42.33780670166016 L 88.63800048828125 42.33780670166016 L 69.41736602783203 92.33821105957031 L 69.41712188720703 92.33885192871094 Z" fill="#ffffff" stroke="#a0522d" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_gnu =
    '<svg viewBox="235.0 203.0 88.6 50.0" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 323.64, 253.0)" d="M 69.41717529296875 50.00104522705078 L 69.41741943359375 50.00040435791016 L 0 50.00040435791016 L 0 0 L 88.6380615234375 0 L 69.41741943359375 50.00040435791016 L 69.41717529296875 50.00104522705078 Z" fill="#ffbb00" stroke="#a0522d" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
