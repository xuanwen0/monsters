import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class new_fastTest5 extends StatelessWidget {
  new_fastTest5({
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
              '喝花草茶',
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
            Pin(size: 444.0, start: 90.0),
            child: Text(
              '植物醫學教授說，花草茶是很棒的減壓劑，不妨試試貓薄荷、檸檬香蜂草、西番蓮花、啤酒花、洋甘菊。\n花草茶種類繁多，對人體的裨益更有不同，不是所有人都適合飲用，建議選購前先向醫師諮詢確認，且購買時應以包裝完整、標示清楚、無化學藥劑異味為原則，飲用時則應先把用熱水沖泡的第一泡倒掉，從第二泡開始飲用。',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 27,
                color: const Color(0xffa0522d),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 146.0, start: 25.0),
            Pin(size: 43.0, middle: 0.2025),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 27,
                  color: const Color(0xffa0522d),
                ),
                children: [
                  TextSpan(
                    text: '· 玫瑰花茶',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 146.0, start: 25.0),
            Pin(size: 43.0, middle: 0.4224),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 27,
                  color: const Color(0xffa0522d),
                ),
                children: [
                  TextSpan(
                    text: '· 薰衣草茶',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 114.0, start: 25.0),
            Pin(size: 43.0, middle: 0.6371),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 27,
                  color: const Color(0xffa0522d),
                ),
                children: [
                  TextSpan(
                    text: '· 茉莉花',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 114.0, start: 25.0),
            Pin(size: 43.0, end: 451.0),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 27,
                  color: const Color(0xffa0522d),
                ),
                children: [
                  TextSpan(
                    text: '· 馬鞭草',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 25.0, end: 24.0),
            Pin(size: 313.0, middle: 0.336),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 27,
                  color: const Color(0xffa0522d),
                ),
                children: [
                  TextSpan(
                    text: '除可消除疲勞之外，還可降火氣、調理血氣、促進血液循環、保護肝臟和腸胃，同時還有養顏美容的功能。\n',
                  ),
                  TextSpan(
                    text:
                        '＊若與茉莉花相互搭配，更可緩和緊張的情緒、消減體內脂肪；與洋甘菊搭配泡製，可防止肌膚老化、增強肌膚抵抗力和修復能力。若搭配薄荷使用，可提神醒腦、強化中樞神經、促進血液循環，適合腦力',
                    style: TextStyle(
                      fontSize: 20,
                      color: const Color(0xff946955),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  TextSpan(
                    text: '勞動者飲用。',
                    style: TextStyle(
                      fontSize: 20,
                      color: const Color(0xff9b5b3d),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 25.0, end: 24.0),
            Pin(size: 299.0, middle: 0.5771),
            child: Text(
              '可以鎮定心神，解除緊張焦慮，抒解壓力，鬆弛神經，幫助入眠，安定消化系統，改善初期感冒、咳嗽和偏頭痛。不過，服用時應避免過量，尤其是孕婦，以免過度刺激平滑肌收縮，導致初期流產或晚期早產。',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 27,
                color: const Color(0xffa0522d),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 25.0, end: 24.0),
            Pin(size: 246.0, middle: 0.7971),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 27,
                  color: const Color(0xffa0522d),
                ),
                children: [
                  TextSpan(
                    text:
                        '可安定情緒、舒解鬱悶，改善昏睡和焦慮，提振精神卻不使人過於興奮。此外對胃弱、慢性病支氣管炎、便秘、腹痛和頭痛患者也有幫助。\n',
                  ),
                  TextSpan(
                    text: '＊若將茉莉花與柑橙花苞混搭泡飲，於晚間飲用，有助於放鬆心情，幫助睡眠。',
                    style: TextStyle(
                      fontSize: 20,
                      color: const Color(0xff946955),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 25.0, end: 24.0),
            Pin(size: 195.0, end: 31.0),
            child: Text(
              '可強化神經系統，幫助提神，消除噁心感且促進腸道淨化。此外，馬鞭草還具有活血通經、改善經痛的作用，不過孕婦不宜使用。',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 27,
                color: const Color(0xffa0522d),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 41.0, end: 40.0),
            Pin(size: 205.0, middle: 0.2364),
            child:
                // Adobe XD layer: 'istockphoto-5341134…' (shape)
                Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assetstemp/rose tea.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(width: 2.5, color: const Color(0xffa0522d)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 41.0, end: 40.0),
            Pin(size: 205.0, middle: 0.4705),
            child:
                // Adobe XD layer: 'istockphoto-1260552…' (shape)
                Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assetstemp/lavender tea.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(width: 2.5, color: const Color(0xffa0522d)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 41.0, end: 40.0),
            Pin(size: 205.0, middle: 0.699),
            child:
                // Adobe XD layer: 'istockphoto-9562926…' (shape)
                Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assetstemp/jasmine tea.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(width: 2.5, color: const Color(0xffa0522d)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 41.0, end: 40.0),
            Pin(size: 205.0, end: 236.0),
            child:
                // Adobe XD layer: '00392654-Vervain-te…' (shape)
                Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assetstemp/verbena tea.jpg'),
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
