// ignore_for_file: constant_identifier_names
import 'package:adobe_xd/adobe_xd.dart';
import 'package:flutter/material.dart';

//colors settings
const BackgroundColorLight = Color(0xfffffed4);
const BackgroundColorSoft = Color(0xffffed97);
const BackgroundColorWarm = Color(0xffa0522d);

//AppBar settings

//取得title名稱並回傳mainAppBarTitle格式
Container mainAppBarTitleContainer(String name) {
  return Container(
    padding: EdgeInsets.only(top: 5, bottom: 10),
    child: Center(
      child: Text(
        name,
        style: WidgeTitleTextStyle,
      ),
    ),
  );
}

//第二種AppBar的格式 如紓壓方法內
AppBar secondAppBar(String name) {
  return AppBar(centerTitle: true, toolbarHeight: 70, title: Text(name));
}

//回傳抽屜按鈕
Align drawerButton() {
  GlobalKey<ScaffoldState> _scaffoldKEy = GlobalKey<ScaffoldState>();
  return Align(
    alignment: Alignment.topRight,
    child: IconButton(
      iconSize: 60.0,
      icon: const Icon(Icons.menu_rounded),
      color: const Color(0xffffbb00),
      padding: const EdgeInsets.fromLTRB(0, 10, 10, 5),
      onPressed: () => _scaffoldKEy.currentState?.openEndDrawer(),
    ),
  );
}

//font size settings
const MaxTextSize = 40.0;
const LargeTextSize = 36.0;
const mediumTextSize = 32.0;
const BodyTextSize = 24.0;
const contentTextSize = 16.0;
const String FontNameDefault = "Segoe UI";

//font design
const WidgeTitleTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w300,
  fontSize: MaxTextSize,
  color: BackgroundColorWarm,
);
const AppBarTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w300,
  fontSize: LargeTextSize,
  color: Colors.white,
);
const TitleTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w300,
  fontSize: mediumTextSize,
  color: BackgroundColorWarm,
);
const Body1TextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w300,
  fontSize: BodyTextSize,
  color: Colors.black,
);
const ContentTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w300,
  fontSize: contentTextSize,
  color: Colors.black,
);
