import 'package:adobe_xd/page_link.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monsters_front_end/pages/interaction.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Psychologicial_game extends StatefulWidget {
  @override
  _Psychologicial_gameState createState() => _Psychologicial_gameState();
}

class _Psychologicial_gameState extends State<Psychologicial_game> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    const int gameCount = 4;
    const List<String> gameWebs = [
      'https://girlstyle.com/tw/article/278283/%E5%BF%83%E7%90%86%E6%B8%AC%E9%A9%97-%E4%BA%BA%E6%A0%BC-%E6%BD%9B%E6%84%8F%E8%AD%98-%E6%A3%AE%E6%9E%97-%E5%B0%8F%E6%9C%A8%E5%B1%8B-%E8%8A%B1-%E5%8B%95%E7%89%A9-%E5%80%8B%E6%80%A7',
      'https://womany.net/read/article/28510',
      'https://www.popdaily.com.tw/korea/741531',
      'https://www.beauty321.com/post/47206'
    ];
    const List<String> gameNames = ['森林', '愛情', '煩惱', '社交'];
    return Scaffold(
        backgroundColor: const Color(0xfffffed4),
        body: Stack(
          children: <Widget>[
            //標題
            Pinned.fromPins(
              Pin(size: 200.0, middle: 0.5),
              Pin(size: 63.0, start: 20.0),
              child: Text(
                '心理小遊戲',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 40,
                  color: const Color(0xffa0522d),
                ),
                softWrap: false,
              ),
            ),
            //箭頭
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
            //列表
            Pinned.fromPins(
              Pin(start: 8.0, end: 8.0),
              Pin(size: 524.0, end: 85.0),
              child: ListView.separated(
                primary: false,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        TextButton(
                          onPressed: () => launch(gameWebs[index]),
                          child: Text(gameNames[index]),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                            foregroundColor: MaterialStateProperty.all(
                                const Color.fromRGBO(160, 82, 45, 1)),
                            textStyle: MaterialStateProperty.all(
                                const TextStyle(fontSize: 40)),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: gameCount,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(height: 10.0, color: Colors.transparent);
                },
              ),
            ),
          ],
        ));
  }
}

const String _svg_ryq30 =
    '<svg viewBox="13.7 21.9 45.6 41.1" ><path transform="translate(8.07, 15.61)" d="M 47.28736877441406 22.92952919006348 L 19.54702568054199 22.92952919006348 L 30.30613327026367 13.09178352355957 C 31.84870529174805 11.54302215576172 31.84870529174805 9.040220260620117 30.30613327026367 7.491456031799316 C 28.76356315612793 5.942692756652832 26.26174545288086 5.942692756652832 24.70621109008789 7.491456031799316 L 6.791648864746094 24.09420013427734 C 6.013882637023926 24.81282615661621 5.624999046325684 25.79164695739746 5.624999046325684 26.86958694458008 L 5.624999046325684 26.91914939880371 C 5.624999046325684 27.99708938598633 6.013882637023926 28.97590446472168 6.791648864746094 29.69453430175781 L 24.69325065612793 46.29727935791016 C 26.24878120422363 47.84604263305664 28.75060272216797 47.84604263305664 30.29317092895508 46.29727935791016 C 31.83573913574219 44.74851226806641 31.83573913574219 42.2457160949707 30.29317092895508 40.69694900512695 L 19.5340633392334 30.85920524597168 L 47.27440643310547 30.85920524597168 C 49.46512222290039 30.85920524597168 51.24102020263672 29.08742141723633 51.24102020263672 26.89437294006348 C 51.25398254394531 24.66414642333984 49.47808074951172 22.92952919006348 47.28736877441406 22.92952919006348 Z" fill="#ffbb00" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
