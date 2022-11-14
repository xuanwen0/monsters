import 'package:flutter/material.dart';
import 'package:monsters_front_end/pages//lock/lock_widget.dart';
import 'package:monsters_front_end/pages/home.dart';
import 'package:monsters_front_end/pages/lock/forget_lock_auth.dart';
import 'package:monsters_front_end/pages/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LockPage extends StatefulWidget {
  @override
  _LockPageState createState() => _LockPageState();
}

class _LockPageState extends State<LockPage> {
  MPinController mPinController = MPinController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColorLight,
      body: Stack(
        children: [
          //標題
          const Align(
            alignment: Alignment.topCenter,
            child: Text(
              '密碼',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 40,
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
                      if (mPin == val) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainPage()));
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Forget_Lock_Auth()));
                          },
                          textColor: BackgroundColorWarm,
                          child: const Text(
                            '忘記密碼',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 20,
                              color: Color.fromRGBO(160, 82, 45, 1),
                            ),
                          )),
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
