// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:monsters_front_end/API/google_sign_in_API.dart';
import 'package:monsters_front_end/pages/instructions.dart';
import 'package:monsters_front_end/pages/lock/check_lock_page.dart';
import 'package:monsters_front_end/pages/manual.dart';
import 'package:monsters_front_end/pages/style.dart';
import 'package:monsters_front_end/pages/user_Feedback.dart';
import 'package:monsters_front_end/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/drawer_personalInfo.dart';

Widget GetDrawer(BuildContext context) {
  Future<dynamic> popUp(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return const ShareAppWidget();
      },
    );
  }

  var drawer = SizedBox(
      width: 250,
      child: Drawer(
          backgroundColor: const Color(0xfffffed4),
          child: ListView(children: [
            ListTile(
              title: const Text(
                "個人資料",
                style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 35.0,
                    color: Color(0xffa0522d)),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Drawer_personalInfo()));
              },
            ),
            ListTile(
              title: const Text(
                "密碼鎖",
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 35.0,
                  color: Color(0xffa0522d),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CheckLockPage()));
              },
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InstructionsPage()));
              },
              title: const Text(
                "使用說明",
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 35.0,
                  color: Color(0xffa0522d),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => user_Feedback()));
              },
              title: const Text(
                "使用回饋",
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 35.0,
                  color: Color(0xffa0522d),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                popUp(context);
              },
              title: const Text(
                "分享貘nsters",
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 35.0,
                  color: Color(0xffa0522d),
                ),
              ),
            ),
            ListTile(
              title: const Text(
                "登出",
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 35.0,
                  color: Color(0xffa0522d),
                ),
              ),
              onTap: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                String? selfLogin = pref.getString("selfLogin");
                String account = "";
                await pref.remove("account");
                if (selfLogin != null) {
                  await pref.remove("selfLogin");
                } else {
                  await pref.remove("googleLogin");
                  await GoogleSignInApi.signout();
                }
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ])));
  return drawer;
}

class ShareAppWidget extends StatefulWidget {
  const ShareAppWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ShareAppWidget();
  }
}

class _ShareAppWidget extends State<ShareAppWidget> {
  String question = "分享貘nsters給其他人吧！";
  String cancel = "取消";
  String copy = "複製連結";

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Center(
          child: Container(
            height: 340,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: BackgroundColorLight,
              border: Border.all(width: 5, color: BackgroundColorWarm),
              borderRadius: BorderRadius.circular(22.0),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 180,
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.7,
                  color: BackgroundColorLight,
                  child: Center(
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/image/qrcode.png'),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      question,
                      style: const TextStyle(
                          color: BackgroundColorWarm, fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 105,
                        height: 45,
                        margin: const EdgeInsets.only(
                          left: 30,
                          bottom: 3,
                        ),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            color: BackgroundColorWarm,
                            border: Border.all(
                                color: BackgroundColorWarm, width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0))),
                        child: Center(
                          child: Text(
                            cancel,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Clipboard.setData(const ClipboardData(
                            text:
                                "https://drive.google.com/drive/folders/1-8_UIiTAcqtnYRLuYPJoqdCOICumRfMh?usp=share_link"));

                        Navigator.pop(context);

                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                                duration: Duration(seconds: 1),
                                backgroundColor: BackgroundColorWarmOpacity,
                                content: Text(
                                  "連結複製成功！",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 35),
                                )));
                      },
                      child: Container(
                        width: 105,
                        height: 45,
                        margin: const EdgeInsets.only(
                          right: 30,
                          bottom: 3,
                        ),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            color: BackgroundColorWarm,
                            border: Border.all(
                                color: BackgroundColorWarm, width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0))),
                        child: Center(
                          child: Text(
                            copy,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
