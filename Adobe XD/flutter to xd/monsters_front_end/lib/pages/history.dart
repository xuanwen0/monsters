// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monsters_front_end/pages/home.dart';
import 'package:monsters_front_end/pages/interaction.dart';
import 'package:monsters_front_end/pages/manual.dart';
import 'package:monsters_front_end/pages/social.dart';
import 'package:monsters_front_end/repository/annoyanceRepo.dart';
import 'package:monsters_front_end/state/drawer.dart';
import '../model/annoyanceModel.dart';
import 'annoyanceChat.dart';

//全域變數
bool beep = false;
var userAccount = 'Lin';
var tempNum = 0;
var tempString = [];
var len;

void getMaxIdByAccount(String account) {
  final AnnoyanceRepository annoyanceRepository = AnnoyanceRepository();
  final Future<Data> annoyances = annoyanceRepository
      .searchAnnoyanceByAccount(account)
      .then((value) => Data.fromJson(value!));
  annoyances.then((value) => len = value.data.length.toString());
  annoyances.then((value) => storeMaxId(value.data.length));
}

//取得最大ID 得到總筆數
void storeMaxId(int length) {
  len = length;
}

//資料庫 用帳號抓煩惱
void getAnnoyanceByAccount(String account, int index) {
  final AnnoyanceRepository annoyanceRepository = AnnoyanceRepository();
  Future<Data> annoyances = annoyanceRepository
      .searchAnnoyanceByAccount(account)
      .then((value) => Data.fromJson(value!));
  annoyances.then(
    (value) => storeItem(
        value.data.elementAt(index).content,
        value.data.elementAt(index).time,
        value.data.elementAt(index).type.toString(),
        value.data.elementAt(index).monsterId.toString(),
        value.data.elementAt(index).mood,
        value.data.elementAt(index).index.toString(),
        value.data.elementAt(index).solve.toString(),
        value.data.elementAt(index).share.toString()),
  );
}

void storeItem(String content, String time, String type, String monsterId,
    String mood, String index, String solve, String share) {
  tempString = [content, time, type, monsterId, mood, index, solve, share];
}

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> with SingleTickerProviderStateMixin {
  //新增的浮出按鈕動畫用
  late AnimationController animationController;
  late Animation degOneTranslationAnimation, degTwoTranslationAnimation;
  late Animation rotationAnimation;
  int selectionTab_type = 1;
  int selectionTab_solve = 0;
  bool selectionTab_solve_enabled = false;
  //控制執行續
  late Timer _timer;
  int curentTimer = 0;
  bool reset = false;

  List<String> historyContents = [];
  List<String> historyTimes = [];
  var index;
  @override
  Widget build(BuildContext context) {
    getMaxIdByAccount('Lin');
    GlobalKey<ScaffoldState> _scaffoldKEy = GlobalKey<ScaffoldState>();
    int historyCount = historyContents.length < 0 ? 0 : historyContents.length;
    if (reset == false) {
      index = 0;
      reset = true;
    }
    getMaxIdByAccount(userAccount);
    getAnnoyanceByAccount(userAccount, index == null ? 0 : index);
    try {
      int temper = index - 1 < 0 ? 0 : index - 1;
      historyContents.insert(temper, tempString[0]);
      historyTimes.insert(temper, tempString[1]);
      index++;
      log(historyContents.toString());
      //log("historycontents = " + historyContents.toString()); //除錯
      //執行續搶先時除錯 -> rollback
      if (beep == false && historyCount > 0) {
        log("BEEP"); //執行續搶先時除錯 -> LOG提示
        historyContents.removeLast();
        historyTimes.removeLast();
        beep = true;
      }
    } catch (e) {
      //log("BB = " + e.toString());
      tempString.clear();
    }

    //log("historyCount = " + historyCount.toString());
    //畫面呈現
    return Scaffold(
      backgroundColor: const Color(0xfffffed4),
      key: _scaffoldKEy,
      endDrawer: GetDrawer(context),
      body: Stack(
        children: <Widget>[
          //標題
          Pinned.fromPins(
            Pin(size: 200.0, middle: 0.5),
            Pin(size: 63.0, start: 20.0),
            child: const Text(
              '歷史紀錄',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 40,
                color: Color(0xffa0522d),
              ),
              softWrap: false,
            ),
          ),
          //底部
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 78.0, end: 0.0),
            child: Container(
              color: const Color(0xffffed97),
            ),
          ),
          //抽屜
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              alignment: Alignment.center,
              iconSize: 57.0,
              icon: const Icon(Icons.menu_rounded),
              color: const Color(0xffffbb00),
              onPressed: () => _scaffoldKEy.currentState?.openEndDrawer(),
            ),
          ),
          //類別:全部
          Pinned.fromPins(
            Pin(size: 44.8, start: 24.5),
            Pin(size: 30.0, start: 93.0),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 70.0, middle: 0.5),
                  Pin(start: 0.0, end: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: selectionTab_type == 1
                          ? const Color(0xffa0522d)
                          : const Color(0xffffed97),
                      borderRadius: const BorderRadius.all(
                          Radius.elliptical(9999.0, 9999.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(1.0, 0.0, 3.8, 0.0),
                  child: InkWell(
                      child: SizedBox.expand(
                          child: Text(
                        '全部',
                        style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 20,
                            color: selectionTab_type == 1 //點按後更新文字顏色
                                ? const Color(0xffffffff)
                                : const Color(0xffa0522d)),
                        softWrap: false,
                      )),
                      onTap: () {
                        setState(() {
                          selectionTab_type = 1;
                          selectionTab_solve_enabled = false;
                          selectionTab_solve = 0;
                        });
                      }),
                ),
              ],
            ),
          ),
          //類別:煩惱
          Pinned.fromPins(
            Pin(size: 44.8, middle: 0.2846),
            Pin(size: 30.0, start: 93.0),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 70.0, middle: 0.5385),
                  Pin(start: 0.0, end: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: selectionTab_type == 2
                          ? const Color(0xffa0522d)
                          : const Color(0xffffed97),
                      borderRadius: const BorderRadius.all(
                          Radius.elliptical(9999.0, 9999.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(1.0, 0.0, 3.8, 0.0),
                  child: InkWell(
                      child: SizedBox.expand(
                          child: Text(
                        '煩惱',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 20,
                            color: selectionTab_type == 2 //點按後更新文字顏色
                                ? const Color(0xffffffff)
                                : const Color(0xffa0522d)),
                        softWrap: false,
                      )),
                      onTap: () {
                        setState(() {
                          selectionTab_type = 2;
                          selectionTab_solve_enabled = true;
                          selectionTab_solve = 1;
                        });
                      }),
                ),
              ],
            ),
          ),
          //類別:日記
          Pinned.fromPins(
            Pin(size: 44.8, middle: 0.5025),
            Pin(size: 30.0, start: 93.0),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 70.0, middle: 0.5385),
                  Pin(start: 0.0, end: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: selectionTab_type == 3
                          ? const Color(0xffa0522d)
                          : const Color(0xffffed97),
                      borderRadius: const BorderRadius.all(
                          Radius.elliptical(9999.0, 9999.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(1.0, 0.0, 3.8, 0.0),
                  child: InkWell(
                      child: SizedBox.expand(
                          child: Text(
                        '日記',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 20,
                            color: selectionTab_type == 3 //點按後更新文字顏色
                                ? const Color(0xffffffff)
                                : const Color(0xffa0522d)),
                        softWrap: false,
                      )),
                      onTap: () {
                        setState(() {
                          selectionTab_type = 3;
                          selectionTab_solve_enabled = false;
                          selectionTab_solve = 0;
                        });
                      }),
                ),
              ],
            ),
          ),
          //類別:未解決
          Pinned.fromPins(
            Pin(size: 60.0, middle: 0.7298),
            Pin(size: 30.0, start: 93.0),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 75.0, middle: 0.5385),
                  Pin(start: 0.0, end: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: selectionTab_solve == 1
                          ? const Color(0xffa0522d)
                          : const Color(0xffffed97),
                      borderRadius: const BorderRadius.all(
                          Radius.elliptical(9999.0, 9999.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(1.0, 0.0, 3.8, 0.0),
                  child: InkWell(
                      child: SizedBox.expand(
                          child: Text(
                        '未解決',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 18,
                            color: selectionTab_solve == 1 //點按後更新文字顏色
                                ? const Color(0xffffffff)
                                : const Color(0xffa0522d)),
                        softWrap: false,
                      )),
                      onTap: () {
                        setState(() {
                          if (selectionTab_solve_enabled == true) {
                            selectionTab_solve = 1;
                          }
                        });
                      }),
                ),
              ],
            ),
          ),
          //類別:已解決
          Pinned.fromPins(
            Pin(size: 60.0, end: 15.1),
            Pin(size: 30.0, start: 93.0),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 75.0, middle: 0.5385),
                  Pin(start: 0.0, end: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: selectionTab_solve == 2
                          ? const Color(0xffa0522d)
                          : const Color(0xffffed97),
                      borderRadius: const BorderRadius.all(
                          Radius.elliptical(9999.0, 9999.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(1.0, 0.0, 3.8, 0.0),
                  child: InkWell(
                      child: SizedBox.expand(
                          child: Text(
                        '已解決',
                        style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 18,
                            color: selectionTab_solve == 2 //點按後更新文字顏色
                                ? const Color(0xffffffff)
                                : const Color(0xffa0522d)),
                        softWrap: false,
                      )),
                      onTap: () {
                        setState(() {
                          if (selectionTab_solve_enabled == true) {
                            selectionTab_solve = 2;
                          }
                        });
                      }),
                ),
              ],
            ),
          ),
          //煩惱列表
          Pinned.fromPins(
            Pin(start: 8.0, end: 8.0),
            Pin(start: 140.0, end: 85.0),
            child: ListView.separated(
              primary: false,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: Column(
                    children: [
                      SizedBox(
                        width: 365.0,
                        height: 105.0,
                        child: PageLink(
                          /*
                          links: [
                            PageLinkInfo(
                              transition: LinkTransition.Fade,
                              ease: Curves.easeOut,
                              duration: 0.3,
                              pageBuilder: () => historyAnnoyanceChat(),
                            ),
                          ],*/

                          links: [],
                          child: Stack(
                            children: <Widget>[
                              //底
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                  borderRadius: BorderRadius.circular(13.0),
                                  border: Border.all(
                                      width: 1.0,
                                      color: const Color(0xffa0522d)),
                                ),
                              ),
                              //頭貼
                              Pinned.fromPins(
                                Pin(size: 69.0, start: 25.0),
                                Pin(start: 19.0, end: 18.0),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(9999.0, 9999.0)),
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/image/baku1.jpg'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              //內容
                              Pinned.fromPins(
                                Pin(size: 170.0, start: 105.0),
                                Pin(size: 81.0, end: 10.0),
                                child: Text(
                                  historyContents[index],
                                  style: const TextStyle(
                                    fontFamily: 'Segoe UI',
                                    fontSize: 20,
                                    color: Color.fromRGBO(160, 82, 45, 1),
                                  ),
                                  softWrap: true,
                                ),
                              ),
                              //時間
                              Pinned.fromPins(
                                Pin(size: 45.0, end: 20.0),
                                Pin(size: 21.0, middle: 0.8),
                                child: Text(
                                  historyTimes[index],
                                  style: const TextStyle(
                                    fontFamily: 'Segoe UI',
                                    fontSize: 16,
                                    color: Color.fromRGBO(97, 48, 24, 1),
                                  ),
                                  softWrap: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: historyCount,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  height: 10.0,
                  color: Colors.transparent,
                );
              },
            ),
          ),
          //圖鑑
          Pinned.fromPins(
            Pin(size: 69.0, middle: 0.2624),
            Pin(size: 68.0, end: 5.0),
            child:
                // Adobe XD layer: 'book' (group)
                PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => Manual(),
                ),
              ],
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                    ),
                  ),
                  Align(
                    alignment: const Alignment(-0.015, -0.398),
                    child: SizedBox(
                      width: 24.0,
                      height: 27.0,
                      child:
                          // Adobe XD layer: 'Icon awesome-book' (shape)
                          SvgPicture.string(
                        _svg_i02mi2,
                        allowDrawingOutsideViewBox: true,
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 24.0, middle: 0.4889),
                    Pin(size: 16.0, end: 9.0),
                    child: const Text(
                      '圖鑑',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 12,
                        color: Color(0xffa0522d),
                      ),
                      softWrap: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
          //歷史紀錄
          Pinned.fromPins(
            Pin(size: 69.0, middle: 0.7347),
            Pin(size: 68.0, end: 5.0),
            child:
                // Adobe XD layer: 'book' (group)
                PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => MainPage(),
                ),
              ],
              child:
                  // Adobe XD layer: 'history' (group)
                  Stack(
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 48.0, end: 9.0),
                    Pin(size: 16.0, end: 9.0),
                    child: const Text(
                      '歷史紀錄',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 12,
                        color: Color(0xffa0522d),
                      ),
                      softWrap: false,
                    ),
                  ),
                  Align(
                    alignment: const Alignment(0.073, -0.408),
                    child: SizedBox(
                      width: 28.0,
                      height: 28.0,
                      child:
                          // Adobe XD layer: 'Icon awesome-history' (shape)
                          SvgPicture.string(
                        _svg_uat9w,
                        allowDrawingOutsideViewBox: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //社群
          Pinned.fromPins(
            Pin(size: 69.0, end: 10.0),
            Pin(size: 68.0, end: 5.0),
            child:
                // Adobe XD layer: 'social' (group)
                PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => const Social(),
                ),
              ],
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 24.0, middle: 0.5111),
                    Pin(size: 16.0, end: 9.0),
                    child: const Text(
                      '社群',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 12,
                        color: Color(0xffa0522d),
                      ),
                      softWrap: false,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(start: 17.0, end: 17.0),
                    Pin(size: 22.3, middle: 0.3217),
                    child:
                        // Adobe XD layer: 'Icon material-people' (shape)
                        SvgPicture.string(
                      _svg_kzt9m,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
          //互動
          Pinned.fromPins(
            Pin(size: 69.0, start: 9.0),
            Pin(size: 68.0, end: 5.0),
            child:
                // Adobe XD layer: 'interactive' (group)
                PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => InteractionPage(),
                ),
              ],
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 24.0, middle: 0.5111),
                    Pin(size: 16.0, end: 9.0),
                    child: const Text(
                      '互動',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 12,
                        color: Color(0xffa0522d),
                      ),
                      softWrap: false,
                    ),
                  ),
                  Align(
                    alignment: const Alignment(-0.008, -0.415),
                    child: SizedBox(
                      width: 29.0,
                      height: 29.0,
                      child:
                          // Adobe XD layer: 'Icon material-gamep…' (shape)
                          SvgPicture.string(
                        _svg_a3julx,
                        allowDrawingOutsideViewBox: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //新增
          Pinned.fromPins(
            Pin(size: 150.0, middle: 0.5),
            Pin(size: 150.0, end: 5.0),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Positioned(
                    child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    IgnorePointer(
                      child: Container(
                        color: Colors.transparent,
                        height: 150.0,
                        width: 150.0,
                      ),
                    ),
                    Transform(
                      transform: Matrix4.rotationZ(
                          getRadiansFromDegree(rotationAnimation.value)),
                      alignment: Alignment.center,
                      child: CircularButton(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        width: 70,
                        height: 70,
                        icon: const Icon(
                          Icons.add_rounded,
                          color: Color.fromRGBO(255, 187, 0, 1),
                          size: 50,
                        ),
                        onClick: () {
                          if (animationController.isCompleted) {
                            animationController.reverse();
                          } else {
                            animationController.forward();
                          }
                        },
                      ),
                    ),
                    Transform.translate(
                      offset: Offset.fromDirection(getRadiansFromDegree(235),
                          degOneTranslationAnimation.value * 80),
                      child: Transform(
                        transform: Matrix4.rotationZ(
                            getRadiansFromDegree(rotationAnimation.value))
                          ..scale(degOneTranslationAnimation.value),
                        alignment: Alignment.center,
                        child: CircularButton(
                          color: Colors.blueAccent,
                          width: 70,
                          height: 70,
                          icon: const Icon(
                            Icons.sentiment_dissatisfied,
                            color: Colors.white,
                            size: 40,
                          ),
                          onClick: () {
                            animationController.reverse();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AnnoyanceChat()));
                          },
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset.fromDirection(getRadiansFromDegree(305),
                          degTwoTranslationAnimation.value * 80),
                      child: Transform(
                        transform: Matrix4.rotationZ(
                            getRadiansFromDegree(rotationAnimation.value))
                          ..scale(degTwoTranslationAnimation.value),
                        alignment: Alignment.center,
                        child: CircularButton(
                          color: Colors.orangeAccent,
                          width: 70,
                          height: 70,
                          icon: const Icon(
                            Icons.import_contacts,
                            color: Colors.white,
                            size: 40,
                          ),
                          onClick: () {
                            // animationController.reverse();
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Add_diary()));
                          },
                        ),
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  //介面設計
  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  //初始化
  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.2), weight: 75.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.2, end: 1.0), weight: 25.0),
    ]).animate(animationController);
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.4), weight: 55.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.4, end: 1.0), weight: 45.0),
    ]).animate(animationController);
    rotationAnimation = Tween<double>(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    super.initState();

    beep = false;

    Timer(Duration(milliseconds: 800), () {
      _timer = Timer.periodic(Duration(milliseconds: 350), (timer) {
        ///取12筆
        if (index > 12) {
          setState(() {});
          _timer.cancel();
        } else {
          setState(() {});
        }
      });
    });
  }
}

class CircularButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Icon icon;
  final void Function() onClick;

  CircularButton(
      {required this.color,
      required this.width,
      required this.height,
      required this.icon,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      width: width,
      height: height,
      child: IconButton(icon: icon, onPressed: onClick, enableFeedback: true),
    );
  }
}

const String _svg_i02mi2 =
    '<svg viewBox="112.3 717.3 23.7 27.1" ><path transform="translate(112.33, 717.32)" d="M 23.66897201538086 19.01971054077148 L 23.66897201538086 1.267980933189392 C 23.66897201538086 0.5653080940246582 23.10366439819336 0 22.40099143981934 0 L 5.071923732757568 0 C 2.271798849105835 0 0 2.271798849105835 0 5.071923732757568 L 0 21.97833633422852 C 0 24.7784595489502 2.271798849105835 27.05025482177734 5.071923732757568 27.05025482177734 L 22.40099143981934 27.05025482177734 C 23.10366439819336 27.05025482177734 23.66897201538086 26.48495101928711 23.66897201538086 25.78227424621582 L 23.66897201538086 24.93695259094238 C 23.66897201538086 24.54071044921875 23.48405838012695 24.18144989013672 23.19876289367676 23.94898414611816 C 22.97686576843262 23.13536262512207 22.97686576843262 20.81601715087891 23.19876289367676 20.00239562988281 C 23.48405838012695 19.77521514892578 23.66897201538086 19.41595458984375 23.66897201538086 19.01971054077148 Z M 6.762563705444336 7.079558849334717 C 6.762563705444336 6.905211925506592 6.905211925506592 6.762563705444336 7.079558849334717 6.762563705444336 L 18.28005599975586 6.762563705444336 C 18.45440292358398 6.762563705444336 18.59705352783203 6.905211925506592 18.59705352783203 7.079558849334717 L 18.59705352783203 8.136210441589355 C 18.59705352783203 8.310558319091797 18.45440292358398 8.453206062316895 18.28005599975586 8.453206062316895 L 7.079558849334717 8.453206062316895 C 6.905211925506592 8.453206062316895 6.762563705444336 8.310558319091797 6.762563705444336 8.136210441589355 L 6.762563705444336 7.079558849334717 Z M 6.762563705444336 10.46084022521973 C 6.762563705444336 10.28649425506592 6.905211925506592 10.14384746551514 7.079558849334717 10.14384746551514 L 18.28005599975586 10.14384746551514 C 18.45440292358398 10.14384746551514 18.59705352783203 10.28649425506592 18.59705352783203 10.46084022521973 L 18.59705352783203 11.51749134063721 C 18.59705352783203 11.69183731079102 18.45440292358398 11.83448600769043 18.28005599975586 11.83448600769043 L 7.079558849334717 11.83448600769043 C 6.905211925506592 11.83448600769043 6.762563705444336 11.69183731079102 6.762563705444336 11.51749134063721 L 6.762563705444336 10.46084022521973 Z M 20.15032768249512 23.66897201538086 L 5.071923732757568 23.66897201538086 C 4.136787414550781 23.66897201538086 3.381281852722168 22.9134693145752 3.381281852722168 21.97833633422852 C 3.381281852722168 21.04848289489746 4.142070293426514 20.28769493103027 5.071923732757568 20.28769493103027 L 20.15032768249512 20.28769493103027 C 20.04994583129883 21.19112586975098 20.04994583129883 22.76553916931152 20.15032768249512 23.66897201538086 Z" fill="#a0522d" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_uat9w =
    '<svg viewBox="274.0 716.8 28.0 28.0" ><path transform="translate(273.42, 716.27)" d="M 28.59882354736328 14.55415153503418 C 28.61312294006348 22.27770614624023 22.31439018249512 28.59333992004395 14.59083652496338 28.59876823425293 C 11.2550220489502 28.60114097595215 8.190923690795898 27.43831253051758 5.783022880554199 25.49493217468262 C 5.156896591186523 24.98960113525391 5.11009407043457 24.05123138427734 5.679073333740234 23.48225212097168 L 6.315938949584961 22.84538459777832 C 6.802560806274414 22.35876274108887 7.579439163208008 22.30551719665527 8.118572235107422 22.73324012756348 C 9.892602920532227 24.1409912109375 12.13771438598633 24.98123359680176 14.58066082000732 24.98123359680176 C 20.32952117919922 24.98123359680176 24.98123359680176 20.32861709594727 24.98123359680176 14.58066082000732 C 24.98123359680176 8.831802368164062 20.32861709594727 4.180089950561523 14.58066082000732 4.180089950561523 C 11.821457862854 4.180089950561523 9.315427780151367 5.252309799194336 7.454687118530273 7.002488136291504 L 10.32354831695557 9.871350288391113 C 10.89331912994385 10.44112014770508 10.48978805541992 11.41526985168457 9.684082984924316 11.41526985168457 L 1.466897487640381 11.41526985168457 C 0.9673874974250793 11.41526985168457 0.5625 11.0103816986084 0.5625 10.51087188720703 L 0.5625 2.293686389923096 C 0.5625 1.48798131942749 1.536649227142334 1.084450483322144 2.106419563293457 1.654164433479309 L 4.897163391113281 4.44490909576416 C 7.413819313049316 2.039833307266235 10.82469844818115 0.5625 14.58066082000732 0.5625 C 22.3138256072998 0.5625 28.58452033996582 6.824322700500488 28.59882354736328 14.55415153503418 Z M 18.37280082702637 19.00740432739258 L 18.92804336547852 18.29349708557129 C 19.38804244995117 17.70207786560059 19.281494140625 16.84973907470703 18.6900749206543 16.38979530334473 L 16.38945770263672 14.6003885269165 L 16.38945770263672 8.70207691192627 C 16.38945770263672 7.952840805053711 15.78209590911865 7.345480918884277 15.03285980224609 7.345480918884277 L 14.12846183776855 7.345480918884277 C 13.379225730896 7.345480918884277 12.77186584472656 7.952840805053711 12.77186584472656 8.70207691192627 L 12.77186584472656 16.36972808837891 L 16.46910095214844 19.2453727722168 C 17.06052017211914 19.7053165435791 17.91280174255371 19.59882354736328 18.372802734375 19.00740432739258 Z" fill="#a0522d" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_kzt9m =
    '<svg viewBox="350.0 719.7 35.0 22.3" ><path transform="translate(348.5, 712.21)" d="M 25.36363410949707 17.04545402526855 C 28.00454330444336 17.04545402526855 30.12045288085938 14.91363525390625 30.12045288085938 12.27272701263428 C 30.12045288085938 9.631818771362305 28.00454330444336 7.499999523162842 25.36363410949707 7.499999523162842 C 22.72272491455078 7.499999523162842 20.59090614318848 9.631818771362305 20.59090614318848 12.27272701263428 C 20.59090614318848 14.91363525390625 22.72272491455078 17.04545402526855 25.36363410949707 17.04545402526855 Z M 12.63636302947998 17.04545402526855 C 15.27727127075195 17.04545402526855 17.39318084716797 14.91363525390625 17.39318084716797 12.27272701263428 C 17.39318084716797 9.631818771362305 15.27727127075195 7.499999523162842 12.63636302947998 7.499999523162842 C 9.995454788208008 7.499999523162842 7.863636016845703 9.631818771362305 7.863636016845703 12.27272701263428 C 7.863636016845703 14.91363525390625 9.995454788208008 17.04545402526855 12.63636302947998 17.04545402526855 Z M 12.63636302947998 20.22727012634277 C 8.929545402526855 20.22727012634277 1.49999988079071 22.0886344909668 1.49999988079071 25.79545211791992 L 1.49999988079071 29.77272605895996 L 23.77272605895996 29.77272605895996 L 23.77272605895996 25.79545211791992 C 23.77272605895996 22.08863639831543 16.34317970275879 20.22727012634277 12.63636302947998 20.22727012634277 Z M 25.36363410949707 20.22727012634277 C 24.90227127075195 20.22727012634277 24.37726974487305 20.25909042358398 23.8204517364502 20.30681800842285 C 25.66590690612793 21.64318084716797 26.95454216003418 23.44090843200684 26.95454216003418 25.79545211791992 L 26.95454216003418 29.77272605895996 L 36.5 29.77272605895996 L 36.5 25.79545211791992 C 36.5 22.08863639831543 29.0704517364502 20.22727012634277 25.36363410949707 20.22727012634277 Z" fill="#a0522d" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_a3julx =
    '<svg viewBox="29.0 716.5 28.7 28.7" ><path transform="translate(26.0, 713.51)" d="M 21.6403694152832 10.88630962371826 L 21.6403694152832 3 L 13.03712177276611 3 L 13.03712177276611 10.88630962371826 L 17.3387451171875 15.18793296813965 L 21.6403694152832 10.88630962371826 Z M 10.88630962371826 13.03712177276611 L 3 13.03712177276611 L 3 21.6403694152832 L 10.88630962371826 21.6403694152832 L 15.18793296813965 17.3387451171875 L 10.88630962371826 13.03712177276611 Z M 13.03712177276611 23.79118156433105 L 13.03712177276611 31.677490234375 L 21.6403694152832 31.677490234375 L 21.6403694152832 23.79118156433105 L 17.3387451171875 19.48955726623535 L 13.03712177276611 23.79118156433105 Z M 23.79118156433105 13.03712177276611 L 19.48955726623535 17.3387451171875 L 23.79118156433105 21.6403694152832 L 31.677490234375 21.6403694152832 L 31.677490234375 13.03712177276611 L 23.79118156433105 13.03712177276611 Z" fill="#a0522d" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
