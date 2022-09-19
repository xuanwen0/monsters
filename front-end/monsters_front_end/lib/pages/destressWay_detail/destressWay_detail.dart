import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:monsters_front_end/model/destressWayModel.dart';
import 'package:monsters_front_end/pages/style.dart';
import 'text_section.dart';

class DestressWayDetail extends StatelessWidget {
  final int _destressWayID;
  DestressWayDetail(this._destressWayID);
  @override
  Widget build(BuildContext context) {
    final destressWay = DestressWay.fetchByID(_destressWayID);
    return Scaffold(
      backgroundColor: BackgroundColorLight,
      appBar: secondAppBar(destressWay!.name),
      body: SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
            ...textSections(destressWay),
            SizedBox(
              height: 20,
            ),
          ])),
    );
  }

  List<Widget> textSections(DestressWay destressWay) {
    return destressWay.steps.map((way) => TextSection(way.content)).toList();
  }
}
