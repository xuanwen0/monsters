// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

//text settings
const LargeTextSize = 32.0;
const mediumTextSize = 26.0;
const BodyTextSize = 22.0;
const String FontNameDefault = "Segoe UI";

const AppBarTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w300,
  fontSize: mediumTextSize,
  color: Colors.white,
);

const TitleTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w300,
  fontSize: LargeTextSize,
  color: BackgroundColorWarm,
);
const Body1TextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w300,
  fontSize: BodyTextSize,
  color: Colors.black,
);

//background colors settings
const BackgroundColorLight = Color(0xfffffed4);
const BackgroundColorWarm = Color(0xffa0522d);
