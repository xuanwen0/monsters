import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:monsters_front_end/main.dart';
import 'package:monsters_front_end/model/destressWayModel.dart';
import 'package:monsters_front_end/pages/destressWay_detail/destressWay_detail.dart';
import 'package:monsters_front_end/routes.dart';

class DestressWaysList extends StatelessWidget {
  final destressWays = DestressWay.fetchAll();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("紓壓方式"),
        ),
        body: Container(
          alignment: Alignment.topLeft,
          child: ListView(
            children: destressWays
                .map((destressWay) => Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Expanded(
                              flex: 4,
                              child: imageContainer(destressWay.imagePath)),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Expanded(
                              flex: 6, child: textContainer(destressWay.steps)),
                        ),

                        // ...textColumn(destressWay),
                      ],
                    ))
                .toList(),

            /*
          children: destressWay
              .map((way) => Container(
                    width: 20,
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          way.imagePath,
                          width: 50,
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                      onTap: () => _onDestressWayTap(context, way.id),
                    ),
                  ))
              .toList(),
      ),

      */
          ),
        ));
  }
}

Container imageContainer(String image) {
  Container imageBox = Container(
      alignment: Alignment.center,
      child: Expanded(
        flex: 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
            alignment: Alignment.centerLeft,
          ),
        ),
      ));
  return imageBox;
}

Container textContainer(List destressWay) {
  Container textBox;

  textBox = Container(
      alignment: Alignment.topCenter,
      child: Expanded(
          flex: 2,
          child: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: Container(
                      alignment: Alignment.centerLeft, child: Text("title1"))),
              Expanded(
                  flex: 7,
                  child: Container(
                      alignment: Alignment.centerLeft, child: Text("content"))),
            ],
          )));
  return textBox;
}

_onDestressWayTap(BuildContext context, int destressWayID) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DestressWayDetail(destressWayID)));
}
 /*
 Container myContainer1(

  width: 20,
  alignment: Alignment.centerLeft,
  child: GestureDetector(
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Image.asset(
        way.imagePath,
        width: 50,
        alignment: Alignment.centerLeft,
      ),
    ),
    onTap: () => _onDestressWayTap(context, way.id),
  ),
)*/