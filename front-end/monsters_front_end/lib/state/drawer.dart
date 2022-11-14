// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:monsters_front_end/API/google_sign_in_API.dart';
import 'package:monsters_front_end/pages/instructions.dart';
import 'package:monsters_front_end/pages/lock/check_lock_page.dart';
import 'package:monsters_front_end/pages/user_Feedback.dart';
import 'package:monsters_front_end/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/drawer_personalInfo.dart';

Widget GetDrawer(BuildContext context) {
  var drawer = Container(
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
