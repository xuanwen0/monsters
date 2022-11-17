// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:math';
import 'dart:developer' as dv;

import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monsters_front_end/main.dart';
import 'package:monsters_front_end/model/annoyanceModel.dart';
import 'package:monsters_front_end/pages/monsters_information.dart';
import 'package:monsters_front_end/pages/diaryChat.dart';
import 'package:monsters_front_end/pages/history.dart';
import 'package:monsters_front_end/pages/home.dart';
import 'package:monsters_front_end/pages/interaction.dart';
import 'package:monsters_front_end/pages/manual.dart';
import 'package:monsters_front_end/pages/style.dart';
import 'package:monsters_front_end/repository/annoyanceRepo.dart';
import 'package:monsters_front_end/state/drawer.dart';

import 'annoyanceChat.dart';

class Social extends StatefulWidget {
  const Social({Key? key}) : super(key: key);

  @override
  _SocialState createState() => _SocialState();
}

class _SocialState extends State<Social> with SingleTickerProviderStateMixin {
  //新增的浮出按鈕動畫用
  late AnimationController animationController;
  late Animation degOneTranslationAnimation, degTwoTranslationAnimation;
  late Animation rotationAnimation;
  final _messageController = TextEditingController();
  StateSetter? animationState;
  var Comments = [
    "老師知道我不會，所以根本不會叫我 ( ´•̥̥̥ω•̥̥̥` )",
    "沒事啦你很棒的",
    "NO is NO, it's ok",
    "大家好友善",
    "...",
  ];
  var userNames = [
    "Chun",
    "Wen",
    "Jun",
    "Sean",
    "Lin",
  ];
  var times = ["11/13", "11/14", "11/15", "11/15", "11/16"];
  List<String> messages = [];

  //異步處理
  late Future _future;
  //控制標籤
  int selectionTab_type = 1;

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  void dispose() {
    animationController.dispose();
    _messageController.dispose();
    super.dispose();
  }

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

    _future = getSocialMapByAccount();
    super.initState();
  }

  Future<Map> getSocialMapByAccount() async {
    Map socialResult = {};
    List temp = [
      'Lin',
      'Lin',
      'Sean',
      'Wen',
      'Chun',
      'Jun',
    ];
    final AnnoyanceRepository annoyanceRepository = AnnoyanceRepository();

    Future<Data> annoyances = annoyanceRepository
        .searchAnnoyanceByAccount(user_Account)
        .then((value) => Data.fromJson(value!));
    await annoyances.then((value) async {
      if (value != null) {
        socialResult = {};
        await socialResult.putIfAbsent(
          "itemCounter",
          () => value.data.length,
        );
        for (int index = 0; index < min(value.data.length, 20); index++) {
          socialResult.putIfAbsent(
            "result $index",
            () => {
              'id': value.data.elementAt(index).id,
              // 'name': value.data.elementAt(index).account,
              'name': temp[index % 5],
              'content': value.data.elementAt(index).content,
              'time': value.data.elementAt(index).time,
              'monsterId': value.data.elementAt(index).monsterId,
            },
          );
        }
      }
    });

    return socialResult;
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKEy = GlobalKey<ScaffoldState>();
    return Scaffold(
        backgroundColor: const Color(0xfffffed4),
        key: _scaffoldKEy,
        endDrawer: GetDrawer(context),
        body: Stack(
          children: <Widget>[
            //抽屜
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                iconSize: 60.0,
                icon: const Icon(Icons.menu_rounded),
                color: const Color(0xffffbb00),
                padding: const EdgeInsets.fromLTRB(0, 10, 10, 5),
                onPressed: () => _scaffoldKEy.currentState?.openEndDrawer(),
              ),
            ),
            //整體布局
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //標題
                Expanded(flex: 10, child: mainAppBarTitleContainer("社群")),
                //標籤
                Expanded(
                    flex: 5,
                    child: Center(
                        child: Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Wrap(
                        spacing: 20,
                        children: [
                          //全部標籤
                          InkWell(
                              child: Container(
                                width: 60,
                                decoration: BoxDecoration(
                                  color: selectionTab_type == 1
                                      ? const Color(0xffa0522d)
                                      : const Color(0xffffed97),
                                  borderRadius: const BorderRadius.all(
                                      Radius.elliptical(9999.0, 9999.0)),
                                ),
                                child: Text(
                                  '全部',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Segoe UI',
                                      fontSize: 20,
                                      color: selectionTab_type == 1 //點按後更新文字顏色
                                          ? const Color(0xffffffff)
                                          : const Color(0xffa0522d)),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  selectionTab_type = 1;
                                });
                              }),
                          //煩惱標籤
                          InkWell(
                              child: Container(
                                width: 60,
                                decoration: BoxDecoration(
                                  color: selectionTab_type == 2
                                      ? const Color(0xffa0522d)
                                      : const Color(0xffffed97),
                                  borderRadius: const BorderRadius.all(
                                      Radius.elliptical(100.0, 100.0)),
                                ),
                                child: Text(
                                  '煩惱',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Segoe UI',
                                      fontSize: 20,
                                      color: selectionTab_type == 2 //點按後更新文字顏色
                                          ? const Color(0xffffffff)
                                          : const Color(0xffa0522d)),
                                ),
                              ),
                              onTap: () {
                                selectionTab_type = 2;
                                setState(() {});
                              }),
                          //日記標籤
                          InkWell(
                              child: Container(
                                width: 60,
                                decoration: BoxDecoration(
                                  color: selectionTab_type == 3
                                      ? const Color(0xffa0522d)
                                      : const Color(0xffffed97),
                                  borderRadius: const BorderRadius.all(
                                      Radius.elliptical(100.0, 100.0)),
                                ),
                                child: Text(
                                  '日記',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Segoe UI',
                                      fontSize: 20,
                                      color: selectionTab_type == 3 //點按後更新文字顏色
                                          ? const Color(0xffffffff)
                                          : const Color(0xffa0522d)),
                                ),
                              ),
                              onTap: () {
                                selectionTab_type = 3;
                                setState(() {});
                              }),
                          //怪獸標籤
                          InkWell(
                              child: Container(
                                width: 60,
                                decoration: BoxDecoration(
                                  color: selectionTab_type == 4
                                      ? const Color(0xffa0522d)
                                      : const Color(0xffffed97),
                                  borderRadius: const BorderRadius.all(
                                      Radius.elliptical(100.0, 100.0)),
                                ),
                                child: Text(
                                  '我的',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Segoe UI',
                                      fontSize: 20,
                                      color: selectionTab_type == 4 //點按後更新文字顏色
                                          ? const Color(0xffffffff)
                                          : const Color(0xffa0522d)),
                                ),
                              ),
                              onTap: () {
                                selectionTab_type = 4;
                                setState(() {});
                              }),
                        ],
                      ),
                    ))),
                //社群主體
                Expanded(
                  flex: 75,
                  child: FutureBuilder<dynamic>(
                    future: _future,
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.data == null) {
                        return Center(
                            child: Text(
                          "Loading...",
                          style: TextStyle(fontSize: 30),
                        ));
                      }
                      return GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 0,
                            crossAxisSpacing: 0),
                        children: List.generate(
                            snapshot.data["itemCounter"],
                            (index) => Container(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    width: 200.0,
                                    height: 200.0,
                                    child: Stack(
                                      children: <Widget>[
                                        Stack(children: <Widget>[
                                          //底部顏色
                                          Container(
                                            width: 200.0,
                                            height: 200.0,
                                            decoration: BoxDecoration(
                                                color: const Color(0xffffffff),
                                                border: Border.all(
                                                    width: 1.0,
                                                    color: const Color(
                                                        0xffa0522d))),
                                          ),
                                          //頭貼框
                                          Pinned.fromPins(
                                            Pin(size: 53.0, start: 9.0),
                                            Pin(size: 53.0, start: 9.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: const Color(0xffffffff),
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  width: 1,
                                                  color:
                                                      const Color(0xffa0522d),
                                                ),
                                              ),
                                              child: CircleAvatar(
                                                minRadius: 40,
                                                backgroundImage: AssetImage(
                                                    getMonsterAvatarPath(
                                                        monsterNamesList[snapshot
                                                                    .data[
                                                                "result $index"]
                                                            ["monsterId"]])),
                                              ),
                                            ),
                                          ),
                                          //社群內容 點擊觸發留言功能
                                          GestureDetector(
                                            onTap: () => showComment(
                                              snapshot.data["result $index"]
                                                  ["id"],
                                              snapshot.data["result $index"]
                                                  ["name"],
                                              snapshot.data["result $index"]
                                                  ["content"],
                                              snapshot.data["result $index"]
                                                  ["time"],
                                              monsterNamesList[
                                                  snapshot.data["result $index"]
                                                      ["monsterId"]],
                                            ),
                                            child: Stack(
                                              children: [
                                                //暱稱
                                                Pinned.fromPins(
                                                  Pin(size: 110.0, start: 110),
                                                  Pin(size: 27.0, start: 21.0),
                                                  child: SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Text(
                                                      snapshot.data[
                                                              "result $index"]
                                                          ["name"],
                                                      style: TextStyle(
                                                        fontFamily: 'Segoe UI',
                                                        fontSize: 20,
                                                        color: const Color(
                                                            0xffa0522d),
                                                      ),
                                                      softWrap: false,
                                                    ),
                                                  ),
                                                ),
                                                //content
                                                Pinned.fromPins(
                                                    Pin(start: 0.0, end: 0.0),
                                                    Pin(
                                                        size: 80.0,
                                                        middle: 0.65),
                                                    child: Stack(
                                                      children: <Widget>[
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: const Color(
                                                                0xffffffff),
                                                            border: Border(
                                                                bottom: BorderSide(
                                                                    width: 1.0,
                                                                    color: const Color(
                                                                        0xffa0522d)),
                                                                left: BorderSide(
                                                                    width: 1.0,
                                                                    color: const Color(
                                                                        0xffa0522d)),
                                                                right: BorderSide(
                                                                    width: 1.0,
                                                                    color: const Color(
                                                                        0xffa0522d))),
                                                          ),
                                                        ),
                                                        Pinned.fromPins(
                                                          Pin(
                                                              start: 10.0,
                                                              end: 1.0),
                                                          Pin(
                                                              size: 70.0,
                                                              start: 0.0),
                                                          child:
                                                              SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            child: Text(
                                                              snapshot.data[
                                                                      "result $index"]
                                                                  ["content"],
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Segoe UI',
                                                                fontSize: 16,
                                                                color: const Color(
                                                                    0xff707070),
                                                              ),
                                                              softWrap: true,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )),
                                                //時間
                                                Pinned.fromPins(
                                                  Pin(size: 40.0, start: 17.0),
                                                  Pin(size: 20.0, end: 7.0),
                                                  child: Text(
                                                    snapshot.data[
                                                            "result $index"]
                                                        ["time"],
                                                    style: TextStyle(
                                                      fontFamily: 'Segoe UI',
                                                      fontSize: 15,
                                                      color: const Color(
                                                          0xffa0522d),
                                                    ),
                                                    softWrap: false,
                                                  ),
                                                ),
                                                //留言icon堆疊圖層
                                                Pinned.fromPins(
                                                  Pin(size: 26.0, middle: 0.72),
                                                  Pin(size: 21.8, end: 10.4),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffdcdcdc),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.elliptical(
                                                                  9999.0,
                                                                  9999.0)),
                                                    ),
                                                  ),
                                                ),
                                                //留言icon堆疊圖層
                                                Pinned.fromPins(
                                                  Pin(size: 16.3, middle: 0.71),
                                                  Pin(size: 16.4, end: 2.2),
                                                  child: SvgPicture.string(
                                                    _svg_urb4yp,
                                                    allowDrawingOutsideViewBox:
                                                        true,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          //愛心 點擊觸發按愛心功能
                                          Pinned.fromPins(
                                              Pin(size: 26.2, end: 7.0),
                                              Pin(size: 23.8, end: 7),
                                              child: HeartWidget()),
                                        ]),
                                      ],
                                    ),
                                  ),
                                )),
                      );
                    },
                  ),
                ),
                //底部背景顏色
                Expanded(
                  flex: 10,
                  child: Container(
                    color: BackgroundColorSoft,
                  ),
                )
              ],
            ),
            //底部
            Pinned.fromPins(
              Pin(start: 0.0, end: 0.0),
              Pin(size: 78.0, end: 0.0),
              child: Container(
                color: const Color(0xffffed97),
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
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.015, -0.398),
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
                      child: Text(
                        '圖鑑',
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 12,
                          color: const Color(0xffa0522d),
                        ),
                        softWrap: false,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //歷史記錄
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
                    pageBuilder: () => History(),
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
                      child: Text(
                        '歷史記錄',
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 12,
                          color: const Color(0xffa0522d),
                        ),
                        softWrap: false,
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.073, -0.408),
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
                    pageBuilder: () => MainPage(),
                  ),
                ],
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: const BoxDecoration(
                        color: BackgroundColorWarm,
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 24.0, middle: 0.5111),
                      Pin(size: 16.0, end: 9.0),
                      child: Text(
                        '社群',
                        style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 12,
                            color: Colors.white),
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
                        color: Colors.white,
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
                      child: Text(
                        '互動',
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 12,
                          color: const Color(0xffa0522d),
                        ),
                        softWrap: false,
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.008, -0.415),
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
              Pin(size: 200.0, middle: 0.5),
              Pin(size: 200.0, end: 5.0),
              child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                animationState = setState;
                return Stack(
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
                            color: Color.fromRGBO(255, 255, 255, 1),
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
                                animationController.addListener(() {
                                  animationState!(() {});
                                });
                              }
                            },
                          ),
                        ),
                        Transform.translate(
                          offset: Offset.fromDirection(
                              getRadiansFromDegree(235),
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
                          offset: Offset.fromDirection(
                              getRadiansFromDegree(305),
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
                                animationController.reverse();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => diaryChat()));
                              },
                            ),
                          ),
                        ),
                      ],
                    ))
                  ],
                );
              }),
            ),
          ],
        ));
  }

  Future<dynamic> showComment(
      int id, String name, String content, String time, String monsterId) {
    print(id);
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          var _like;
          return Material(
              type: MaterialType.transparency,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //分享者資料
                  Container(
                    color: BackgroundColorLight,
                    height: 70,
                    child: Row(
                      children: [
                        //頭貼
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: const EdgeInsets.only(
                                left: 30, right: 30, top: 10),
                            decoration: BoxDecoration(
                              color: BackgroundColorLight,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 1, color: const Color(0xffa0522d)),
                            ),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage(getMonsterAvatarPath(monsterId)),
                            ),
                          ),
                        ),
                        //姓名
                        Expanded(
                          flex: 4,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Segoe UI',
                                  fontSize: 28,
                                  color: const Color(0xffa0522d),
                                ),
                                softWrap: false,
                              ),
                            ),
                          ),
                        ),
                        //時間及愛心
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                time,
                                style: TextStyle(
                                  fontFamily: 'Segoe UI',
                                  fontSize: 16,
                                  color: const Color(0xffa0522d),
                                ),
                                softWrap: false,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                child: HeartWidget(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  //分享內容
                  Container(
                    alignment: Alignment.topLeft,
                    color: BackgroundColorLight,
                    height: 130,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(
                          content,
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 22,
                            color: const Color(0xff707070),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //貼文的相關留言
                  Container(
                      alignment: Alignment.center,
                      height: 300,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border.symmetric(
                            horizontal: BorderSide(
                                width: 1, color: BackgroundColorWarm),
                          )),
                      child: ListView.builder(
                          itemCount: Comments.length,
                          itemBuilder: (context, int index) {
                            return Card(
                              child: ListTile(
                                leading: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1,
                                        color: const Color(0xffa0522d)),
                                  ),
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage(
                                        getMonsterAvatarPath(
                                            getRandomMonsterName())),
                                  ),
                                ),
                                title: Text(
                                  userNames[index],
                                  style: TextStyle(fontSize: 20),
                                ),
                                subtitle: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Text(
                                    Comments[index],
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                trailing: Text(
                                  times[index],
                                  style: TextStyle(color: BackgroundColorWarm),
                                ),
                              ),
                            );
                          })),
                  //使用者輸入留言區
                  Container(
                      alignment: Alignment.centerLeft,
                      color: BackgroundColorSoft,
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Expanded(
                          //   flex: 2,
                          //   child: Container(
                          //     decoration: BoxDecoration(
                          //       color: BackgroundColorLight,
                          //       borderRadius: BorderRadius.all(
                          //           Radius.elliptical(9999.0, 9999.0)),
                          //       border: Border.all(
                          //           width: 1, color: const Color(0xffa0522d)),
                          //     ),
                          //     margin: EdgeInsets.only(left: 15.0),
                          //     child: CircleAvatar(
                          //       radius: 30,
                          //       backgroundImage: AssetImage(
                          //           getMonsterAvatarPath(
                          //               getRandomMonsterName())),
                          //     ),
                          //   ),
                          // ),
                          Expanded(
                            flex: 8,
                            child: Container(
                              width: 70,
                              margin: EdgeInsets.only(
                                  left: 15.0, top: 10, bottom: 10),
                              alignment: Alignment.bottomLeft,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(13)),
                                color: Colors.white,
                                border: Border.all(
                                    width: 1, color: BackgroundColorWarm),
                              ),
                              padding: const EdgeInsets.only(left: 10),
                              child: Center(
                                child: TextFormField(
                                  textAlign: TextAlign.left,
                                  controller: _messageController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter a message...",
                                    hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                  onChanged: (value) {},
                                ),
                              ),
                            ),
                          ),
                          //傳送
                          Expanded(
                            flex: 2,
                            child: IconButton(
                                icon: Icon(
                                  Icons.send,
                                  size: 30.0,
                                  color: Color.fromARGB(255, 164, 78, 38),
                                ),
                                onPressed: () {
                                  //TODO:新增一筆留言 接API
                                  _messageController.clear();
                                  FocusScopeNode currentFocus =
                                      FocusScope.of(context);
                                  if (!currentFocus.hasPrimaryFocus) {
                                    currentFocus.unfocus();
                                  }
                                  setState(() {});
                                }),
                          ),
                        ],
                      )),
                ],
              ));
        });
  }
}

class HeartWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HeartWidgetState();
  }
}

class _HeartWidgetState extends State<HeartWidget> {
  bool _like = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        _like = !_like;
      }),
      child: Center(
        child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: (_like == false)
                  ? AssetImage('assets/image/heart_1.png')
                  : AssetImage('assets/image/heart_2.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
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

const String _svg_fb6j2b =
    '<svg viewBox="159.8 401.1 26.2 23.8" ><path transform="translate(159.78, 401.1)" d="M 13.10869121551514 23.79538345336914 C 6.060231685638428 19.04422950744629 2.363595008850098 14.72194957733154 0.8475516438484192 11.1044750213623 C -3.213847398757935 1.410091519355774 8.38672924041748 -3.226056814193726 13.10869121551514 2.496750593185425 C 17.83065032958984 -3.226056814193726 29.43123054504395 1.410091519355774 25.36982727050781 11.1044750213623 C 23.85378646850586 14.72194957733154 20.15715026855469 19.04422950744629 13.10869121551514 23.79538345336914 Z" fill="#ffc0cb" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_z7peet =
    '<svg viewBox="113.8 398.8 26.0 28.4" ><path transform="translate(113.78, 398.78)" d="M 8.436654090881348 21.1204833984375 C 3.507959842681885 19.57046318054199 0 15.58220958709717 0 10.90604400634766 C 0 4.882907390594482 5.820547580718994 0 12.99980068206787 0 C 20.1798095703125 0 25.99960136413574 4.882907390594482 25.99960136413574 10.90604400634766 C 25.99960136413574 16.09835243225098 21.67505264282227 20.44256973266602 15.88209342956543 21.54228782653809 L 10.10198211669922 28.43585205078125 L 8.436654090881348 21.1204833984375 Z" fill="#dcdcdc" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_x71sl4 =
    '<svg viewBox="182.0 714.0 48.0 50.0" ><path transform="translate(182.0, 713.88)" d="M 24.01588439941406 50.12420654296875 C 20.5798225402832 50.12170791625977 17.79176139831543 46.9383430480957 17.78926658630371 43.01330184936523 C 17.7884349822998 42.37663269042969 17.86154365539551 41.75912857055664 17.99945449829102 41.1716194152832 L 17.78760528564453 41.1716194152832 L 17.78151702880859 31.60402870178223 L 6.82144832611084 31.60402870178223 L 6.568063735961914 31.60402870178223 L 6.568063735961914 31.59902572631836 C 2.918493270874023 31.47319602966309 0 28.62066650390625 0 25.1214656829834 C 0 21.62143516540527 2.918493270874023 18.76974105834961 6.568063735961914 18.64307403564453 L 6.568063735961914 18.63890647888184 L 17.77327346801758 18.63890647888184 L 17.76600456237793 7.219633102416992 L 17.76600456237793 6.956297397613525 L 17.77016067504883 6.956297397613525 C 17.88895797729492 3.153761625289917 20.62468528747559 0.1153999269008636 23.98431587219238 0.1178999468684196 C 27.34311676025391 0.1203999668359756 30.0829963684082 3.162095069885254 30.20677947998047 6.964630603790283 L 30.21093368530273 6.964630603790283 L 30.21830368041992 18.63890647888184 L 39.4108772277832 18.63890647888184 L 39.4108772277832 18.85890769958496 C 39.97497177124023 18.71557426452637 40.56731033325195 18.63890647888184 41.17958450317383 18.63890647888184 C 44.94629669189453 18.63890647888184 48.00020217895508 21.54143333435059 48.00020217895508 25.1214656829834 C 48.00020217895508 28.70150184631348 44.94629669189453 31.60402870178223 41.17958450317383 31.60402870178223 C 40.56731033325195 31.60402870178223 39.97497177124023 31.52736473083496 39.4108772277832 31.38403129577637 L 39.4108772277832 31.60402870178223 L 30.22648620605469 31.60402870178223 L 30.2325325012207 41.17995452880859 L 30.02151870727539 41.17995452880859 C 30.16025543212891 41.76745986938477 30.23336410522461 42.38496398925781 30.23419570922852 43.0224723815918 C 30.23668670654297 46.94499969482422 27.45480537414551 50.12398910522461 24.01993942260742 50.12420654296875 C 24.01847076416016 50.12420654296875 24.01735305786133 50.12420654296875 24.01588439941406 50.12420654296875 Z" fill="#ffbb00" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_i02mi2 =
    '<svg viewBox="112.3 717.3 23.7 27.1" ><path transform="translate(112.33, 717.32)" d="M 23.66897201538086 19.01971054077148 L 23.66897201538086 1.267980933189392 C 23.66897201538086 0.5653080940246582 23.10366439819336 0 22.40099143981934 0 L 5.071923732757568 0 C 2.271798849105835 0 0 2.271798849105835 0 5.071923732757568 L 0 21.97833633422852 C 0 24.7784595489502 2.271798849105835 27.05025482177734 5.071923732757568 27.05025482177734 L 22.40099143981934 27.05025482177734 C 23.10366439819336 27.05025482177734 23.66897201538086 26.48495101928711 23.66897201538086 25.78227424621582 L 23.66897201538086 24.93695259094238 C 23.66897201538086 24.54071044921875 23.48405838012695 24.18144989013672 23.19876289367676 23.94898414611816 C 22.97686576843262 23.13536262512207 22.97686576843262 20.81601715087891 23.19876289367676 20.00239562988281 C 23.48405838012695 19.77521514892578 23.66897201538086 19.41595458984375 23.66897201538086 19.01971054077148 Z M 6.762563705444336 7.079558849334717 C 6.762563705444336 6.905211925506592 6.905211925506592 6.762563705444336 7.079558849334717 6.762563705444336 L 18.28005599975586 6.762563705444336 C 18.45440292358398 6.762563705444336 18.59705352783203 6.905211925506592 18.59705352783203 7.079558849334717 L 18.59705352783203 8.136210441589355 C 18.59705352783203 8.310558319091797 18.45440292358398 8.453206062316895 18.28005599975586 8.453206062316895 L 7.079558849334717 8.453206062316895 C 6.905211925506592 8.453206062316895 6.762563705444336 8.310558319091797 6.762563705444336 8.136210441589355 L 6.762563705444336 7.079558849334717 Z M 6.762563705444336 10.46084022521973 C 6.762563705444336 10.28649425506592 6.905211925506592 10.14384746551514 7.079558849334717 10.14384746551514 L 18.28005599975586 10.14384746551514 C 18.45440292358398 10.14384746551514 18.59705352783203 10.28649425506592 18.59705352783203 10.46084022521973 L 18.59705352783203 11.51749134063721 C 18.59705352783203 11.69183731079102 18.45440292358398 11.83448600769043 18.28005599975586 11.83448600769043 L 7.079558849334717 11.83448600769043 C 6.905211925506592 11.83448600769043 6.762563705444336 11.69183731079102 6.762563705444336 11.51749134063721 L 6.762563705444336 10.46084022521973 Z M 20.15032768249512 23.66897201538086 L 5.071923732757568 23.66897201538086 C 4.136787414550781 23.66897201538086 3.381281852722168 22.9134693145752 3.381281852722168 21.97833633422852 C 3.381281852722168 21.04848289489746 4.142070293426514 20.28769493103027 5.071923732757568 20.28769493103027 L 20.15032768249512 20.28769493103027 C 20.04994583129883 21.19112586975098 20.04994583129883 22.76553916931152 20.15032768249512 23.66897201538086 Z" fill="#a0522d" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_uat9w =
    '<svg viewBox="274.0 716.8 28.0 28.0" ><path transform="translate(273.42, 716.27)" d="M 28.59882354736328 14.55415153503418 C 28.61312294006348 22.27770614624023 22.31439018249512 28.59333992004395 14.59083652496338 28.59876823425293 C 11.2550220489502 28.60114097595215 8.190923690795898 27.43831253051758 5.783022880554199 25.49493217468262 C 5.156896591186523 24.98960113525391 5.11009407043457 24.05123138427734 5.679073333740234 23.48225212097168 L 6.315938949584961 22.84538459777832 C 6.802560806274414 22.35876274108887 7.579439163208008 22.30551719665527 8.118572235107422 22.73324012756348 C 9.892602920532227 24.1409912109375 12.13771438598633 24.98123359680176 14.58066082000732 24.98123359680176 C 20.32952117919922 24.98123359680176 24.98123359680176 20.32861709594727 24.98123359680176 14.58066082000732 C 24.98123359680176 8.831802368164062 20.32861709594727 4.180089950561523 14.58066082000732 4.180089950561523 C 11.821457862854 4.180089950561523 9.315427780151367 5.252309799194336 7.454687118530273 7.002488136291504 L 10.32354831695557 9.871350288391113 C 10.89331912994385 10.44112014770508 10.48978805541992 11.41526985168457 9.684082984924316 11.41526985168457 L 1.466897487640381 11.41526985168457 C 0.9673874974250793 11.41526985168457 0.5625 11.0103816986084 0.5625 10.51087188720703 L 0.5625 2.293686389923096 C 0.5625 1.48798131942749 1.536649227142334 1.084450483322144 2.106419563293457 1.654164433479309 L 4.897163391113281 4.44490909576416 C 7.413819313049316 2.039833307266235 10.82469844818115 0.5625 14.58066082000732 0.5625 C 22.3138256072998 0.5625 28.58452033996582 6.824322700500488 28.59882354736328 14.55415153503418 Z M 18.37280082702637 19.00740432739258 L 18.92804336547852 18.29349708557129 C 19.38804244995117 17.70207786560059 19.281494140625 16.84973907470703 18.6900749206543 16.38979530334473 L 16.38945770263672 14.6003885269165 L 16.38945770263672 8.70207691192627 C 16.38945770263672 7.952840805053711 15.78209590911865 7.345480918884277 15.03285980224609 7.345480918884277 L 14.12846183776855 7.345480918884277 C 13.379225730896 7.345480918884277 12.77186584472656 7.952840805053711 12.77186584472656 8.70207691192627 L 12.77186584472656 16.36972808837891 L 16.46910095214844 19.2453727722168 C 17.06052017211914 19.7053165435791 17.91280174255371 19.59882354736328 18.372802734375 19.00740432739258 Z" fill="#a0522d" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_kzt9m =
    '<svg viewBox="350.0 719.7 35.0 22.3" ><path transform="translate(348.5, 712.21)" d="M 25.36363410949707 17.04545402526855 C 28.00454330444336 17.04545402526855 30.12045288085938 14.91363525390625 30.12045288085938 12.27272701263428 C 30.12045288085938 9.631818771362305 28.00454330444336 7.499999523162842 25.36363410949707 7.499999523162842 C 22.72272491455078 7.499999523162842 20.59090614318848 9.631818771362305 20.59090614318848 12.27272701263428 C 20.59090614318848 14.91363525390625 22.72272491455078 17.04545402526855 25.36363410949707 17.04545402526855 Z M 12.63636302947998 17.04545402526855 C 15.27727127075195 17.04545402526855 17.39318084716797 14.91363525390625 17.39318084716797 12.27272701263428 C 17.39318084716797 9.631818771362305 15.27727127075195 7.499999523162842 12.63636302947998 7.499999523162842 C 9.995454788208008 7.499999523162842 7.863636016845703 9.631818771362305 7.863636016845703 12.27272701263428 C 7.863636016845703 14.91363525390625 9.995454788208008 17.04545402526855 12.63636302947998 17.04545402526855 Z M 12.63636302947998 20.22727012634277 C 8.929545402526855 20.22727012634277 1.49999988079071 22.0886344909668 1.49999988079071 25.79545211791992 L 1.49999988079071 29.77272605895996 L 23.77272605895996 29.77272605895996 L 23.77272605895996 25.79545211791992 C 23.77272605895996 22.08863639831543 16.34317970275879 20.22727012634277 12.63636302947998 20.22727012634277 Z M 25.36363410949707 20.22727012634277 C 24.90227127075195 20.22727012634277 24.37726974487305 20.25909042358398 23.8204517364502 20.30681800842285 C 25.66590690612793 21.64318084716797 26.95454216003418 23.44090843200684 26.95454216003418 25.79545211791992 L 26.95454216003418 29.77272605895996 L 36.5 29.77272605895996 L 36.5 25.79545211791992 C 36.5 22.08863639831543 29.0704517364502 20.22727012634277 25.36363410949707 20.22727012634277 Z" fill="#a0522d" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_a3julx =
    '<svg viewBox="29.0 716.5 28.7 28.7" ><path transform="translate(26.0, 713.51)" d="M 21.6403694152832 10.88630962371826 L 21.6403694152832 3 L 13.03712177276611 3 L 13.03712177276611 10.88630962371826 L 17.3387451171875 15.18793296813965 L 21.6403694152832 10.88630962371826 Z M 10.88630962371826 13.03712177276611 L 3 13.03712177276611 L 3 21.6403694152832 L 10.88630962371826 21.6403694152832 L 15.18793296813965 17.3387451171875 L 10.88630962371826 13.03712177276611 Z M 13.03712177276611 23.79118156433105 L 13.03712177276611 31.677490234375 L 21.6403694152832 31.677490234375 L 21.6403694152832 23.79118156433105 L 17.3387451171875 19.48955726623535 L 13.03712177276611 23.79118156433105 Z M 23.79118156433105 13.03712177276611 L 19.48955726623535 17.3387451171875 L 23.79118156433105 21.6403694152832 L 31.677490234375 21.6403694152832 L 31.677490234375 13.03712177276611 L 23.79118156433105 13.03712177276611 Z" fill="#a0522d" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_urb4yp =
    '<svg viewBox="117.2 412.4 16.3 16.4" ><path transform="matrix(-0.970296, -0.241922, 0.241922, -0.970296, 130.55, 429.12)" d="M 6.925271987915039 0.231014758348465 L 13.78001022338867 13.7873706817627 L 0.4035075902938843 13.61397266387939 L 6.925271987915039 0.231014758348465 Z" fill="#dcdcdc" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
