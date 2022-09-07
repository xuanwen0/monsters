import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class new_fastTest2 extends StatelessWidget {
  new_fastTest2({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffffed4),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 188.0, middle: 0.5),
            Pin(size: 63.0, start: 11.0),
            child: Text(
              '洗熱水澡',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 47,
                color: const Color(0xffa0522d),
              ),
              softWrap: false,
            ),
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
            Pin(start: 25.0, end: 24.0),
            Pin(size: 299.0, start: 90.0),
            child: Text(
              '當你感到壓力大到爆時，洗個熱水澡有助緊繃壓力釋放。根據美國國家健康研究院報告指出，熱水有助血管擴張，能增加血氧量，減少肌肉緊繃，還能放鬆身心。\n泡澡、泡溫泉。促進全身血液循環，釋放壓力。',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 27,
                color: const Color(0xffa0522d),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 41.0, end: 41.0),
            Pin(size: 280.0, end: 82.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 41.0, end: 41.0),
            Pin(size: 280.0, end: 82.0),
            child:
                // Adobe XD layer: 'animal_ofuro' (shape)
                Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assetstemp/warm bath 2.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(width: 2.5, color: const Color(0xffa0522d)),
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
