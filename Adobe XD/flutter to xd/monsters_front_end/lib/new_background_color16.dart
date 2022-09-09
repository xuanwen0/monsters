import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class new_backgroundColor16 extends StatelessWidget {
  new_backgroundColor16({
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
            Pin(start: 73.0, end: 73.0),
            Pin(size: 576.0, end: 79.0),
            child:
                // Adobe XD layer: '聊天畫面' (shape)
                Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 73.0, end: 73.0),
            Pin(size: 576.0, end: 79.0),
            child:
                // Adobe XD layer: '畫心情' (shape)
                Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.0, -0.515),
            child: SizedBox(
              width: 205.0,
              height: 67.0,
              child:
                  // Adobe XD layer: 'Icon awesome-commen…' (shape)
                  SvgPicture.string(
                _svg_sw14jy,
                allowDrawingOutsideViewBox: true,
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.01, -0.507),
            child: SizedBox(
              width: 180.0,
              height: 32.0,
              child: Text(
                '畫心情頁面可讓使用者隨心展現\n自己創意去闡述自己想表達的想法',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 12,
                  color: const Color(0xffa0522d),
                ),
                softWrap: false,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.058, 0.566),
            child: SizedBox(
              width: 205.0,
              height: 67.0,
              child:
                  // Adobe XD layer: 'Icon awesome-commen…' (shape)
                  SvgPicture.string(
                _svg_hkj0e,
                allowDrawingOutsideViewBox: true,
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
const String _svg_sw14jy =
    '<svg viewBox="103.4 172.4 205.2 67.2" ><path transform="translate(103.4, 172.41)" d="M 179.5548706054688 0 L 25.65069580078125 0 C 11.50273418426514 0 0 3.765406131744385 0 8.396724700927734 L 0 46.18198394775391 C 0 50.81330108642578 11.50273418426514 54.57871627807617 25.65069580078125 54.57871627807617 L 64.12673950195312 54.57871627807617 L 64.12673950195312 65.59941864013672 C 64.12673950195312 66.88516998291016 68.61560821533203 67.63299560546875 71.78187561035156 66.87203979492188 L 121.8408050537109 54.57871627807617 L 179.5548706054688 54.57871627807617 C 193.7028350830078 54.57871627807617 205.20556640625 50.81330108642578 205.20556640625 46.18198394775391 L 205.20556640625 8.396724700927734 C 205.20556640625 3.765406131744385 193.7028350830078 0 179.5548706054688 0 Z" fill="#ffffff" stroke="#a0522d" stroke-width="3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_hkj0e =
    '<svg viewBox="109.4 556.4 205.2 67.2" ><path transform="translate(109.4, 556.41)" d="M 179.5548706054688 0 L 25.65069580078125 0 C 11.50273418426514 0 0 3.765406131744385 0 8.396724700927734 L 0 46.18198394775391 C 0 50.81330108642578 11.50273418426514 54.57871627807617 25.65069580078125 54.57871627807617 L 64.12673950195312 54.57871627807617 L 64.12673950195312 65.59941864013672 C 64.12673950195312 66.88516998291016 68.61560821533203 67.63299560546875 71.78187561035156 66.87203979492188 L 121.8408050537109 54.57871627807617 L 179.5548706054688 54.57871627807617 C 193.7028350830078 54.57871627807617 205.20556640625 50.81330108642578 205.20556640625 46.18198394775391 L 205.20556640625 8.396724700927734 C 205.20556640625 3.765406131744385 193.7028350830078 0 179.5548706054688 0 Z" fill="#ffffff" stroke="#a0522d" stroke-width="3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
