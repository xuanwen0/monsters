import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

//運動
class new_fastTest8 extends StatelessWidget {
  new_fastTest8({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffffed4),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 94.0, middle: 0.5),
            Pin(size: 63.0, start: 11.0),
            child: Text(
              '運動',
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
            Pin(size: 974.0, start: 90.0),
            child: SingleChildScrollView(
              primary: false,
              child: Text(
                '運動是極好的紓壓方式，根據哈佛醫學院的研究，放鬆心靈前必須先放鬆身體，藉由放鬆\n肢體以減少緊張的情緒。且到戶外呼吸新鮮空氣，有助放鬆、減輕壓力。\n\n激烈的運動，例如跑步、游泳、爬山、球類運動，會讓血液循環加快、胸喘、心跳加速、汗流\n浹背、身體痠痛等，增加心肺功能，且腦部會分泌腦內嗎啡，從而紓解壓力。緩慢的運動，如瑜伽、太極拳、八段錦，一般是由強度小、節奏較慢動作組合而成，這種可將身體和精神集中於一體的伸展運動，有利於促進血液循環，針對關節、肌肉、內臟、思維都有鍛鍊作用。達到身體和心靈的放鬆，讓人學會呼吸，學會思考。\n\n無論進行哪種運動，前提是要有興趣，否則也不會讓你開心。\n\n以下推薦【紓壓瑜珈】體位法',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 27,
                  color: const Color(0xffa0522d),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 297.0, start: 25.0),
            Pin(size: 43.0, middle: 0.2308),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 27,
                  color: const Color(0xffa0522d),
                ),
                children: [
                  TextSpan(
                    text: '嬰兒式(Child\'s Pose)',
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
            Pin(size: 322.0, start: 25.0),
            Pin(size: 43.0, middle: 0.3905),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 27,
                  color: const Color(0xffa0522d),
                ),
                children: [
                  TextSpan(
                    text: '貓牛式(Cat Cow Pose)',
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
            Pin(size: 239.0, start: 25.0),
            Pin(size: 43.0, middle: 0.5711),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 27,
                  color: const Color(0xffa0522d),
                ),
                children: [
                  TextSpan(
                    text: '樹式 (Tree Pose)',
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
            Pin(size: 98.0, middle: 0.6999),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 27,
                  color: const Color(0xffa0522d),
                ),
                children: [
                  TextSpan(
                    text: '仰臥脊骨扭轉 \n(Lying Spinal Twist)',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
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
            Pin(size: 98.0, end: 616.0),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 27,
                  color: const Color(0xffa0522d),
                ),
                children: [
                  TextSpan(
                    text: '靠牆抬腿式\n (Legs Up the Wall)',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 41.0, end: 41.0),
            Pin(size: 180.0, middle: 0.2528),
            child:
                // Adobe XD layer: '36113884' (shape)
                Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assetstemp/child pose.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(width: 2.0, color: const Color(0xffa0522d)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 25.0, end: 24.0),
            Pin(size: 440.0, middle: 0.3169),
            child: Text(
              ' 1．膝蓋跪在墊子上，臀部緊靠著腿。雙手掌心向下向前延伸，上身慢慢彎下直到額頭貼地，讓身體從臀部至指尖完整延展。\n2．伸展的同時，平穩呼吸，呼氣時不妨嘗試從尾骨慢慢拉長身體，感受從脊椎、肩膀到脖子都完全伸展開來。\n3．手臂可放在腿旁邊，想加深伸展可以嘗試將手臂向前方伸出。',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 27,
                color: const Color(0xffa0522d),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 25.0, end: 24.0),
            Pin(size: 482.0, middle: 0.5112),
            child: Text(
              '1．貓式：四足跪姿，確保膝蓋在臀部下方，手腕在肩膀下方。背部放平，深吸一口氣。呼氣時，將脊椎往上拱起到天花板，下巴朝向胸部，讓脖子鬆開。\n2．牛式：吸氣時將頭和尾骨向天空抬起，注意不要在脖子上施加任何壓力。\n3．繼續從“貓式”到“牛式”來回流動，並將呼吸與每次運動連接起來-吸入“牛式”，然後呼出“貓式”，重複10次。',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 27,
                color: const Color(0xffa0522d),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 82.0, end: 82.0),
            Pin(size: 252.0, middle: 0.4229),
            child:
                // Adobe XD layer: 'cat-cow-yoga-pose-w…' (shape)
                Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assetstemp/cat cow pse.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(width: 2.0, color: const Color(0xffa0522d)),
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.123, 0.217),
            child:
                // Adobe XD layer: 'istockphoto-1255062…' (shape)
                Container(
              width: 225.0,
              height: 225.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assetstemp/tree pose.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(width: 2.0, color: const Color(0xffa0522d)),
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.123, 0.493),
            child:
                // Adobe XD layer: '34041281' (shape)
                Container(
              width: 225.0,
              height: 225.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assetstemp/lying spinal twist.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(width: 2.0, color: const Color(0xffa0522d)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 225.0, middle: 0.4385),
            Pin(size: 225.0, end: 374.0),
            child:
                // Adobe XD layer: '25429790' (shape)
                Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assetstemp/legs up the wall.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(width: 2.0, color: const Color(0xffa0522d)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 25.0, end: 24.0),
            Pin(size: 233.0, middle: 0.6645),
            child: Text(
              '1．雙腳踩穩在瑜伽墊上，接著吸氣將右腳抬離地面，將右腳腳板放在左大腿的內側。\n2．雙手合十擺在胸口位置，或將手臂舉到空中，向前凝視，停留3-5個呼吸後換邊。',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 27,
                color: const Color(0xffa0522d),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 25.0, end: 24.0),
            Pin(size: 369.0, middle: 0.8283),
            child: Text(
              '1．平躺在瑜珈墊上，將膝蓋往上彎曲到胸部，接著將兩手手臂向外伸出到T字型。\n2．將雙腿放回地面，接著將兩腿膝蓋一齊往右側倒，此時，兩側的肩胛骨都應該碰到地面，然後將頭向左轉，看向左邊。\n3．在這裡停五個呼吸，然後換另一側進行同樣的動作。',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 27,
                color: const Color(0xffa0522d),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 25.0, end: 24.0),
            Pin(size: 333.0, end: 24.0),
            child: Text(
              '1．盡可能靠近牆壁坐下，上半身平躺在地板上，將腳平放在牆上。\n2．伸直腳，使腳後跟擱在牆上，如果要伸展肩膀可以讓手臂平行打開。\n3．閉上眼睛，讓整個身體放鬆，維持五個呼吸五次或更多次。',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 27,
                color: const Color(0xffa0522d),
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
