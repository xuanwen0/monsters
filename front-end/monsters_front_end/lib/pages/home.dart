// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(),
        body: TabBarView(
          children: <Widget>[
            Tab(text: "互動"),
            Tab(text: "圖鑑"),
            Tab(text: "新增"),
            Tab(text: "歷史紀錄"),
            Tab(text: "社群"),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerTile(
                icon: Icon(Icons.person),
                text: "個人資料",
                onPressed: () {
                  print("個人資料");
                },
              ),
              DrawerTile(
                  icon: Icon(Icons.settings),
                  text: "設定",
                  onPressed: () {
                    print("設定");
                  }),
              DrawerTile(
                  icon: Icon(Icons.info),
                  text: "使用說明",
                  onPressed: () {
                    print("使用說明");
                  }),
              DrawerTile(
                  icon: Icon(Icons.thumb_up),
                  text: "使用回饋",
                  onPressed: () {
                    print("使用回饋");
                  }),
              DrawerTile(
                icon: Icon(Icons.power_settings_new),
                text: "登出",
                onPressed: () async {
                  await showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => AlertDialog(
                      content: Text("Are you sure to exit current account"),
                      actions: <Widget>[
                        TextButton(
                          child: Text("Cancel"),
                          onPressed: () => Navigator.pop(context),
                        ),
                        TextButton(
                          child: Text("Ok"),
                          onPressed: () => Navigator.pushNamedAndRemoveUntil(
                              context, "/login", ModalRoute.withName("/")),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.blueGrey,
          child: TabBar(
            labelPadding: EdgeInsets.zero,
            tabs: <Widget>[
              Tab(text: "互動", icon: Icon(Icons.home)),
              Tab(text: "圖鑑", icon: Icon(Icons.android)),
              Tab(text: "新增煩惱/日記", icon: Icon(Icons.add)),
              Tab(text: "歷史紀錄", icon: Icon(Icons.search)),
              Tab(text: "交友社群", icon: Icon(Icons.share)),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  final Icon icon;
  final String text;
  final Function onPressed;

  const DrawerTile(
      {Key? key, required this.icon, this.text = "", required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: <Widget>[
          icon,
          Text(text),
          SizedBox(width: 24.0),
        ],
      ),
      onTap:  () => onPressed,
    );
  }
}
