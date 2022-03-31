// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      backgroundColor: Colors.black87,
      child: Builder(
        builder: (context) => Scaffold(
          body: SingleChildScrollView(
            child: Column(children: <Widget>[
              SizedBox(
                child: CircleAvatar(backgroundColor: Colors.grey),
                width: 100.0,
                height: 100.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: 'account',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye),
                    labelText: "Password",
                  ),
                ),
              ),
              SizedBox(height: 52.0),
              SizedBox(
                width: MediaQuery.of(context).size.width - 48.0,
                height: 48.0,
                child: TextButton(
                  child: Text('Login'),
                  onPressed: () {
                    final progress = ProgressHUD.of(context);
                    progress!.showWithText("Loading...");
                    Future.delayed(Duration(seconds: 2), () {
                      Navigator.pushReplacementNamed(context, "/home");
                      progress.dismiss();
                    });
                  },
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
