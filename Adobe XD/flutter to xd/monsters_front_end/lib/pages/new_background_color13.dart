import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class new_backgroundColor13 extends StatelessWidget {
  new_backgroundColor13({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffffed4),
      body: Stack(
        children: <Widget>[
          Container(
            color: const Color(0xffffffff),
            margin: EdgeInsets.fromLTRB(0.0, 92.0, 0.0, 73.0),
          ),
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
            Pin(size: 188.0, middle: 0.5),
            Pin(size: 63.0, start: 11.0),
            child: Text(
              '使用說明',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 47,
                color: const Color(0xffa0522d),
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 0.0, middle: 0.3835),
            Pin(size: 52.0, end: 1.0),
            child: Stack(
              children: <Widget>[
                SizedBox.expand(
                    child: Text(
                  '\n',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 19,
                    color: const Color(0xffa0522d),
                  ),
                  softWrap: false,
                )),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 76.0, end: 16.0),
            Pin(size: 32.0, end: 21.0),
            child: Stack(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Pinned.fromPins(
                      Pin(size: 33.0, middle: 0.4884),
                      Pin(start: 0.0, end: 0.0),
                      child: Container(
                        color: const Color(0xffffed97),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 35.0, start: 0.0),
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
                      Pin(size: 35.0, end: 0.0),
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
                  Pin(size: 38.0, middle: 0.5),
                  Pin(start: 3.0, end: 3.0),
                  child: Text(
                    '跳過',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 19,
                      color: const Color(0xffa0522d),
                    ),
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 58.0, end: 57.0),
            Pin(size: 568.0, end: 81.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      const AssetImage('assetstemp/interactive scrrenshot.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 151.6, end: 31.0),
            Pin(size: 83.5, start: 71.2),
            child:
                // Adobe XD layer: 'Icon awesome-commen…' (shape)
                SvgPicture.string(
              _svg_nfu3yv,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 132.0, end: 40.0),
            Pin(size: 48.0, start: 81.0),
            child: Text(
              '來到互動區可以挑選感興\n趣的點擊進去查看更多詳\n細內容轉換一下心情。',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 12,
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
const String _svg_nfu3yv =
    '<svg viewBox="229.4 71.2 151.6 83.5" ><path transform="translate(229.41, 71.23)" d="M 132.6787109375 0 L 18.9541015625 0 C 8.499729156494141 0 0 4.682160377502441 0 10.44105529785156 L 0 57.42580413818359 C 0 63.1846923828125 8.499729156494141 67.86686706542969 18.9541015625 67.86686706542969 L 47.38525390625 67.86686706542969 L 47.38525390625 81.57074737548828 C 47.38525390625 83.16954040527344 50.70222091674805 84.09943389892578 53.0418701171875 83.15321350097656 L 90.031982421875 67.86686706542969 L 132.6787109375 67.86686706542969 C 143.1330871582031 67.86686706542969 151.6328125 63.1846923828125 151.6328125 57.42580413818359 L 151.6328125 10.44105529785156 C 151.6328125 4.682160377502441 143.1330871582031 0 132.6787109375 0 Z" fill="#ffffff" stroke="#a0522d" stroke-width="3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
