import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class new_backgroundColor12 extends StatelessWidget {
  new_backgroundColor12({
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
            Pin(start: 59.0, end: 58.0),
            Pin(size: 561.0, end: 82.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assetstemp/handbook screenshot.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 119.2, middle: 0.7732),
            Pin(size: 74.9, start: 82.7),
            child:
                // Adobe XD layer: 'Icon awesome-commen…' (shape)
                SvgPicture.string(
              _svg_d0vi1c,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 96.0, middle: 0.7532),
            Pin(size: 32.0, start: 97.0),
            child: Text(
              '圖鑑可以查看可愛\n怪獸滿足收集慾望',
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
const String _svg_d0vi1c =
    '<svg viewBox="226.4 82.7 119.2 74.9" ><path transform="translate(226.41, 82.66)" d="M 104.2877807617188 0 L 14.89825439453125 0 C 6.680935859680176 0 0 4.196510314941406 0 9.358073234558105 L 0 51.46940231323242 C 0 56.63095855712891 6.680935859680176 60.82748031616211 14.89825439453125 60.82748031616211 L 37.24563598632812 60.82748031616211 L 37.24563598632812 73.10994720458984 C 37.24563598632812 74.54290771484375 39.85282897949219 75.37635040283203 41.69183731079102 74.52827453613281 L 70.76670837402344 60.82748031616211 L 104.2877807617188 60.82748031616211 C 112.5051040649414 60.82748031616211 119.18603515625 56.63095855712891 119.18603515625 51.46940231323242 L 119.18603515625 9.358073234558105 C 119.18603515625 4.196510314941406 112.5051040649414 0 104.2877807617188 0 Z" fill="#ffffff" stroke="#a0522d" stroke-width="3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
