// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:monsters_front_end/pages/home.dart';
import 'package:monsters_front_end/pages/login.dart';
import 'package:monsters_front_end/routes.dart';


void main() {
  runApp(Monsters());
}

class Monsters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '貘sters',
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
