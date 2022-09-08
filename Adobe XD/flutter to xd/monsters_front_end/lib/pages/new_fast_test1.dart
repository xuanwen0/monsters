import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class new_fastTest1 extends StatelessWidget {
  new_fastTest1({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffffed4),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: 94.0,
              height: 63.0,
              child: Text(
                '旅行',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 47,
                  color: const Color(0xffa0522d),
                ),
                softWrap: false,
              ),
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
          Padding(
            padding: EdgeInsets.fromLTRB(25.0, 90.0, 24.0, 260.0),
            child: SizedBox.expand(
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
                        '旅行是最能放鬆身心、為自己充電方法，遠離塵囂與網路。曾有研究調查發現，沒休假、放假與休長假的人相比，感到非常放鬆情緒的人。但也有研究指出，旅行前的幸福感往往大於旅行後，顛覆了一般人認為「旅行後更快樂」的想法。\n\n專家建議以下幾點：\n',
                  ),
                  TextSpan(
                    text: '· 目的地愈遠愈好，或乾脆「宅度假」\n',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text:
                        'Twitter也曾調查指出，目的地離家愈遠，愈能帶來愉快的體驗。\n然而，並非所有人都適合這種方式，如果你容易因為旅行而精疲力盡，「宅度假」可能才是最佳選擇。\n因為當陷入壓力泥淖時',
                  ),
                  TextSpan(
                    text: '，',
                    style: TextStyle(
                      fontSize: 32,
                    ),
                  ),
                  TextSpan(
                    text: '你需要的其實是親密感，不如與親友在熟悉地方一起度過，來得紓壓。\n\n',
                  ),
                  TextSpan(
                    text: '· 不要想「畢其功於一役」\n',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: '研究指出，比起一次完成所有需求的大旅行，透過一次次小旅行達成的效果更好。\n\n',
                  ),
                  TextSpan(
                    text: '· 「規劃旅行」最讓人幸福\n',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: '旅行最感到幸福的時候，事實上並非旅行中或旅行後，而是旅行前的規劃階段。\n\n',
                  ),
                  TextSpan(
                    text: '· 切記旅行不工作\n',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text:
                        '旅行時千萬不要掛心工作、處理公事，如此才能真正紓解壓力。而且，關於旅行的一切記憶更會烙印在腦中。\n\n',
                  ),
                  TextSpan(
                    text: '· 工作先排程，避免收假時的心理衝擊\n',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: '如果能事先將收假後的工作進度安排得鬆一些，可以避免心理落差太大，白白浪費了旅行帶來的療癒效果。',
                  ),
                ],
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
            )),
          ),
          Pinned.fromPins(
            Pin(start: 15.0, end: 15.0),
            Pin(size: 220.0, end: 28.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 15.0, end: 15.0),
            Pin(size: 220.0, end: 28.0),
            child:
                // Adobe XD layer: 'travel_happy_young_…' (shape)
                Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assetstemp/go to the trip2.png'),
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
