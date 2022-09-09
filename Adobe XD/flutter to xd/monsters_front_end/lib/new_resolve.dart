import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class new_resolve extends StatelessWidget {
  new_resolve({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffffed4),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 45.6, start: 13.7),
            Pin(size: 41.1, start: 21.9),
            child:
                // Adobe XD layer: 'Icon ionic-md-arrow…' (shape)
                SvgPicture.string(
              _svg_ryq30,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 411.0, start: 83.0),
            child: Container(
              color: const Color(0xffffffff),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 61.0, start: 13.7),
            Pin(size: 338.0, start: 104.0),
            child: SingleChildScrollView(
              primary: false,
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 22,
                runSpacing: 20,
                children: [
                  {
                    'image': const AssetImage('assetstemp/happy.png'),
                  },
                  {
                    'image': const AssetImage('assetstemp/fine.png'),
                  },
                  {
                    'image': const AssetImage('assetstemp/not bad.png'),
                  },
                  {
                    'image': const AssetImage('assetstemp/not good.png'),
                  },
                  {
                    'image': const AssetImage('assetstemp/bad bad.png'),
                  }
                ].map((itemData) {
                  final image = itemData['image'];
                  return SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: Stack(
                      children: <Widget>[
                        // Adobe XD layer: 'worst' (shape)
                        /*
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        */
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 1.0, middle: 0.2036),
            Pin(size: 349.0, start: 103.5),
            child: SvgPicture.string(
              _svg_cozrix,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 317.8, end: 10.5),
            Pin(size: 1.0, middle: 0.5824),
            child: SvgPicture.string(
              _svg_ueabkb,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment(-0.584, -0.48),
            child: SizedBox(
              width: 10.0,
              height: 284.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(size: 1.0, start: 0.0),
                    child: SvgPicture.string(
                      _svg_p2eab,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(size: 1.0, middle: 0.2509),
                    child: SvgPicture.string(
                      _svg_xxa8j1,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(size: 1.0, middle: 0.5018),
                    child: SvgPicture.string(
                      _svg_jba5p,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(size: 1.0, middle: 0.7527),
                    child: SvgPicture.string(
                      _svg_wigccz,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(size: 1.0, end: -1.0),
                    child: SvgPicture.string(
                      _svg_gw33h,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 258.0, end: 34.8),
            Pin(size: 10.0, middle: 0.5762),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 1.0, start: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child: SvgPicture.string(
                    _svg_vw2vaz,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 1.0, start: 43.0),
                  Pin(start: 0.0, end: 0.0),
                  child: SvgPicture.string(
                    _svg_yupwml,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 1.0, middle: 0.3346),
                  Pin(start: 0.0, end: 0.0),
                  child: SvgPicture.string(
                    _svg_nud3sv,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 1.0, middle: 0.5019),
                  Pin(start: 0.0, end: 0.0),
                  child: SvgPicture.string(
                    _svg_y1d18f,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 1.0, middle: 0.6693),
                  Pin(start: 0.0, end: 0.0),
                  child: SvgPicture.string(
                    _svg_tr1r6v,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 1.0, end: 42.0),
                  Pin(start: 0.0, end: 0.0),
                  child: SvgPicture.string(
                    _svg_sy198l,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 1.0, end: -1.0),
                  Pin(start: 0.0, end: 0.0),
                  child: SvgPicture.string(
                    _svg_sxovsp,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 285.0, end: 22.0),
            Pin(size: 24.0, middle: 0.6054),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 26.0, start: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child: Text(
                    '8/1',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 18,
                      color: const Color(0xffa0522d),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 26.0, middle: 0.166),
                  Pin(start: 0.0, end: 0.0),
                  child: Text(
                    '8/2',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 18,
                      color: const Color(0xffa0522d),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 26.0, middle: 0.3359),
                  Pin(start: 0.0, end: 0.0),
                  child: Text(
                    '8/3',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 18,
                      color: const Color(0xffa0522d),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 26.0, middle: 0.5019),
                  Pin(start: 0.0, end: 0.0),
                  child: Text(
                    '8/4',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 18,
                      color: const Color(0xffa0522d),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 26.0, middle: 0.668),
                  Pin(start: 0.0, end: 0.0),
                  child: Text(
                    '8/5',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 18,
                      color: const Color(0xffa0522d),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 26.0, middle: 0.834),
                  Pin(start: 0.0, end: 0.0),
                  child: Text(
                    '8/6',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 18,
                      color: const Color(0xffa0522d),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 26.0, end: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child: Text(
                    '8/7',
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
          Pinned.fromPins(
            Pin(size: 10.0, middle: 0.2836),
            Pin(size: 10.0, start: 124.0),
            child: SvgPicture.string(
              _svg_u6vqhh,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment(-0.219, -0.122),
            child: Container(
              width: 10.0,
              height: 10.0,
              decoration: BoxDecoration(
                color: const Color(0xffffbb00),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.0, -0.122),
            child: Container(
              width: 10.0,
              height: 10.0,
              decoration: BoxDecoration(
                color: const Color(0xffffbb00),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.209, -0.307),
            child: Container(
              width: 10.0,
              height: 10.0,
              decoration: BoxDecoration(
                color: const Color(0xffffbb00),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.423, -0.122),
            child: Container(
              width: 10.0,
              height: 10.0,
              decoration: BoxDecoration(
                color: const Color(0xffffbb00),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.637, -0.307),
            child: Container(
              width: 10.0,
              height: 10.0,
              decoration: BoxDecoration(
                color: const Color(0xffffbb00),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 10.0, end: 30.0),
            Pin(size: 10.0, middle: 0.5313),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffffbb00),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.355, -0.545),
            child: SizedBox(
              width: 43.0,
              height: 213.0,
              child: SvgPicture.string(
                _svg_p7lxa,
                allowDrawingOutsideViewBox: true,
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.122, -0.118),
            child: SizedBox(
              width: 44.0,
              height: 1.0,
              child: SvgPicture.string(
                _svg_w70fk9,
                allowDrawingOutsideViewBox: true,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.111, -0.232),
            child: SizedBox(
              width: 42.0,
              height: 71.0,
              child: SvgPicture.string(
                _svg_kc9fue,
                allowDrawingOutsideViewBox: true,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.345, -0.232),
            child: SizedBox(
              width: 44.0,
              height: 71.0,
              child: SvgPicture.string(
                _svg_ppzvoi,
                allowDrawingOutsideViewBox: true,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.58, -0.232),
            child: SizedBox(
              width: 43.0,
              height: 71.0,
              child: SvgPicture.string(
                _svg_m1vcae,
                allowDrawingOutsideViewBox: true,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 43.0, end: 34.5),
            Pin(size: 142.0, middle: 0.4269),
            child: SvgPicture.string(
              _svg_h6d0,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 14.0, end: 10.0),
            Pin(size: 190.0, end: 62.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xfffffdeb),
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(width: 2.0, color: const Color(0xffa0522d)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 22.0, end: 22.0),
            Pin(size: 60.0, middle: 0.8231),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 60.0, start: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child:
                      // Adobe XD layer: 'worst' (shape)
                      Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('assetstemp/happy.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 60.0, middle: 0.25),
                  Pin(start: 0.0, end: 0.0),
                  child:
                      // Adobe XD layer: 'worst' (shape)
                      Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('assetstemp/fine.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 60.0, middle: 0.5),
                  Pin(start: 0.0, end: 0.0),
                  child:
                      // Adobe XD layer: 'worst' (shape)
                      Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('assetstemp/not bad.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 60.0, middle: 0.75),
                  Pin(start: 0.0, end: 0.0),
                  child:
                      // Adobe XD layer: 'worst' (shape)
                      Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('assetstemp/not good.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 60.0, end: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child:
                      // Adobe XD layer: 'worst' (shape)
                      Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('assetstemp/bad bad.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 33.0, end: 33.0),
            Pin(size: 33.0, end: 85.0),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 38.0, start: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child: Text(
                    '1天',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 25,
                      color: const Color(0xffa0522d),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 38.0, middle: 0.25),
                  Pin(start: 0.0, end: 0.0),
                  child: Text(
                    '0天',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 25,
                      color: const Color(0xffa0522d),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 38.0, middle: 0.5),
                  Pin(start: 0.0, end: 0.0),
                  child: Text(
                    '2天',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 25,
                      color: const Color(0xffa0522d),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 38.0, middle: 0.75),
                  Pin(start: 0.0, end: 0.0),
                  child: Text(
                    '3天',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 25,
                      color: const Color(0xffa0522d),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 38.0, end: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child: Text(
                    '1天',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 25,
                      color: const Color(0xffa0522d),
                    ),
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 90.0, start: 29.0),
            Pin(size: 33.0, middle: 0.7235),
            child: Text(
              '8/1~8/7',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 25,
                color: const Color(0xffa0522d),
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 188.0, middle: 0.5),
            Pin(size: 63.0, start: 11.0),
            child: Text(
              '心的軌跡',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 47,
                color: const Color(0xffa0522d),
              ),
              softWrap: false,
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_ryq30 =
    '<svg viewBox="13.7 21.9 45.6 41.1" ><path transform="translate(8.07, 15.61)" d="M 47.28736877441406 22.92952919006348 L 19.54702568054199 22.92952919006348 L 30.30613327026367 13.09178352355957 C 31.84870529174805 11.54302215576172 31.84870529174805 9.040220260620117 30.30613327026367 7.491456031799316 C 28.76356315612793 5.942692756652832 26.26174545288086 5.942692756652832 24.70621109008789 7.491456031799316 L 6.791648864746094 24.09420013427734 C 6.013882637023926 24.81282615661621 5.624999046325684 25.79164695739746 5.624999046325684 26.86958694458008 L 5.624999046325684 26.91914939880371 C 5.624999046325684 27.99708938598633 6.013882637023926 28.97590446472168 6.791648864746094 29.69453430175781 L 24.69325065612793 46.29727935791016 C 26.24878120422363 47.84604263305664 28.75060272216797 47.84604263305664 30.29317092895508 46.29727935791016 C 31.83573913574219 44.74851226806641 31.83573913574219 42.2457160949707 30.29317092895508 40.69694900512695 L 19.5340633392334 30.85920524597168 L 47.27440643310547 30.85920524597168 C 49.46512222290039 30.85920524597168 51.24102020263672 29.08742141723633 51.24102020263672 26.89437294006348 C 51.25398254394531 24.66414642333984 49.47808074951172 22.92952919006348 47.28736877441406 22.92952919006348 Z" fill="#ffbb00" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_cozrix =
    '<svg viewBox="83.7 103.5 1.0 349.0" ><path transform="translate(83.69, 103.5)" d="M 0 0 L 0 349" fill="none" stroke="#a0522d" stroke-width="3.5" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
const String _svg_p2eab =
    '<svg viewBox="83.7 128.5 10.0 1.0" ><path transform="translate(83.69, 128.5)" d="M 0 0 L 10 0" fill="none" stroke="#a0522d" stroke-width="2" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
const String _svg_xxa8j1 =
    '<svg viewBox="83.7 199.5 10.0 1.0" ><path transform="translate(83.69, 199.5)" d="M 0 0 L 10 0" fill="none" stroke="#a0522d" stroke-width="2" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
const String _svg_jba5p =
    '<svg viewBox="83.7 270.5 10.0 1.0" ><path transform="translate(83.69, 270.5)" d="M 0 0 L 10 0" fill="none" stroke="#a0522d" stroke-width="2" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
const String _svg_wigccz =
    '<svg viewBox="83.7 341.5 10.0 1.0" ><path transform="translate(83.69, 341.5)" d="M 0 0 L 10 0" fill="none" stroke="#a0522d" stroke-width="2" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
const String _svg_gw33h =
    '<svg viewBox="83.7 412.5 10.0 1.0" ><path transform="translate(83.69, 412.5)" d="M 0 0 L 10 0" fill="none" stroke="#a0522d" stroke-width="2" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
const String _svg_ueabkb =
    '<svg viewBox="83.7 452.5 317.8 1.0" ><path transform="translate(83.69, 452.5)" d="M 0 0 L 317.80810546875 0" fill="none" stroke="#a0522d" stroke-width="3.5" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
const String _svg_vw2vaz =
    '<svg viewBox="119.2 442.5 1.0 10.0" ><path transform="translate(119.19, 442.5)" d="M 0 0 L 0 10" fill="none" stroke="#a0522d" stroke-width="2" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
const String _svg_yupwml =
    '<svg viewBox="162.2 442.5 1.0 10.0" ><path transform="translate(162.19, 442.5)" d="M 0 0 L 0 10" fill="none" stroke="#a0522d" stroke-width="2" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
const String _svg_nud3sv =
    '<svg viewBox="205.2 442.5 1.0 10.0" ><path transform="translate(205.19, 442.5)" d="M 0 0 L 0 10" fill="none" stroke="#a0522d" stroke-width="2" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
const String _svg_y1d18f =
    '<svg viewBox="248.2 442.5 1.0 10.0" ><path transform="translate(248.19, 442.5)" d="M 0 0 L 0 10" fill="none" stroke="#a0522d" stroke-width="2" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
const String _svg_tr1r6v =
    '<svg viewBox="291.2 442.5 1.0 10.0" ><path transform="translate(291.19, 442.5)" d="M 0 0 L 0 10" fill="none" stroke="#a0522d" stroke-width="2" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
const String _svg_sy198l =
    '<svg viewBox="334.2 442.5 1.0 10.0" ><path transform="translate(334.19, 442.5)" d="M 0 0 L 0 10" fill="none" stroke="#a0522d" stroke-width="2" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
const String _svg_sxovsp =
    '<svg viewBox="377.2 442.5 1.0 10.0" ><path transform="translate(377.19, 442.5)" d="M 0 0 L 0 10" fill="none" stroke="#a0522d" stroke-width="2" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
const String _svg_u6vqhh =
    '<svg viewBox="114.0 124.0 10.0 10.0" ><path transform="translate(114.0, 124.0)" d="M 5 0 C 7.76142406463623 0 10 2.238576173782349 10 5 C 10 7.76142406463623 7.76142406463623 10 5 10 C 2.238576173782349 10 0 7.76142406463623 0 5 C 0 2.238576173782349 2.238576173782349 0 5 0 Z" fill="#ffbb00" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_p7lxa =
    '<svg viewBox="119.0 128.5 43.0 213.0" ><path transform="translate(119.0, 128.5)" d="M 0 0 L 43 213" fill="none" stroke="#ffbb00" stroke-width="2.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_w70fk9 =
    '<svg viewBox="161.5 342.5 44.0 1.0" ><path transform="translate(161.5, 342.5)" d="M 0 0 L 44 0" fill="none" stroke="#ffbb00" stroke-width="2.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_kc9fue =
    '<svg viewBox="205.5 271.5 42.0 71.0" ><path transform="translate(205.5, 271.5)" d="M 42 0 L 0 71" fill="none" stroke="#ffbb00" stroke-width="2.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ppzvoi =
    '<svg viewBox="247.5 271.5 44.0 71.0" ><path transform="translate(247.5, 271.5)" d="M 0 0 L 44 71" fill="none" stroke="#ffbb00" stroke-width="2.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_m1vcae =
    '<svg viewBox="291.5 271.5 43.0 71.0" ><path transform="translate(291.5, 271.5)" d="M 43 0 L 0 71" fill="none" stroke="#ffbb00" stroke-width="2.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_h6d0 =
    '<svg viewBox="334.5 271.5 43.0 142.0" ><path transform="translate(334.5, 271.5)" d="M 0 0 L 43 142" fill="none" stroke="#ffbb00" stroke-width="2.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
