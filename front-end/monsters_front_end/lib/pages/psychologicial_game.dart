import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Psychologicial_game extends StatefulWidget {
  @override
  _Psychologicial_gameState createState() => _Psychologicial_gameState();
}

class _Psychologicial_gameState extends State<Psychologicial_game> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('心理小遊戲')),
      body: Center(
        child: new InkWell(
            child: new Text('心理小遊戲'),
            hoverColor: Colors.yellowAccent,
            onTap: () => launch(
                'https://girlstyle.com/tw/tag/%E5%BF%83%E7%90%86%E6%B8%AC%E9%A9%97')),
      ),
    );
  }
}
