import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:monsters_front_end/pages/home.dart';
import 'package:monsters_front_end/routes.dart';

String user_name = "";
String user_email = "";
String prettyPrint(Map json) {
  JsonEncoder encoder = const JsonEncoder.withIndent('  ');
  String pretty = encoder.convert(json);
  return pretty;
}

class FacebookLogin {
  Map<String, dynamic>? _userData;
  AccessToken? _accessToken;
  bool _checking = true;
  var LoggedUserData;

  late LoginResult result;
  login() async {
    result = await FacebookAuth.instance
        .login(); // by default we request the email and the public profile
    if (result.status == LoginStatus.success) {
      LoggedUserData =
          await FacebookAuth.instance.getUserData(fields: "name,email");
      user_name = LoggedUserData["name"];
      user_email = LoggedUserData["email"];
      log("user_name:" + user_name);
      log("user_Email:" + user_email);
      return true;
    }
    return false;
  }

/*
  Future<void> _checkIfIsLogged() async {
    final accessToken = await FacebookAuth.instance.accessToken;

    if (accessToken != null) {
      final userData =
          await FacebookAuth.instance.getUserData(fields: "name,email");
      // final userData = await FacebookAuth.instance.getUserData(fields: "email,birthday,friends,gender,link");
      _accessToken = accessToken;

      _userData = userData;
    }
  }
*/
  /*
  Future<void> _logOut() async {
    await FacebookAuth.instance.logOut();
    _accessToken = null;
    _userData = null;
  }
*/
}
