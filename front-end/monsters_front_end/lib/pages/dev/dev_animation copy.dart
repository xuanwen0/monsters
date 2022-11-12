import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:monsters_front_end/main.dart';
import 'package:monsters_front_end/model/annoyanceModel.dart';
import 'package:monsters_front_end/model/audio_Model/audio_player.dart';
import 'package:monsters_front_end/pages/Timer_Widget.dart';
import 'package:monsters_front_end/pages/audio_main.dart';
import 'package:monsters_front_end/pages/drawing_colors.dart';
import 'package:monsters_front_end/pages/style.dart';
import 'package:monsters_front_end/repository/annoyanceRepo.dart';
import 'package:video_player/video_player.dart';

class dev_animation extends StatefulWidget {
  @override
  _dev_animationState createState() => _dev_animationState();
}

class _dev_animationState extends State<dev_animation> {
  static const double maxSize = 300;
  double height = maxSize;
  double width = maxSize;
  static const double imageSize = 80;
  final random = Random();
  static const double originPosition = maxSize / 2 - imageSize / 2;
  double _marginL = originPosition;
  double _marginT = originPosition;
  String monsterName = "Cloud";
  int movingDirection = 1;
  late String showImage = "assets/image/animatedImage/$monsterName" "_left.gif";

  static const moveSpeed = 50;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: secondAppBar("dev_animation"),
      body: Center(
        child: Column(
          children: [
            Container(
              color: Colors.black.withOpacity(0.1),
              height: maxSize,
              width: maxSize,
              child: Container(
                alignment: Alignment.topLeft,
                child: AnimatedContainer(
                  width: imageSize,
                  height: imageSize,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                      image: AssetImage(showImage),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  margin: EdgeInsets.only(
                    left: _marginL,
                    top: _marginT,
                  ),
                  duration: const Duration(seconds: 1),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              onPressed: () {
                Timer.periodic(Duration(seconds: 1), (timer) {
                  doAnimation();
                });
              },
              child: Text("change"),
            ),
          ],
        ),
      ),
    );
  }

  doAnimation() {
    var randomNum = random.nextInt(4) + 1; //1 2 3 4
    if (randomNum == 1) {
      _marginL += moveSpeed;
      movingDirection = 2;
      dev.log("go Right");
      checker();
    }
    if (randomNum == 2) {
      _marginL -= moveSpeed;
      movingDirection = 1;
      dev.log("go left");
      checker();
    }
    if (randomNum == 3) {
      _marginT -= moveSpeed;
      dev.log("go top");
      checker();
    }
    if (randomNum == 4) {
      _marginT += moveSpeed;
      dev.log("go bottom");
      checker();
    }
  }

  checker() {
    changeImage();

    if (_marginL <= moveSpeed) {
      changeDirectionLeft();
    }
    if (_marginL > maxSize - moveSpeed) {
      changeDirectionLeft();
    }
    if (_marginT <= moveSpeed) {
      changeDirectionTop();
    }
    if (_marginT > maxSize - moveSpeed) {
      changeDirectionTop();
    }
    setState(() {});
  }

  changeDirectionTop() {
    if (_marginT <= imageSize) {
      movingDirection = 2;
    }
    if (_marginT > maxSize - imageSize) {
      movingDirection = 1;
    }
    _marginT = originPosition;
    changeImage();
  }

  changeDirectionLeft() {
    if (_marginL <= imageSize) {
      movingDirection = 2;
    }
    if (_marginL > maxSize - imageSize) {
      movingDirection = 1;
    }
    _marginL = originPosition;
    changeImage();
  }

  void changeImage() {
    if (movingDirection == 1) {
      showImage = "assets/image/animatedImage/$monsterName" "_left.gif";
    }
    if (movingDirection == 2) {
      showImage = "assets/image/animatedImage/$monsterName" "_right.gif";
    }
    setState(() {});
  }
}
