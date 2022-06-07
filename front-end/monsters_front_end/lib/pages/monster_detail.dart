import 'package:adobe_xd/page_link.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monsters_front_end/pages/manual.dart';

class Monster_detail extends StatefulWidget {
  @override
  _Monster_detailState createState() => _Monster_detailState();
}

class _Monster_detailState extends State<Monster_detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffffed4),
      body: Stack(
        children: <Widget>[
          //標題Name
          Pinned.fromPins(
            Pin(size: 124.0, middle: 0.5),
            Pin(size: 63.0, start: 11.0),
            child: Text(
              '圖鑑',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 47,
                color: const Color(0xffa0522d),
              ),
              softWrap: false,
            ),
          ),
          //monster圖框
          Pinned.fromPins(
            Pin(start: 41.0, end: 40.0),
            Pin(size: 290.0, middle: 0.2707),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(22.0),
                    border:
                        Border.all(width: 1.0, color: const Color(0xffa0522d)),
                  ),
                ),
                // Adobe XD layer: 'monster1' (shape)
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage(
                          'assets/image/monsters_book_monster.png'),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                ),
                /*
                //星星
                Pinned.fromPins(
                  Pin(size: 163.5, end: 15.3),
                  Pin(size: 46.5, end: 14.9),
                  child: Stack(
                    children: <Widget>[
                      Pinned.fromPins(
                        Pin(size: 48.6, start: 0.0),
                        Pin(start: 0.0, end: 0.0),
                        child:
                            // Adobe XD layer: 'Icon awesome-star' (shape)
                            SvgPicture.string(
                          _svg_m5gacg,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 48.6, middle: 0.5),
                        Pin(start: 0.0, end: 0.0),
                        child:
                            // Adobe XD layer: 'Icon awesome-star' (shape)
                            SvgPicture.string(
                          _svg_hjs34o,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 48.6, end: 0.0),
                        Pin(start: 0.0, end: 0.0),
                        child:
                            // Adobe XD layer: 'Icon awesome-star' (shape)
                            SvgPicture.string(
                          _svg_so5uno,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
              */
              ],
            ),
          ),
          //monster Name
          Align(
            alignment: Alignment(-0.115, 0.277),
            child: SizedBox(
              width: 168.0,
              height: 60.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(size: 106.0, middle: 0.5),
                    Pin(start: 0.0, end: 0.0),
                    child: const Text(
                      '巴古',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 40,
                        color: Color(0xffa0522d),
                      ),
                      softWrap: false,
                    ),
                  ),
                  //share圖上方箭頭(變圓)
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(size: 1.0, end: 1.0),
                    child: SvgPicture.string(
                      _svg_cy6c6e,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  //share圖底部(變圓)
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(size: 1.0, end: 1.0),
                    child: SvgPicture.string(
                      _svg_uh9wt,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
          //下方衣服選項列
          Pinned.fromPins(
            Pin(start: 58.0, end: 58.0),
            Pin(size: 72.0, middle: 0.8201),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 72.0, start: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      border: Border.all(
                          width: 1.0, color: const Color(0xffa0522d)),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 72.0, middle: 0.5),
                  Pin(start: 0.0, end: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      border: Border.all(
                          width: 1.0, color: const Color(0xffa0522d)),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 72.0, end: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      border: Border.all(
                          width: 1.0, color: const Color(0xffa0522d)),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 45.0, start: 13.5),
                  Pin(size: 34.1, middle: 0.5),
                  child:
                      // Adobe XD layer: 'Icon map-clothing-s…' (shape)
                      SvgPicture.string(
                    _svg_qxppl0,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: 36.0,
                    height: 27.0,
                    child:
                        // Adobe XD layer: 'Icon awesome-redhat' (shape)
                        SvgPicture.string(
                      _svg_b2x6,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 36.9, end: 15.5),
                  Pin(size: 23.7, middle: 0.5),
                  child:
                      // Adobe XD layer: 'Icon ionic-ios-bowt…' (group)
                      Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment(0.033, 0.115),
                        child: SizedBox(
                          width: 8.0,
                          height: 10.0,
                          child: SvgPicture.string(
                            _svg_w4f3m,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 14.5, start: 0.0),
                        Pin(start: 0.0, end: 0.0),
                        child: SvgPicture.string(
                          _svg_bnhgh,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 14.1, end: 0.0),
                        Pin(start: 0.0, end: 0.0),
                        child: SvgPicture.string(
                          _svg_dlqz9c,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //share圖
          Align(
            alignment: Alignment(0.657, 0.276),
            child: SizedBox(
              width: 25.0,
              height: 25.0,
              child:
                  // Adobe XD layer: 'Icon feather-share' (group)
                  Stack(
                children: <Widget>[
                  //share圖底部
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(size: 13.8, end: 0.0),
                    child: SvgPicture.string(
                      _svg_krlxbt,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  //share圖上方箭頭
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width: 11.0,
                      height: 6.0,
                      child: SvgPicture.string(
                        _svg_na99y,
                        allowDrawingOutsideViewBox: true,
                      ),
                    ),
                  ),
                  //share圖中間直線
                  Pinned.fromPins(
                    Pin(size: 1.0, middle: 0.5336),
                    Pin(size: 15.9, start: 3.0),
                    child: SvgPicture.string(
                      _svg_gv3pne,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
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
                  pageBuilder: () => Manual(),
                ),
              ],
              child: SvgPicture.string(
                _svg_ryq30,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_m5gacg =
    '<svg viewBox="0.0 0.0 48.6 46.5" ><path transform="translate(-1.44, 0.0)" d="M 23.13892936706543 1.617578387260437 L 17.20573425292969 13.6475191116333 L 3.930997610092163 15.58284854888916 C 1.550449132919312 15.92811965942383 0.5964126586914062 18.8629150390625 2.322763919830322 20.5438346862793 L 11.92673015594482 29.90247344970703 L 9.655213356018066 43.12268829345703 C 9.246341705322266 45.51232147216797 11.76317977905273 47.30227279663086 13.87114810943604 46.1846923828125 L 25.74663162231445 39.94256591796875 L 37.62211608886719 46.1846923828125 C 39.73007965087891 47.29318618774414 42.24691772460938 45.5123176574707 41.83804321289062 43.12268829345703 L 39.5665283203125 29.90247344970703 L 49.17049789428711 20.54383277893066 C 50.89684677124023 18.86291313171387 49.94281768798828 15.92811965942383 47.5622673034668 15.58284759521484 L 34.28752517700195 13.6475191116333 L 28.35433006286621 1.617578387260437 C 27.291259765625 -0.5267308950424194 24.21109008789062 -0.5539891719818115 23.13893127441406 1.617578387260437 Z" fill="#ffff00" stroke="#a0522d" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_hjs34o =
    '<svg viewBox="57.4 0.0 48.6 46.5" ><path transform="translate(56.01, 0.0)" d="M 23.13892936706543 1.617578387260437 L 17.20573425292969 13.6475191116333 L 3.930997610092163 15.58284854888916 C 1.550449132919312 15.92811965942383 0.5964126586914062 18.8629150390625 2.322763919830322 20.5438346862793 L 11.92673015594482 29.90247344970703 L 9.655213356018066 43.12268829345703 C 9.246341705322266 45.51232147216797 11.76317977905273 47.30227279663086 13.87114810943604 46.1846923828125 L 25.74663162231445 39.94256591796875 L 37.62211608886719 46.1846923828125 C 39.73007965087891 47.29318618774414 42.24691772460938 45.5123176574707 41.83804321289062 43.12268829345703 L 39.5665283203125 29.90247344970703 L 49.17049789428711 20.54383277893066 C 50.89684677124023 18.86291313171387 49.94281768798828 15.92811965942383 47.5622673034668 15.58284759521484 L 34.28752517700195 13.6475191116333 L 28.35433006286621 1.617578387260437 C 27.291259765625 -0.5267308950424194 24.21109008789062 -0.5539891719818115 23.13893127441406 1.617578387260437 Z" fill="#ffff00" stroke="#a0522d" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_so5uno =
    '<svg viewBox="114.9 0.0 48.6 46.5" ><path transform="translate(113.46, 0.0)" d="M 23.13892936706543 1.617578387260437 L 17.20573425292969 13.6475191116333 L 3.930997610092163 15.58284854888916 C 1.550449132919312 15.92811965942383 0.5964126586914062 18.8629150390625 2.322763919830322 20.5438346862793 L 11.92673015594482 29.90247344970703 L 9.655213356018066 43.12268829345703 C 9.246341705322266 45.51232147216797 11.76317977905273 47.30227279663086 13.87114810943604 46.1846923828125 L 25.74663162231445 39.94256591796875 L 37.62211608886719 46.1846923828125 C 39.73007965087891 47.29318618774414 42.24691772460938 45.5123176574707 41.83804321289062 43.12268829345703 L 39.5665283203125 29.90247344970703 L 49.17049789428711 20.54383277893066 C 50.89684677124023 18.86291313171387 49.94281768798828 15.92811965942383 47.5622673034668 15.58284759521484 L 34.28752517700195 13.6475191116333 L 28.35433006286621 1.617578387260437 C 27.291259765625 -0.5267308950424194 24.21109008789062 -0.5539891719818115 23.13893127441406 1.617578387260437 Z" fill="#ffff00" stroke="#a0522d" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_cy6c6e =
    '<svg viewBox="107.0 476.0 168.0 1.0" ><path transform="translate(107.0, 476.0)" d="M 0 0 L 168 0" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_uh9wt =
    '<svg viewBox="107.0 476.0 168.0 1.0" ><path transform="translate(107.0, 476.0)" d="M 0 0 L 168 0" fill="none" stroke="#a0522d" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_qxppl0 =
    '<svg viewBox="68.5 534.9 45.0 34.1" ><path transform="translate(66.69, 528.47)" d="M 46.79785919189453 12.24777126312256 C 46.87810516357422 12.53866863250732 46.77679061889648 12.85965728759766 46.60727310180664 13.11042881011963 L 41.20061492919922 21.15521621704102 C 40.99999618530273 21.46617317199707 40.57869720458984 21.63669967651367 40.22661590576172 21.63669967651367 C 40.12630462646484 21.63669967651367 39.84543991088867 21.61663627624512 39.73610305786133 21.58654594421387 L 35.40274810791016 20.52326774597168 L 35.40274810791016 39.58199310302734 C 35.40274810791016 40.16378784179688 34.99148178100586 40.5850830078125 34.399658203125 40.5850830078125 L 13.33475589752197 40.5850830078125 C 12.74293231964111 40.5850830078125 12.3316650390625 40.16378402709961 12.3316650390625 39.58199310302734 L 12.3316650390625 20.52326774597168 L 8.439672470092773 21.5965747833252 C 7.988282203674316 21.73700714111328 7.597076416015625 21.55645179748535 7.346303939819336 21.16524505615234 L 1.979768872261047 13.14051914215088 C 1.809243321418762 12.87971591949463 1.75908887386322 12.58881950378418 1.839336037635803 12.29792213439941 C 1.909552454948425 11.99699592590332 2.120201587677002 11.79637718200684 2.391036033630371 11.65594387054443 L 13.33475589752197 6.480000495910645 L 18.35021018981934 6.480000495910645 C 18.94203186035156 6.480000495910645 19.35330009460449 6.891267776489258 19.35330009460449 7.483090400695801 C 19.35330009460449 9.549457550048828 22.25223159790039 11.01396942138672 24.31859970092773 11.01396942138672 C 26.38496589660645 11.01396942138672 29.38420677185059 9.559489250183105 29.38420677185059 7.483090400695801 C 29.38420677185059 6.901297569274902 29.79547500610352 6.479999542236328 30.38729667663574 6.479999542236328 L 35.40274810791016 6.479999542236328 L 46.23612594604492 11.55563831329346 C 46.51699066162109 11.69607067108154 46.71760940551758 11.94684314727783 46.79785537719727 12.24777126312256 Z" fill="#a0522d" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_w4f3m =
    '<svg viewBox="17.4 15.3 7.6 10.4" ><path transform="translate(2.23, 1.09)" d="M 21.35505485534668 15.15115928649902 C 20.95935440063477 14.450439453125 20.21741485595703 14.21961402893066 19.31060028076172 14.21961402893066 L 19.31060028076172 14.203125 C 18.81597328186035 14.203125 18.13174057006836 14.31029510498047 17.44750785827637 14.44219589233398 C 16.46649742126465 14.63180160522461 15.82348442077637 15.02750396728516 15.82348442077637 15.02750396728516 C 15.82348442077637 15.02750396728516 16.12026023864746 17.27805328369141 15.83172798156738 19.85011100769043 C 15.5431957244873 22.42216873168945 15.18046951293945 23.35371398925781 15.18046951293945 23.35371398925781 C 15.18046951293945 23.35371398925781 15.61738967895508 24.35120964050293 18.47797966003418 24.59028053283691 C 18.79948806762695 24.61501121520996 19.10450553894043 24.63149833679199 19.38479423522949 24.63149833679199 C 21.40451812744141 24.63149833679199 22.38552856445312 24.02970314025879 22.38552856445312 24.02970314025879 C 22.38552856445312 24.02970314025879 22.65757179260254 23.58453941345215 22.74001121520996 22.20783042907715 C 22.89664077758789 19.55333518981934 22.16294479370117 16.56084442138672 21.35505485534668 15.15115928649902 Z" fill="#a0522d" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_bnhgh =
    '<svg viewBox="2.3 7.9 14.5 23.7" ><path  d="M 16.56943321228027 15.85497188568115 C 14.75580406188965 12.54097461700439 9.463301658630371 7.874999523162842 6.569737911224365 7.874999523162842 C 4.38513708114624 7.875000476837158 2.25 13.5219841003418 2.25 19.74603271484375 C 2.25 25.9700813293457 4.14606761932373 31.6170654296875 6.495543003082275 31.6170654296875 C 9.248963356018066 31.6170654296875 15.60491180419922 25.02204895019531 15.60491180419922 25.02204895019531 C 15.60491180419922 25.02204895019531 16.07480621337891 23.98333358764648 16.42104339599609 22.25214195251465 L 16.56943130493164 21.39478874206543 C 16.62713813781738 21.0073299407959 16.67659950256348 20.59514236450195 16.70957565307617 20.15822219848633 C 16.73430633544922 19.86968994140625 16.75079536437988 19.59764671325684 16.7590389251709 19.34208869934082 L 16.78376960754395 18.53419876098633 C 16.84147644042969 17.21519470214844 16.56943321228027 15.85497188568115 16.56943321228027 15.85497188568115 Z" fill="#a0522d" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_dlqz9c =
    '<svg viewBox="25.0 7.9 14.1 23.7" ><path transform="translate(3.35, 0.0)" d="M 31.50973892211914 7.875 C 28.50900650024414 7.875 23.56274032592773 12.5327320098877 21.75735473632812 15.85497188568115 L 21.69140625 15.970383644104 C 21.69140625 15.970383644104 21.80681991577148 16.17647933959961 21.84803771972656 16.25067329406738 C 22.12833023071289 16.74530029296875 22.40037155151367 17.42953300476074 22.62295532226562 18.22917938232422 L 22.86202621459961 19.19370079040527 C 23.04338836669922 20.03456497192383 23.16704559326172 20.94138145446777 23.2082633972168 21.84819602966309 L 23.22475051879883 22.59013557434082 C 23.22475051879883 22.8292064666748 23.21651077270508 23.06002998352051 23.20001983642578 23.29085540771484 C 23.11758422851562 24.66756629943848 22.82080841064453 25.11272811889648 22.82080841064453 25.11272811889648 C 23.44733428955078 25.97832489013672 28.50901412963867 31.6170654296875 31.5756950378418 31.6170654296875 C 33.9251708984375 31.6170654296875 35.82123947143555 25.9700813293457 35.82123947143555 19.74603271484375 C 35.82123947143555 13.5219841003418 33.69433975219727 7.875 31.50973892211914 7.875 Z" fill="#a0522d" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_b2x6 =
    '<svg viewBox="185.0 538.4 36.0 27.2" ><path transform="translate(185.0, 534.0)" d="M 24.01312446594238 20.07843780517578 C 26.37914085388184 20.07843780517578 29.80265617370605 19.59046936035156 29.80265617370605 16.77375030517578 C 29.81812477111816 16.29984474182129 29.86312484741211 16.64578247070312 28.33453178405762 10.00687599182129 C 28.00968742370605 8.660391807556152 27.72421836853027 8.049375534057617 25.35960960388184 6.867423057556152 C 23.52515602111816 5.929454326629639 19.529296875 4.380470275878906 18.34734344482422 4.380470275878906 C 17.24625015258789 4.380470275878906 16.92703056335449 5.798673629760742 15.61429691314697 5.798673629760742 C 14.34867191314697 5.798673629760742 13.41281223297119 4.739767551422119 12.23085975646973 4.739767551422119 C 11.09601593017578 4.739767551422119 10.3563289642334 5.513205051422119 9.785390853881836 7.103673934936523 C 7.851797103881836 12.5564079284668 7.937578201293945 12.32578277587891 7.948828220367432 12.60703277587891 C 7.948828220367432 14.35078239440918 14.81414031982422 20.06789207458496 24.01312446594238 20.06789207458496 M 30.1640625 17.91843795776367 C 30.49101638793945 19.46531295776367 30.49101638793945 19.63054656982422 30.49101638793945 19.83445358276367 C 30.49101638793945 22.482421875 27.51468849182129 23.95195388793945 23.60039138793945 23.95195388793945 C 14.75929737091064 23.95757865905762 7.012969970703125 18.7734375 7.012969970703125 15.35062599182129 C 7.012233734130859 14.8737735748291 7.109395027160645 14.40184497833252 7.29843807220459 13.9640645980835 C 4.117499828338623 14.12296867370605 0 14.69039058685303 0 18.32554626464844 C 0 24.27890586853027 14.10679721832275 31.61460876464844 25.27663993835449 31.61460876464844 C 33.84000015258789 31.61460876464844 36 27.74179649353027 36 24.68320274353027 C 36 22.27781295776367 33.91945266723633 19.546875 30.16898345947266 17.91632843017578" fill="#a0522d" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_krlxbt =
    '<svg viewBox="6.5 15.2 25.0 13.8" ><path transform="translate(0.5, -2.79)" d="M 6 18 L 6 29.02945709228516 C 6 30.55230331420898 7.399109840393066 31.78681564331055 9.125 31.78681564331055 L 27.87499809265137 31.78681564331055 C 29.60088729858398 31.78681564331055 31.00000190734863 30.55230331420898 31.00000190734863 29.02945709228516 L 31.00000190734863 18" fill="none" stroke="#ffbb00" stroke-width="5" stroke-linecap="round" stroke-linejoin="round" /></svg>';
const String _svg_na99y =
    '<svg viewBox="13.8 4.0 11.0 5.5" ><path transform="translate(1.78, 1.0)" d="M 23.02945327758789 8.514726638793945 L 17.51472663879395 3 L 12 8.514726638793945" fill="none" stroke="#ffbb00" stroke-width="5" stroke-linecap="round" stroke-linejoin="round" /></svg>';
const String _svg_gv3pne =
    '<svg viewBox="19.3 7.0 1.0 15.9" ><path transform="translate(1.31, 3.99)" d="M 18 3 L 18 18.94668579101562" fill="none" stroke="#ffbb00" stroke-width="5" stroke-linecap="round" stroke-linejoin="round" /></svg>';
const String _svg_ryq30 =
    '<svg viewBox="13.7 21.9 45.6 41.1" ><path transform="translate(8.07, 15.61)" d="M 47.28736877441406 22.92952919006348 L 19.54702568054199 22.92952919006348 L 30.30613327026367 13.09178352355957 C 31.84870529174805 11.54302215576172 31.84870529174805 9.040220260620117 30.30613327026367 7.491456031799316 C 28.76356315612793 5.942692756652832 26.26174545288086 5.942692756652832 24.70621109008789 7.491456031799316 L 6.791648864746094 24.09420013427734 C 6.013882637023926 24.81282615661621 5.624999046325684 25.79164695739746 5.624999046325684 26.86958694458008 L 5.624999046325684 26.91914939880371 C 5.624999046325684 27.99708938598633 6.013882637023926 28.97590446472168 6.791648864746094 29.69453430175781 L 24.69325065612793 46.29727935791016 C 26.24878120422363 47.84604263305664 28.75060272216797 47.84604263305664 30.29317092895508 46.29727935791016 C 31.83573913574219 44.74851226806641 31.83573913574219 42.2457160949707 30.29317092895508 40.69694900512695 L 19.5340633392334 30.85920524597168 L 47.27440643310547 30.85920524597168 C 49.46512222290039 30.85920524597168 51.24102020263672 29.08742141723633 51.24102020263672 26.89437294006348 C 51.25398254394531 24.66414642333984 49.47808074951172 22.92952919006348 47.28736877441406 22.92952919006348 Z" fill="#ffbb00" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
