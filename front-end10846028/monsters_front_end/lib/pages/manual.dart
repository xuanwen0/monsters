import 'package:flutter/material.dart';

class Manual extends StatefulWidget {
  @override
  _ManualState createState() => _ManualState();
}

class _ManualState extends State<Manual> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manual')),
      body: Center(
        child: Text('Manual Screen', style: TextStyle(fontSize: 40)),
      ),
    );
  }
}
