import 'dart:developer';

import 'package:adobe_xd/page_link.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monsters_front_end/pages/interaction.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monsters_front_end/pages/psychologicial_result.dart';
import 'package:monsters_front_end/pages/style.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Psychologicial_test extends StatefulWidget {
  @override
  _Psychologicial_testState createState() => _Psychologicial_testState();
}

class _Psychologicial_testState extends State<Psychologicial_test> {
  late YoutubePlayerController controller;
  final value = [0, 1, 2, 3, 4, 5];
  final groups = [0, 1, 2, 3, 4, 5];
  final groupVal = [0, 0, 0, 0, 0, 0];
  var alarm = "";

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    const url = "https://www.youtube.com/watch?v=ycXMqLOHZGA";
    controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(url)!,
        flags: const YoutubePlayerFlags(
          endAt: 90,
          mute: false,
          loop: false,
          forceHD: true,
          autoPlay: false,
          controlsVisibleAtStart: false,
        ));
  }

  @override
  void deactivate() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => YoutubePlayerBuilder(
        player: YoutubePlayer(controller: controller),
        builder: (context, player) => Scaffold(
          appBar: secondAppBar("深度心理測驗"),
          backgroundColor: BackgroundColorLight,
          body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(child: player),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 515,
                    padding: const EdgeInsets.only(bottom: 5),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        questionContainer("1.睡眠困難"),
                        answerRow(groups[0]),
                        questionContainer("2.感覺緊張不安"),
                        answerRow(groups[1]),
                        questionContainer("3.覺得容易苦惱或動怒"),
                        answerRow(groups[2]),
                        questionContainer("4.感覺憂鬱、情緒低落"),
                        answerRow(groups[3]),
                        questionContainer("5.覺得比不上別人"),
                        answerRow(groups[4]),
                        questionContainer("6.有過自殺的念頭"),
                        answerRow(groups[5]),
                        Container(
                          color: BackgroundColorLight,
                          height: 30,
                          child: Text(alarm),
                        ),
                        TextButton(
                            child: Container(
                              width: 250,
                              decoration: BoxDecoration(
                                  color: BackgroundColorWarm,
                                  border: Border.all(
                                      color: BackgroundColorWarm, width: 3),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(50.0))),
                              child: const Text(
                                "查看分析結果",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 28, color: Colors.white),
                              ),
                            ),
                            onPressed: () => checkAns()),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      );

  Center answerRow(int group) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "輕微",
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(
            width: 10,
          ),
          answerColumn(
            0,
            group,
          ),
          answerColumn(
            1,
            group,
          ),
          answerColumn(
            2,
            group,
          ),
          answerColumn(
            3,
            group,
          ),
          answerColumn(
            4,
            group,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            "嚴重",
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }

  Column answerColumn(int _value, int inGroup) {
    return Column(
      children: [
        Text(_value.toString()),
        const SizedBox(width: 10.0),
        Radio<int>(
            value: _value,
            groupValue: groupVal[inGroup],
            onChanged: (val) => setState(() {
                  groupVal[inGroup] = val!;
                })),
      ],
    );
  }

  Container questionContainer(String question) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 30, bottom: 15),
      child: Text(
        question,
        textAlign: TextAlign.left,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  checkAns() {
    int total = 0;
    for (int score in groupVal) {
      total += score;
    }

    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => Psychologicial_result(total)));
  }
}
