import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class new_fastTest9 extends StatelessWidget {
  new_fastTest9({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffffed4),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 141.0, middle: 0.5018),
            Pin(size: 63.0, start: 11.0),
            child:
                // Adobe XD layer: '聽音樂' (text)
                Text(
              '聽音樂',
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
            Pin(start: 29.0, end: 28.0),
            Pin(size: 648.0, start: 90.0),
            child: Text(
              '物理治療師表示，音樂能以促進平靜的方式，改變細胞的化學作用。在晨起準備出門或通勤時打開收音機，聽古典音樂或節奏較緩慢的曲調，能放鬆身心、減輕壓力。事實上，聽你最愛的音樂，是每天早上建\n議做的五件事之一，能讓你開啟不可思議的一天。\n\n研究發現，人在緊張狀況下，聆聽音樂能使神經系統修復，還能降低血壓、心率與焦慮，無論是古典樂或是流行歌曲，只要找到能讓自己陶醉的音樂，想像歌手唱出自己的心 聲，就能達到宣洩情緒的效果。',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 27,
                color: const Color(0xffa0522d),
                height: 1.3333333333333333,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 26.0, end: 26.0),
            Pin(size: 217.0, end: 44.0),
            child:
                // Adobe XD layer: 'maxresdefault' (shape)
                Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assetstemp/relax music.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 77.1, middle: 0.5),
            Pin(size: 77.4, end: 113.8),
            child:
                // Adobe XD layer: 'Icon feather-play-c…' (group)
                Stack(
              children: <Widget>[
                SizedBox.expand(
                    child: SvgPicture.string(
                  _svg_ee5i7h,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                )),
                Align(
                  alignment: Alignment(0.135, 0.0),
                  child: SizedBox(
                    width: 23.0,
                    height: 31.0,
                    child: SvgPicture.string(
                      _svg_vnhl59,
                      allowDrawingOutsideViewBox: true,
                    ),
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

const String _svg_ryq30 =
    '<svg viewBox="13.7 21.9 45.6 41.1" ><path transform="translate(8.07, 15.61)" d="M 47.28736877441406 22.92952919006348 L 19.54702568054199 22.92952919006348 L 30.30613327026367 13.09178352355957 C 31.84870529174805 11.54302215576172 31.84870529174805 9.040220260620117 30.30613327026367 7.491456031799316 C 28.76356315612793 5.942692756652832 26.26174545288086 5.942692756652832 24.70621109008789 7.491456031799316 L 6.791648864746094 24.09420013427734 C 6.013882637023926 24.81282615661621 5.624999046325684 25.79164695739746 5.624999046325684 26.86958694458008 L 5.624999046325684 26.91914939880371 C 5.624999046325684 27.99708938598633 6.013882637023926 28.97590446472168 6.791648864746094 29.69453430175781 L 24.69325065612793 46.29727935791016 C 26.24878120422363 47.84604263305664 28.75060272216797 47.84604263305664 30.29317092895508 46.29727935791016 C 31.83573913574219 44.74851226806641 31.83573913574219 42.2457160949707 30.29317092895508 40.69694900512695 L 19.5340633392334 30.85920524597168 L 47.27440643310547 30.85920524597168 C 49.46512222290039 30.85920524597168 51.24102020263672 29.08742141723633 51.24102020263672 26.89437294006348 C 51.25398254394531 24.66414642333984 49.47808074951172 22.92952919006348 47.28736877441406 22.92952919006348 Z" fill="#ffbb00" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ee5i7h =
    '<svg viewBox="2.9 2.7 77.1 77.4" ><path transform="translate(-0.09, -0.32)" d="M 80.11366271972656 41.72328567504883 C 80.11366271972656 63.10957717895508 62.8511848449707 80.44658660888672 41.55683135986328 80.44658660888672 C 20.26248168945312 80.44658660888672 3.000000715255737 63.10957717895508 3.000000715255737 41.72328567504883 C 3.000000715255737 20.33700752258301 20.26248168945312 3.000000715255737 41.55683135986328 3.000000715255737 C 62.8511848449707 3.000000715255737 80.11366271972656 20.33700752258301 80.11366271972656 41.72328567504883 Z" fill="none" stroke="#fcfcfc" stroke-width="3" stroke-linecap="square" stroke-linejoin="round" /></svg>';
const String _svg_vnhl59 =
    '<svg viewBox="33.6 26.1 23.0 30.6" ><path transform="translate(18.65, 14.1)" d="M 15 12.00000286102295 L 37.95497894287109 27.30331802368164 L 15 42.60663604736328 L 15 12.00000286102295 Z" fill="none" stroke="#fcfcfc" stroke-width="3" stroke-linecap="square" stroke-linejoin="round" /></svg>';
