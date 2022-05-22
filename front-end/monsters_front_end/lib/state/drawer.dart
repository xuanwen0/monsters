// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';

import '../pages/drawer_setting.dart';
import '../pages/drawer_userInformation.dart';

Widget GetDrawer(BuildContext context) {
  var drawer = Drawer(
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
                    builder: (context) => Drawer_userInformation()));
          },
        ),
        ListTile(
          title: const Text(
            "設定",
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 35.0,
              color: Color(0xffa0522d),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Drawer_settings()));
          },
        ),
        const ListTile(
          title: Text(
            "使用說明",
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 35.0,
              color: Color(0xffa0522d),
            ),
          ),
        ),
        const ListTile(
          title: Text(
            "使用回饋",
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 35.0,
              color: Color(0xffa0522d),
            ),
          ),
        ),
      ]));
  return drawer;
}
