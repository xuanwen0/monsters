import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

String prettyPrint(Map json) {
  JsonEncoder encoder = const JsonEncoder.withIndent('  ');
  String pretty = encoder.convert(json);
  return pretty;
}

class FacebookLogin extends StatefulWidget {
  const FacebookLogin({Key? key}) : super(key: key);

  @override
  _FacebookLogin createState() => _FacebookLogin();
}

class _FacebookLogin extends State<FacebookLogin> {
  Map<String, dynamic>? _userData;
  AccessToken? _accessToken;
  bool _checking = true;

  @override
  void initState() {
    super.initState();
    _checkIfIsLogged();
  }

  Future<void> _checkIfIsLogged() async {
    final accessToken = await FacebookAuth.instance.accessToken;
    setState(() {
      _checking = false;
    });
    if (accessToken != null) {
      final userData =
          await FacebookAuth.instance.getUserData(fields: "name,email");
      // final userData = await FacebookAuth.instance.getUserData(fields: "email,birthday,friends,gender,link");
      _accessToken = accessToken;
      setState(() {
        _userData = userData;
      });
    }
  }

  Future<void> _login() async {
    final LoginResult result = await FacebookAuth.instance.login(permissions: [
      "public_profile",
      "email"
    ]); // by default we request the email and the public profile

    if (result.status == LoginStatus.success) {
      _accessToken = result.accessToken;
      // get the user data
      // by default we get the userId, email,name and picture
      final userData =
          await FacebookAuth.instance.getUserData(fields: "name,email");
      _userData = userData;
    } else {
      print(result.status);
      print(result.message);
    }

    setState(() {
      _checking = false;
    });
  }

  Future<void> _logOut() async {
    await FacebookAuth.instance.logOut();
    _accessToken = null;
    _userData = null;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Facebook Auth Example'),
        ),
        body: _checking
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        _userData != null
                            ? prettyPrint(_userData!)
                            : "NO LOGGED",
                      ),
                      const SizedBox(height: 20),
                      const SizedBox(height: 20),
                      CupertinoButton(
                        color: Colors.blue,
                        onPressed: _userData != null ? _logOut : _login,
                        child: Text(
                          _userData != null ? "LOGOUT" : "LOGIN",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
