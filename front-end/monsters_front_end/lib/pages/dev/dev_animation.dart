import 'dart:async';
import 'dart:math';
import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:monsters_front_end/pages/monsters_information.dart';
import 'package:monsters_front_end/pages/style.dart';

class dev_animation extends StatefulWidget {
  @override
  _dev_animationState createState() => _dev_animationState();
}

class _dev_animationState extends State<dev_animation> {
  static const double maxSize = 300;
  double height = maxSize;
  double width = maxSize;
  final random = Random();
  static const double originPosition = (maxSize - 100) / 2;
  double _marginL = originPosition;
  double _marginT = originPosition;
  String monsterName = getRandomMonsterName();
  int moveingDirection = 1;
  late String showImage;
  static const moveSpeed = 30;
  bool visited = false;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  print(monsterName.toString());
    if (!visited) {
      visited = true;

      Timer.periodic(const Duration(milliseconds: 619), (timer) {
        doAnimation();
      });
    }
    setState(() {
      if (moveingDirection == 1) {
        showImage = "assets/image/animatedImage/$monsterName" "_left.gif";
      }
      if (moveingDirection == 2) {
        showImage = "assets/image/animatedImage/$monsterName" "_right.gif";
      }
    });
    return Scaffold(
      appBar: secondAppBar("dev_animation"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.black.withOpacity(0.1),
              height: maxSize,
              width: maxSize,
              child: Container(
                alignment: Alignment.topLeft,
                child: AnimatedContainer(
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: null,
                      image: DecorationImage(
                        image: AssetImage(showImage),
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  margin: EdgeInsets.only(
                    left: _marginL,
                    top: _marginT,
                  ),
                  duration: const Duration(milliseconds: 811),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              onPressed: () {
                Timer.periodic(const Duration(milliseconds: 619), (timer) {
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
    setState(() {
      int randomNum = random.nextInt(4) + 1; //1 2 3 4
      if (randomNum == 1) {
        _marginL += moveSpeed;
        moveingDirection = 2;
        dev.log("go Right");
        checker();
      }
      if (randomNum == 2) {
        _marginL -= moveSpeed;
        moveingDirection = 1;
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
    });
  }

  checker() {
    if (_marginL <= moveSpeed || _marginL > maxSize - moveSpeed) {
      changeDirectionLeft();
    }
    if (_marginT <= moveSpeed || _marginT > maxSize - moveSpeed) {
      changeDirectionTop();
    }
    setState(() {});
  }

  changeDirectionTop() {
    if (moveingDirection == 1) {
      moveingDirection = 2;
    } else {
      moveingDirection = 1;
    }
    _marginT = originPosition;
  }

  changeDirectionLeft() {
    if (_marginL <= moveSpeed) {
      moveingDirection = 2;
    }
    if (_marginL > maxSize - moveSpeed) {
      moveingDirection = 1;
    }
    _marginL = originPosition;
  }
}
