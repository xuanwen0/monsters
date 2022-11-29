import 'package:flutter/material.dart';
import 'package:monsters_front_end/pages//lock/lock_widget.dart';
import 'package:monsters_front_end/pages/lock/forget_lock_auth.dart';
import 'package:monsters_front_end/pages/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CloseLockPage extends StatefulWidget {
  @override
  _CloseLockPageState createState() => _CloseLockPageState();
}

class _CloseLockPageState extends State<CloseLockPage> {
  MPinController mPinController = MPinController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColorLight,
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Stack(
          children: [
            //上一頁
            Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_rounded),
                  color: const Color.fromRGBO(255, 187, 0, 1),
                  iconSize: 57.0,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )),
            //標題
            const Align(
              alignment: Alignment.topCenter,
              child: Text(
                '關閉密碼鎖',
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
                          saveLock('false');
                          await pref.remove("pin");
                          Navigator.pop(context);
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
                                      builder: (context) =>
                                          Forget_Lock_Auth()));
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

  void saveLock(String lock) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("lock", lock);
  }
}
