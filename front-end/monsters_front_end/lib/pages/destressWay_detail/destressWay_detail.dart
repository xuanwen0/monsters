import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:monsters_front_end/model/destress_model/destressWay.dart';
import 'package:monsters_front_end/pages/style.dart';
import 'text_section.dart';
import 'image_banner.dart';

class DestressWayDetail extends StatelessWidget {
  final int _destressWayID;
  DestressWayDetail(this._destressWayID);
  @override
  Widget build(BuildContext context) {
    final destressWay = DestressWay.fetchByID(_destressWayID);
    return Scaffold(
      backgroundColor: BackgroundColorLight,
      appBar: AppBar(
          title: Text(
        destressWay!.name,
      )),
      body: SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
            SizedBox(
              height: 15,
            ),
            ImageBanner(destressWay.imagePath),
            ...textSections(destressWay),
            SizedBox(
              height: 15,
            ),
          ])),
    );
  }

  List<Widget> textSections(DestressWay destressWay) {
    return destressWay.steps
        .map((way) => TextSection(way.title, way.content))
        .toList();
  }
}
