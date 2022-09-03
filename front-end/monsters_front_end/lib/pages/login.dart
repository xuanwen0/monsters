import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/services.dart';
import 'package:monsters_front_end/pages/home.dart';
import 'package:monsters_front_end/pages/login_selfacount.dart';
import 'package:monsters_front_end/pages/signUp.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../API/google_sign_in_API.dart';

class LoginPage extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
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
                child: SignInButton(
                  Buttons.Google,
                  text: "從 Google 登入",
                  onPressed: signIn,
                )),
          ),
          //line
          Align(
            alignment: Alignment(0.005, 0.57),
            child: SizedBox(
              width: 225.0,
              height: 39.0,
              child: ColoredBox(
                color: Color.fromARGB(255, 74, 163, 77),
                child: Stack(
                  children: <Widget>[
                    Pinned.fromPins(
                      Pin(size: 30.0, start: 10.0),
                      Pin(start: 5.0, end: 4.0),
                      child:
                          // Adobe XD layer: 'appicon_01_f9ed1cf0…' (shape)
                          Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                const AssetImage('assets/image/icon_line.jpg'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 110.0, middle: 0.27),
                      Pin(start: 8.0, end: 4.0),
                      child: Text(
                        '從LINE登入',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 15,
                          color: Colors.white,
                        ),
                        softWrap: false,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //fb
          Pinned.fromPins(
            Pin(size: 225.0, middle: 0.5027),
            Pin(size: 39.0, end: 106.0),
            child: SignInButton(
              Buttons.FacebookNew,
              text: "從 Facebook 登入",
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Future<GoogleSignInAccount?> signIn() async {
    final user = await GoogleSignInApi.signin();
    if (user == null) {
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //   content: Text('sign in Google failed'),
      // ));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainPage()));
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //   content: Text('sign in Google Account'),
      // ));
    }
  }
}
