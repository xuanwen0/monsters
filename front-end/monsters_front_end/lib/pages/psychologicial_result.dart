import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monsters_front_end/pages/destressWays_list/destressWays_list.dart';
import 'package:monsters_front_end/pages/mind_game.dart';

import 'package:monsters_front_end/pages/style.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Psychologicial_result extends StatefulWidget {
  int total;
  Psychologicial_result(this.total, {Key? key}) : super(key: key);

  @override
  _Psychologicial_result createState() => _Psychologicial_result(total);
}

class _Psychologicial_result extends State<Psychologicial_result> {
  late YoutubePlayerController controller;
  int total;
  _Psychologicial_result(this.total);
  //take the total score

  @override
  void initState() {
    super.initState();

    const url = "https://www.youtube.com/watch?v=ycXMqLOHZGA";
    controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(url)!,
        flags: const YoutubePlayerFlags(
            startAt: 89,
            endAt: 113,
            mute: false,
            loop: false,
            forceHD: true,
            autoPlay: false,
            controlsVisibleAtStart: false));

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
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
    controller.reset();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => YoutubePlayerBuilder(
      player: YoutubePlayer(controller: controller),
      builder: (context, player) => Scaffold(
            appBar: secondAppBar("分析結果"),
            backgroundColor: BackgroundColorLight,
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(child: player),
                  suggestion(),
                  const SizedBox(
                    height: 15,
                  ),
                  //心理小遊戲
                  pushButton("心理小遊戲"),
                  const SizedBox(
                    height: 10,
                  ),
                  //紓壓方法
                  pushButton("紓壓方法"),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ));

  Container suggestion() {
    var title = "";
    var subTitle = "";
    var content = "";
    var score;
    if (total < 6) {
      title = "您的心情很健康！";
      subTitle = "請繼續保持，好嗎？";
      content = "想要更開心嗎？玩一下心情小遊戲吧！";
    } else if (total < 15) {
      title = "最近有些憂鬱嗎？";
      subTitle = "請多喝水並充分休息，\n一切都會更好的～";
      content = "歡迎使用貘nsters提供的紓壓管道！";
    } else {
      title = "您的情況較嚴重";
      subTitle = "我們關心您，\n建議尋求專家幫助！\n\n歡迎使用貘nsters的互動功能，\n也歡迎撥打以下免費專線！";
      content = "衛生福利部安心專線: 1925\n生命線: 1995\n張老師: 1980";
    }

    return Container(
        padding: const EdgeInsets.fromLTRB(30, 5, 10, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "分數: $total",
              style: const TextStyle(
                  fontSize: 32,
                  color: BackgroundColorWarm,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              title,
              style: const TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 30,
                  color: BackgroundColorWarm,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              subTitle,
              style: const TextStyle(fontSize: 22, color: Colors.black),
            ),
            Text(content,
                style: const TextStyle(fontSize: 18, color: Colors.black)),
          ],
        ));
  }

  Center pushButton(String title) {
    Widget link;
    if (title == "心理小遊戲") {
      link = Psychologicial_game();
    } else {
      link = DestressWaysList();
    }
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: 190,
        height: 55,
        decoration: BoxDecoration(
            color: BackgroundColorWarm,
            border: Border.all(color: BackgroundColorWarm, width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(50.0))),
        child: TextButton(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
            onPressed: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => link))),
      ),
    );
  }
}
