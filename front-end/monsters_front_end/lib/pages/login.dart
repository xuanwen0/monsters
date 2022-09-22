import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/services.dart';
import 'package:monsters_front_end/pages/home.dart';
import 'package:monsters_front_end/pages/login_selfacount.dart';
import 'package:monsters_front_end/pages/signUp.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../API/google_sign_in_API.dart';

class LoginPage extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffffed4),
      body: Stack(
        children: <Widget>[
          //LOGO圖
          Pinned.fromPins(
            Pin(start: 42.0, end: 42.0),
            Pin(size: 312.0, start: 93.0),
            child:
                // Adobe XD layer: 'logo' (shape)
                Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/image/icon_main.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          //登入
          Align(
            alignment: Alignment(0.005, 0.139),
            child: SizedBox(
              width: 225.0,
              height: 39.0,
              child: RaisedButton(
                  color: Color.fromRGBO(216, 185, 99, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0)),
                  child: const Text(
                    '登入',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 20,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    softWrap: false,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Login_selfacount()));
                  }),
            ),
          ),
          //註冊
          Align(
            alignment: Alignment(0.005, 0.283),
            child: SizedBox(
              width: 225.0,
              height: 39.0,
              child: RaisedButton(
                  color: Color.fromRGBO(216, 185, 99, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0)),
                  child: const Text(
                    '註冊',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 20,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    softWrap: false,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  }),
            ),
          ),
          //Google
          Align(
            alignment: Alignment(0.005, 0.426),
            child: SizedBox(
                width: 225.0,
                height: 39.0,
                child: Container(
                  alignment: Alignment.centerRight,
                  child: SignInButton(
                    Buttons.Google,
                    text: "Google 登入",
                    padding: EdgeInsets.only(left: 20),
                    onPressed: signIn,
                  ),
                )),
          ),
        ],
      ),
    );
  }

  Future<GoogleSignInAccount?> signIn() async {
    final user = await GoogleSignInApi.signin();
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('sign in Google failed'),
      ));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainPage()));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            'user name: ' + user.displayName! + ' user email: ' + user.email),
      ));
    }
  }

  void pageRoute(String account) async {
    //儲存account shared preferences (後用來判斷此裝置是否登入過)
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("login", account);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("${pref.getString("login")}")));
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MainPage()));
  }
}
