// ignore_for_file: use_key_in_widget_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monsters_front_end/pages/home.dart';
import 'package:monsters_front_end/pages/login.dart';
import 'package:monsters_front_end/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  //開啟APP先判斷
  WidgetsFlutterBinding.ensureInitialized();
  //checkLogin();
  runApp(Monsters());
}

class Monsters extends StatelessWidget with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
        break;
      case AppLifecycleState.paused:
        log(state.toString());
        break;
      case AppLifecycleState.resumed:
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
        log(state.toString());
        break;
      case AppLifecycleState.detached:
        log(state.toString());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addObserver(this);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return MaterialApp(
      title: '貘nsters',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        GitmeRebornRoutes.login: (context) => MainPage(),
        GitmeRebornRoutes.home: (context) => MainPage(),
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case GitmeRebornRoutes.root:
            return MaterialPageRoute(builder: (context) => MainPage());
          default:
            return MaterialPageRoute(builder: (context) => MainPage());
        }
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

void checkLogin() async {
  //check if user already login or credential already available or not
  SharedPreferences pref = await SharedPreferences.getInstance();
  String? val = pref.getString("login");
  if (val != null) {
    //直接前往主畫面 !!失敗!!
    print("已登入過，帳號:" + val);
    MaterialPageRoute(builder: (context) => MainPage());
  } else {
    print("已登出或第一次開啟");
  }
}
