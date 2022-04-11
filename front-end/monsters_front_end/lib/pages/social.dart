import 'package:flutter/material.dart';

class Social extends StatefulWidget {
  @override
  _SocialState createState() => _SocialState();
}

class _SocialState extends State<Social> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Social')),
      body: Center(
        child: Text('Social Screen', style: TextStyle(fontSize: 40)),
      ),
    );
  }
}
