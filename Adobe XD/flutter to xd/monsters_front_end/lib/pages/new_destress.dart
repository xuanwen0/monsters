import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class new_destress extends StatelessWidget {
  final VoidCallback exercise;
  final VoidCallback handmassage;
  final VoidCallback animaltogether;
  final VoidCallback drinktea;
  final VoidCallback deepthought;
  final VoidCallback warmbath;
  final VoidCallback gotothetrip;
  new_destress({
    Key? key,
    required this.exercise,
    required this.handmassage,
    required this.animaltogether,
    required this.drinktea,
    required this.deepthought,
    required this.warmbath,
    required this.gotothetrip,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffffed4),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 188.0, middle: 0.5),
            Pin(size: 63.0, start: 9.0),
            child: Text(
              '紓壓方法',
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
            Pin(start: 20.0, end: 13.0),
            Pin(size: 169.0, start: 100.0),
            child:
                // Adobe XD layer: 'breathe' (group)
                Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 141.0, start: 0.0),
                  Pin(start: 7.0, end: 21.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 141.0, start: 0.0),
                  Pin(start: 7.0, end: 21.0),
                  child:
                      // Adobe XD layer: 'music_headphone_sid…' (shape)
                      Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('assetstemp/breath2.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          width: 2.0, color: const Color(0xffa0522d)),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.228, -1.0),
                  child: SizedBox(
                    width: 120.0,
                    height: 53.0,
                    child: Text(
                      '深呼吸',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 40,
                        color: const Color(0xffa0522d),
                        fontWeight: FontWeight.w900,
                      ),
                      softWrap: false,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    width: 220.0,
                    height: 108.0,
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 20,
                          color: const Color(0xffa0522d),
                        ),
                        children: [
                          TextSpan(
                            text: '將注意力放在呼吸上休息\n5分鐘！深呼吸能將氧氣\n提供至大腦...',
                          ),
                          TextSpan(
                            text: '閱讀更多\n',
                            style: TextStyle(
                              color: const Color(0xff7b645a),
                            ),
                          ),
                        ],
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 20.0, end: 13.0),
            Pin(size: 169.0, start: 271.0),
            child:
                // Adobe XD layer: 'music' (group)
                Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 141.0, start: 0.0),
                  Pin(start: 7.0, end: 21.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 141.0, start: 0.0),
                  Pin(start: 7.0, end: 21.0),
                  child:
                      // Adobe XD layer: 'music_headphone_sid…' (shape)
                      Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            const AssetImage('assetstemp/listen the music.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          width: 2.0, color: const Color(0xffa0522d)),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.228, -1.0),
                  child: SizedBox(
                    width: 120.0,
                    height: 53.0,
                    child: Text(
                      '聽音樂',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 40,
                        color: const Color(0xffa0522d),
                        fontWeight: FontWeight.w900,
                      ),
                      softWrap: false,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    width: 220.0,
                    height: 108.0,
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 20,
                          color: const Color(0xffa0522d),
                        ),
                        children: [
                          TextSpan(
                            text: '專家表示，音樂能以促進\n平靜的方式，改變細胞的\n化學作用。...',
                          ),
                          TextSpan(
                            text: '閱讀更多\n',
                            style: TextStyle(
                              color: const Color(0xff7b645a),
                            ),
                          ),
                        ],
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 20.0, end: 13.0),
            Pin(size: 169.0, middle: 0.2684),
            child:
                // Adobe XD layer: 'exercise' (group)
                GestureDetector(
              onTap: () => exercise.call(),
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(size: 141.0, start: 0.0),
                    Pin(start: 7.0, end: 21.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 141.0, start: 0.0),
                    Pin(start: 7.0, end: 21.0),
                    child:
                        // Adobe XD layer: 'junbiundou_shinkyaku' (shape)
                        Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage(''),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                            width: 2.0, color: const Color(0xffa0522d)),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.064, -1.0),
                    child: SizedBox(
                      width: 80.0,
                      height: 53.0,
                      child: Text(
                        '運動',
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 40,
                          color: const Color(0xffa0522d),
                          fontWeight: FontWeight.w900,
                        ),
                        softWrap: false,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: 220.0,
                      height: 108.0,
                      child: Text.rich(
                        TextSpan(
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 20,
                            color: const Color(0xffa0522d),
                          ),
                          children: [
                            TextSpan(
                              text: '運動是極好的紓壓方式，\n根據研究，放鬆心靈前\n先放鬆身體...',
                            ),
                            TextSpan(
                              text: '閱讀更多\n',
                              style: TextStyle(
                                color: const Color(0xff7b645a),
                              ),
                            ),
                          ],
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        softWrap: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 20.0, end: 13.0),
            Pin(size: 169.0, middle: 0.3722),
            child:
                // Adobe XD layer: 'hand' (group)
                GestureDetector(
              onTap: () => handmassage.call(),
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(size: 141.0, start: 0.0),
                    Pin(start: 7.0, end: 21.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 141.0, start: 0.0),
                    Pin(start: 7.0, end: 21.0),
                    child:
                        // Adobe XD layer: 'massage_hand' (shape)
                        Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage(''),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                            width: 2.0, color: const Color(0xffa0522d)),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.452, -1.0),
                    child: SizedBox(
                      width: 160.0,
                      height: 53.0,
                      child: Text(
                        '手部按摩',
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 40,
                          color: const Color(0xffa0522d),
                          fontWeight: FontWeight.w900,
                        ),
                        softWrap: false,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: 220.0,
                      height: 108.0,
                      child: Text.rich(
                        TextSpan(
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 20,
                            color: const Color(0xffa0522d),
                          ),
                          children: [
                            TextSpan(
                              text: '研究發現按摩治療能影響\n身體的生物化學作用，緩\n解抑鬱和焦慮...',
                            ),
                            TextSpan(
                              text: '閱讀更多\n',
                              style: TextStyle(
                                color: const Color(0xff7b645a),
                              ),
                            ),
                          ],
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        softWrap: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 20.0, end: 13.0),
            Pin(size: 148.0, middle: 0.47),
            child:
                // Adobe XD layer: 'animal' (group)
                GestureDetector(
              onTap: () => animaltogether?.call(),
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(size: 141.0, start: 0.0),
                    Pin(start: 7.0, end: 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 141.0, start: 0.0),
                    Pin(start: 7.0, end: 0.0),
                    child:
                        // Adobe XD layer: 'dog_cat_nakayoshi' (shape)
                        Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage(''),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                            width: 2.0, color: const Color(0xffa0522d)),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 200.0, end: 20.0),
                    Pin(size: 53.0, start: 0.0),
                    child: Text(
                      '與動物相處',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 40,
                        color: const Color(0xffa0522d),
                        fontWeight: FontWeight.w900,
                      ),
                      softWrap: false,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 220.0, end: 0.0),
                    Pin(size: 81.0, end: 6.0),
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 20,
                          color: const Color(0xffa0522d),
                        ),
                        children: [
                          TextSpan(
                            text: '和動物相處是減輕壓力很\n棒的方法 。研究發現會使\n身體分泌讓人...',
                          ),
                          TextSpan(
                            text: '閱讀更多',
                            style: TextStyle(
                              color: const Color(0xff7b645a),
                            ),
                          ),
                        ],
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 20.0, end: 13.0),
            Pin(size: 169.0, middle: 0.5798),
            child:
                // Adobe XD layer: 'tea' (group)
                GestureDetector(
              onTap: () => drinktea?.call(),
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(size: 141.0, start: 0.0),
                    Pin(start: 7.0, end: 21.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 141.0, start: 0.0),
                    Pin(start: 7.0, end: 21.0),
                    child:
                        // Adobe XD layer: 'herb_tea' (shape)
                        Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage(''),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                            width: 2.0, color: const Color(0xffa0522d)),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.452, -1.0),
                    child: SizedBox(
                      width: 160.0,
                      height: 53.0,
                      child: Text(
                        '喝花草茶',
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 40,
                          color: const Color(0xffa0522d),
                          fontWeight: FontWeight.w900,
                        ),
                        softWrap: false,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: 220.0,
                      height: 108.0,
                      child: Text.rich(
                        TextSpan(
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 20,
                            color: const Color(0xffa0522d),
                          ),
                          children: [
                            TextSpan(
                              text: '專家表示花草茶是很棒的\n減壓劑，不妨試試貓薄荷\n、洋甘菊...',
                            ),
                            TextSpan(
                              text: '閱讀更多\n',
                              style: TextStyle(
                                color: const Color(0xff7b645a),
                              ),
                            ),
                          ],
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        softWrap: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 20.0, end: 13.0),
            Pin(size: 169.0, middle: 0.6837),
            child:
                // Adobe XD layer: 'think' (group)
                GestureDetector(
              onTap: () => deepthought?.call(),
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(size: 141.0, start: 0.0),
                    Pin(start: 7.0, end: 21.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 141.0, start: 0.0),
                    Pin(start: 7.0, end: 21.0),
                    child:
                        // Adobe XD layer: 'yoga_meisou' (shape)
                        Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              const AssetImage('assetstemp/deep thought2.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                            width: 2.0, color: const Color(0xffa0522d)),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.064, -1.0),
                    child: SizedBox(
                      width: 80.0,
                      height: 53.0,
                      child: Text(
                        '冥想',
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 40,
                          color: const Color(0xffa0522d),
                          fontWeight: FontWeight.w900,
                        ),
                        softWrap: false,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: 220.0,
                      height: 108.0,
                      child: Text.rich(
                        TextSpan(
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 20,
                            color: const Color(0xffa0522d),
                          ),
                          children: [
                            TextSpan(
                              text: '每天練習幾分鐘的冥想有\n助緩解焦慮情緒，能使大\n腦的神經通路...',
                            ),
                            TextSpan(
                              text: '閱讀更多\n',
                              style: TextStyle(
                                color: const Color(0xff7b645a),
                              ),
                            ),
                          ],
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        softWrap: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 20.0, end: 13.0),
            Pin(size: 169.0, middle: 0.7875),
            child:
                // Adobe XD layer: 'alone' (group)
                Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 141.0, start: 0.0),
                  Pin(start: 7.0, end: 21.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 141.0, start: 0.0),
                  Pin(start: 7.0, end: 21.0),
                  child:
                      // Adobe XD layer: 'amabie_stay_home' (shape)
                      Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('assetstemp/alone.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          width: 2.0, color: const Color(0xffa0522d)),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 200.0, end: 20.0),
                  Pin(size: 53.0, start: 0.0),
                  child: Text(
                    '與自己獨處',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 40,
                      color: const Color(0xffa0522d),
                      fontWeight: FontWeight.w900,
                    ),
                    softWrap: false,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    width: 220.0,
                    height: 108.0,
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 20,
                          color: const Color(0xffa0522d),
                        ),
                        children: [
                          TextSpan(
                            text: '研究發現人們應放下手機\n，享受與自我獨處，有助\n於更認識真我...',
                          ),
                          TextSpan(
                            text: '閱讀更多\n',
                            style: TextStyle(
                              color: const Color(0xff7b645a),
                            ),
                          ),
                        ],
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 20.0, end: 13.0),
            Pin(size: 169.0, end: 179.0),
            child:
                // Adobe XD layer: 'bath' (group)
                GestureDetector(
              onTap: () => warmbath?.call(),
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(size: 141.0, start: 0.0),
                    Pin(start: 7.0, end: 21.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 141.0, start: 0.0),
                    Pin(start: 7.0, end: 21.0),
                    child:
                        // Adobe XD layer: 'animal_ofuro' (shape)
                        Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage('assetstemp/warm bath 2.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                            width: 2.0, color: const Color(0xffa0522d)),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.452, -1.0),
                    child: SizedBox(
                      width: 160.0,
                      height: 53.0,
                      child: Text(
                        '洗熱水澡',
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 40,
                          color: const Color(0xffa0522d),
                          fontWeight: FontWeight.w900,
                        ),
                        softWrap: false,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: 220.0,
                      height: 108.0,
                      child: Text.rich(
                        TextSpan(
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 20,
                            color: const Color(0xffa0522d),
                          ),
                          children: [
                            TextSpan(
                              text: '根據美國研究院報告指出\n，熱水有助血管擴張，能\n增加血氧量...',
                            ),
                            TextSpan(
                              text: '閱讀更多\n',
                              style: TextStyle(
                                color: const Color(0xff7b645a),
                              ),
                            ),
                          ],
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        softWrap: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 20.0, end: 13.0),
            Pin(size: 169.0, end: 8.0),
            child:
                // Adobe XD layer: 'travel' (group)
                GestureDetector(
              onTap: () => gotothetrip?.call(),
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(size: 141.0, start: 0.0),
                    Pin(start: 7.0, end: 21.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 141.0, start: 0.0),
                    Pin(start: 7.0, end: 21.0),
                    child:
                        // Adobe XD layer: 'travel_happy_young4' (shape)
                        Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage(''),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                            width: 2.0, color: const Color(0xffa0522d)),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.064, -1.0),
                    child: SizedBox(
                      width: 80.0,
                      height: 53.0,
                      child: Text(
                        '旅行',
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 40,
                          color: const Color(0xffa0522d),
                          fontWeight: FontWeight.w900,
                        ),
                        softWrap: false,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: 220.0,
                      height: 108.0,
                      child: Text.rich(
                        TextSpan(
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 20,
                            color: const Color(0xffa0522d),
                          ),
                          children: [
                            TextSpan(
                              text: '是最能放鬆身心、為自己\n充電方法，遠離塵囂與網\n路，陶醉在...',
                            ),
                            TextSpan(
                              text: '閱讀更多\n',
                              style: TextStyle(
                                color: const Color(0xff7b645a),
                              ),
                            ),
                          ],
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        softWrap: false,
                      ),
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

const String _svg_ryq30 =
    '<svg viewBox="13.7 21.9 45.6 41.1" ><path transform="translate(8.07, 15.61)" d="M 47.28736877441406 22.92952919006348 L 19.54702568054199 22.92952919006348 L 30.30613327026367 13.09178352355957 C 31.84870529174805 11.54302215576172 31.84870529174805 9.040220260620117 30.30613327026367 7.491456031799316 C 28.76356315612793 5.942692756652832 26.26174545288086 5.942692756652832 24.70621109008789 7.491456031799316 L 6.791648864746094 24.09420013427734 C 6.013882637023926 24.81282615661621 5.624999046325684 25.79164695739746 5.624999046325684 26.86958694458008 L 5.624999046325684 26.91914939880371 C 5.624999046325684 27.99708938598633 6.013882637023926 28.97590446472168 6.791648864746094 29.69453430175781 L 24.69325065612793 46.29727935791016 C 26.24878120422363 47.84604263305664 28.75060272216797 47.84604263305664 30.29317092895508 46.29727935791016 C 31.83573913574219 44.74851226806641 31.83573913574219 42.2457160949707 30.29317092895508 40.69694900512695 L 19.5340633392334 30.85920524597168 L 47.27440643310547 30.85920524597168 C 49.46512222290039 30.85920524597168 51.24102020263672 29.08742141723633 51.24102020263672 26.89437294006348 C 51.25398254394531 24.66414642333984 49.47808074951172 22.92952919006348 47.28736877441406 22.92952919006348 Z" fill="#ffbb00" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
