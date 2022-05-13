import 'dart:math';
import 'package:adobe_xd/adobe_xd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'interaction.dart';

List<String> robotAnswers = [
  "不要忽略你看見的",
  "當然",
  "好",
  "不是很好",
  "不會失望的",
  "尋求支援",
  "僅此一次",
  "試了才知道",
  "試著妥協",
  "當局者迷旁觀者清",
  "思考後再問我",
  "前不著村，後不著店",
  "船到橋頭自然直",
  "有關係嗎",
  "結果會讓你驚訝",
  "主動一點",
  "認清現實吧",
  "天機不可洩漏",
  "不要讓自己後悔",
  "不要",
  "不可能",
  "那又如何",
  "想想未來",
  "做你想做的",
  "失敗又如何",
  "答案就在眼前",
  "不要浪費時間",
  "時機未至",
  "先解決必須完成的",
  "去問專業的人",
  "是又如何",
  "時間會解決",
  "休息片刻",
  "給自己一點時間",
  "勇往直前",
  "不做無用之功",
  "將會成功",
  "這會很冒險",
  "真不了的假的",
  "假不了的真的",
  "不要太過分了",
  "斷捨離",
  "拭目以待",
  "盡全力了嗎",
  "見好就收",
  "我想想",
  "下次再說",
  "別人說了不算"
];
var numbersOfAnswers = robotAnswers.length;
String randomAnswer = "";
Random random = Random();

class AnswerbookforAnsPage extends StatefulWidget {
  @override
  _AnswerbookforAnsPage createState() => _AnswerbookforAnsPage();
}

class _AnswerbookforAnsPage extends State<AnswerbookforAnsPage> {
  String datatochange = robotAnswers[random.nextInt(numbersOfAnswers)];

  void changedata() {
    setState(() {
      datatochange = robotAnswers[random.nextInt(numbersOfAnswers)];
    });
  }

  @override
  Widget build(BuildContext context) {
    void changedata() {
      setState(() {
        datatochange = robotAnswers[random.nextInt(numbersOfAnswers)];
      });
    }

    return Scaffold(
      backgroundColor: const Color(0xfffffed4),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 188.0, middle: 0.5),
            Pin(size: 63.0, start: 9.0),
            child: const Text(
              '解答之書',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 47,
                color: Color(0xffa0522d),
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 41.0, end: 15.0),
            Pin(size: 36.0, start: 25.0),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 4.0, start: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffffbb00),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 4.0, middle: 0.5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffffbb00),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 5.0, end: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffffbb00),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 45.6, start: 14.4),
            Pin(size: 41.1, start: 23.4),
            child:
                // Adobe XD layer: 'Icon ionic-md-arrow…' (shape)
                PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => InteractionPage(),
                ),
              ],
              child: SvgPicture.string(
                _svg_ryq30,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: -8.0, end: -9.0),
            Pin(size: 555.0, end: 105.0),
            child:
                // Adobe XD layer: '14253' (shape)
                Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/image/background_answerBook.png'),
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.45), BlendMode.dstIn),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 136.0, middle: 0.5),
            Pin(size: 64.0, end: 73.0),
            child: Stack(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Pinned.fromPins(
                      Pin(size: 66.0, middle: 0.5),
                      Pin(start: 0.0, end: 0.0),
                      child: Container(
                        color: const Color(0xffffed97),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 70.0, start: 0.0),
                      Pin(start: 0.0, end: 0.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0xffffed97),
                          borderRadius: BorderRadius.all(
                              Radius.elliptical(9999.0, 9999.0)),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 70.0, end: 0.0),
                      Pin(start: 0.0, end: 0.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0xffffed97),
                          borderRadius: BorderRadius.all(
                              Radius.elliptical(9999.0, 9999.0)),
                        ),
                      ),
                    ),
                  ],
                ),
                Pinned.fromPins(
                  Pin(size: 100.0, middle: 0.5),
                  Pin(start: 6.0, end: 4.0),
                  child: TextButton(
                    child: const Text('再一次',
                        style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 23,
                            color: Color(0xffa0522d))),
                    onPressed: changedata,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 32.0, end: 31.0),
            Pin(size: 251.0, middle: 0.3491),
            child: Container(
              color: const Color(0xc9ffffff),
            ),
          ),
          Pinned.fromPins(
              Pin(start: 50.0, end: 50.0), Pin(size: 50.0, middle: 0.4),
              child: Center(
                child: Text(
                  datatochange,
                  style: const TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 25,
                    color: Color.fromARGB(255, 185, 40, 83),
                  ),
                  softWrap: false,
                ),
              )),
          Pinned.fromPins(
            Pin(start: 64.0, end: 64.0),
            Pin(size: 154.0, middle: 0.726),
            child:
                // Adobe XD layer: 'book-png-transparen…' (shape)
                Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image/background_answerBook_logo.png'),
                  fit: BoxFit.fill,
                ),
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
