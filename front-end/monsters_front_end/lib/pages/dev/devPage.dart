import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:monsters_front_end/main.dart';
import 'package:monsters_front_end/model/annoyanceModel.dart';
import 'package:monsters_front_end/pages/style.dart';
import 'package:monsters_front_end/repository/annoyanceRepo.dart';

class devPage extends StatefulWidget {
  @override
  _devPageState createState() => _devPageState();
}

class _devPageState extends State<devPage> {
  final AnnoyanceRepository annoyanceRepository = AnnoyanceRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: secondAppBar("dev-page"),
      body: Container(
        alignment: Alignment.center,
        height: 200,
        width: 200,
        padding: const EdgeInsets.all(30),
        child: TextButton(
          child: const Text(
            "新增煩惱",
            style: TextStyle(
              fontSize: 30,
              color: Colors.red,
            ),
          ),
          onPressed: () {
            annoyanceRepository.createAnnoyance(
              Annoyance(
                id: 0,
                account: "Lin", //"Lin"
                monsterId: 1,
                type: 4, //4
                content: "純文字不分享無多媒體", //"純文字不分享無多媒體"
                mood: "否", //"否"
                index: 3, //3
                share: 0, //0
                contentFile: null, //null
                moodFile: null, //null
                time: '',
                solve: 0,
              ),
            );
          },
        ),
      ),
    );
  }
}
