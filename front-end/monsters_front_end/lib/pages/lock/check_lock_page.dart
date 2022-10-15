import 'package:flutter/material.dart';
import 'package:monsters_front_end/pages//lock/lock_widget.dart';
import 'package:monsters_front_end/pages/drawer_setting.dart';
import 'package:monsters_front_end/pages/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckLockPage extends StatefulWidget {
  @override
  _CheckLockPageState createState() => _CheckLockPageState();
}

class _CheckLockPageState extends State<CheckLockPage> {
  MPinController mPinController = MPinController();
  bool isCorrect = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColorLight,
      body: Stack(
        children: [
          //上一頁
          Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back_rounded),
                color: Color.fromRGBO(255, 187, 0, 1),
                iconSize: 57.0,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )),
          //標題
          const Align(
            alignment: Alignment.topCenter,
            child: Text(
              '再次確認',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 47,
                color: Color(0xffa0522d),
              ),
              softWrap: false,
            ),
          ),
          //白底
          Center(
            child: Container(
              height: 550,
              color: Colors.white,
            ),
          ),
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //顯示框
                  MPinWidget(
                    pinLegth: 4,
                    controller: mPinController,
                    onCompleted: (mPin) async {
                      print('You entered -> $mPin');
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      String? val = pref.getString("pin");
                      if (val == mPin) {
                        saveLock('true');
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Drawer_settings()));
                      } else {
                        mPinController.notifyWrongInput();
                      }
                    },
                  ),
                  SizedBox(height: 32),
                  //數字鍵盤
                  GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    childAspectRatio: 1.6,
                    children: List.generate(
                        9, (index) => buildMaterialButton(index + 1)),
                  ),
                  GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    childAspectRatio: 1.6,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          null;
                        },
                      ),
                      buildMaterialButton(0),
                      MaterialButton(
                        onPressed: () {
                          mPinController.delete();
                        },
                        textColor: BackgroundColorWarm,
                        child: Icon(Icons.backspace_rounded),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  MaterialButton buildMaterialButton(int input) {
    return MaterialButton(
      onPressed: () {
        mPinController.addInput('$input');
      },
      textColor: BackgroundColorWarm,
      child: Text(
        '$input',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

void saveLock(String lock) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.setString("lock", lock);
}
