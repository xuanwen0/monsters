// ignore_for_file: use_key_in_widget_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monsters_front_end/pages/home.dart';
import 'package:monsters_front_end/pages/login.dart';
import 'package:monsters_front_end/routes.dart';

void main() {
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
    WidgetsBinding.instance!.addObserver(this);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return MaterialApp(
      title: '貘nsters',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        GitmeRebornRoutes.login: (context) => LoginPage(),
        GitmeRebornRoutes.home: (context) => MainPage(),
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case GitmeRebornRoutes.root:
            return MaterialPageRoute(builder: (context) => LoginPage());
          default:
            return MaterialPageRoute(builder: (context) => LoginPage());
        }
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
