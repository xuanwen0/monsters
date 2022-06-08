import 'package:adobe_xd/page_link.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monsters_front_end/pages/dailyTest_correct.dart';
import 'package:monsters_front_end/pages/dailyTest_wrong.dart';
import 'package:monsters_front_end/pages/interaction.dart';

class Daily_test extends StatefulWidget {
  @override
  _Daily_testState createState() => _Daily_testState();
}

class _Daily_testState extends State<Daily_test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffffed4),
      body: Stack(
        children: <Widget>[
          //標題
          Pinned.fromPins(
            Pin(size: 200.0, middle: 0.5),
            Pin(size: 63.0, start: 20.0),
            child: const Text(
              '每日測驗',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 40,
                color: Color(0xffa0522d),
              ),
              softWrap: false,
            ),
          ),
          //題目
          Pinned.fromPins(
              Pin(start: 34.0, end: 34.0), Pin(size: 195.0, start: 111.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 265.0,
                      height: 37.0,
                      child: Text(
                        '人生大約有幾個月呢?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 26,
                          color: Color.fromRGBO(160, 82, 45, 1),
                        ),
                        softWrap: false,
                      ),
                    ),
                  ),
                ],
              )),
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
          //答案選項
          Pinned.fromPins(
            Pin(start: 28.0, end: 27.0),
            Pin(size: 409.0, end: 41.0),
            child: SingleChildScrollView(
              primary: false,
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 20,
                runSpacing: 20,
                children: [
                  //A
                  SizedBox(
                    width: 400.0,
                    height: 86.0,
                    child: Stack(
                      children: <Widget>[
                        PageLink(
                            links: [
                              PageLinkInfo(
                                transition: LinkTransition.Fade,
                                ease: Curves.easeOut,
                                duration: 0.3,
                                pageBuilder: () => DailyTest_correct(),
                              ),
                            ],
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(22.0),
                                  ),
                                  margin: EdgeInsets.fromLTRB(
                                      13.0, 17.0, 0.0, 18.0),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    width: 120.0,
                                    height: 37.0,
                                    child: Text(
                                      '700個月',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Segoe UI',
                                        fontSize: 26,
                                        color: const Color(0xffa0522d),
                                      ),
                                      softWrap: false,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        Pinned.fromPins(
                          Pin(size: 87.0, start: 0.0),
                          Pin(start: 0.0, end: 0.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 30.0, start: 30.0),
                          Pin(size: 40.0, middle: 0.5),
                          child: const Text(
                            'A',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 30,
                              color: Color(0xffa0522d),
                            ),
                            softWrap: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //B
                  SizedBox(
                    width: 357.0,
                    height: 86.0,
                    child: Stack(
                      children: <Widget>[
                        PageLink(
                            links: [
                              PageLinkInfo(
                                transition: LinkTransition.Fade,
                                ease: Curves.easeOut,
                                duration: 0.3,
                                pageBuilder: () => DailyTest_wrong(),
                              ),
                            ],
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(22.0),
                                  ),
                                  margin: EdgeInsets.fromLTRB(
                                      13.0, 17.0, 0.0, 18.0),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    width: 101.0,
                                    height: 37.0,
                                    child: Text(
                                      '800個月',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Segoe UI',
                                        fontSize: 26,
                                        color: const Color(0xffa0522d),
                                      ),
                                      softWrap: false,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        Pinned.fromPins(
                          Pin(size: 87.0, start: 0.0),
                          Pin(start: 0.0, end: 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 30.0, start: 30.0),
                          Pin(size: 40.0, middle: 0.5),
                          child: Text(
                            'B',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 30,
                              color: const Color(0xffa0522d),
                            ),
                            softWrap: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //C
                  SizedBox(
                    width: 357.0,
                    height: 86.0,
                    child: Stack(
                      children: <Widget>[
                        PageLink(
                            links: [
                              PageLinkInfo(
                                transition: LinkTransition.Fade,
                                ease: Curves.easeOut,
                                duration: 0.3,
                                pageBuilder: () => DailyTest_wrong(),
                              ),
                            ],
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(22.0),
                                  ),
                                  margin: EdgeInsets.fromLTRB(
                                      13.0, 17.0, 0.0, 18.0),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    width: 101.0,
                                    height: 37.0,
                                    child: Text(
                                      '900個月',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Segoe UI',
                                        fontSize: 26,
                                        color: const Color(0xffa0522d),
                                      ),
                                      softWrap: false,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        Pinned.fromPins(
                          Pin(size: 87.0, start: 0.0),
                          Pin(start: 0.0, end: 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 30.0, start: 30.0),
                          Pin(size: 40.0, middle: 0.5),
                          child: Text(
                            'C',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 30,
                              color: const Color(0xffa0522d),
                            ),
                            softWrap: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //D
                  SizedBox(
                    width: 357.0,
                    height: 86.0,
                    child: Stack(
                      children: <Widget>[
                        PageLink(
                            links: [
                              PageLinkInfo(
                                transition: LinkTransition.Fade,
                                ease: Curves.easeOut,
                                duration: 0.3,
                                pageBuilder: () => DailyTest_wrong(),
                              ),
                            ],
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(22.0),
                                  ),
                                  margin: EdgeInsets.fromLTRB(
                                      13.0, 17.0, 0.0, 18.0),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    width: 115.0,
                                    height: 37.0,
                                    child: Text(
                                      '1000個月',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Segoe UI',
                                        fontSize: 26,
                                        color: const Color(0xffa0522d),
                                      ),
                                      softWrap: false,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        Pinned.fromPins(
                          Pin(size: 87.0, start: 0.0),
                          Pin(start: 0.0, end: 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 30.0, start: 30.0),
                          Pin(size: 40.0, middle: 0.5),
                          child: Text(
                            'D',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 30,
                              color: const Color(0xffa0522d),
                            ),
                            softWrap: false,
                          ),
                        ),
                      ],
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
