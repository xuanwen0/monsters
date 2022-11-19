import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:monsters_front_end/main.dart';
import 'package:monsters_front_end/pages/firtTime_editUserInfo.dart';
import 'package:monsters_front_end/pages/home.dart';
import 'package:monsters_front_end/pages/lock/lock_page.dart';
import 'package:monsters_front_end/pages/login_selfacount.dart';
import 'package:monsters_front_end/pages/signUp.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:monsters_front_end/pages/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../API/google_sign_in_API.dart';
import '../model/memberModel.dart';
import '../repository/memberRepo.dart';
import 'package:date_format/date_format.dart';

class LoginPage extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<LoginPage> {
  //生日
  DateTime date = DateTime.now();
  final MemberRepository memberRepository = MemberRepository();

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

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
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image/icon_main.png'),
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
                  color: const Color.fromRGBO(216, 185, 99, 1),
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
            child: SizedBox.fromSize(
              size: Size(225, 39),
              child: Material(
                color: const Color.fromRGBO(216, 185, 99, 1),
                borderRadius: BorderRadius.circular(7.0),
                child: InkWell(
                  onTap: () => signIn(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Ink.image(
                          image:
                              const AssetImage('assets/image/icon_google.png'),
                          width: 30,
                          height: 30,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Text(
                        "從Google登入",
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<GoogleSignInAccount?> signIn() async {
    final user = await GoogleSignInApi.signin();
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(seconds: 1),
          backgroundColor: BackgroundColorWarm,
          content: Text(
            "從Google登入失敗",
            style: TextStyle(color: Colors.white, fontSize: 30),
          )));
    } else {
      print("帳號為: " + user.displayName.toString());
      //判斷資料庫是否有此帳號
      //if有 => 進行登入
      print("doing signIn()...");
      var result = await memberRepository
          .login(Member(account: user.email, password: ""));
      print("get Result: " + result.contains("result").toString() + "\n");
      print("result: " + result + "\n");
      if (result.contains("result") == true) {
        saveGoogleLogin(user.email);

        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => MainPage()));
      } else {
        //if無 => 註冊並前往初次設定資料
        memberRepository.createMember(
          Member(
            account: user.email,
            birthday: formatDate(date, [yyyy, '-', mm, '-', dd]).toString(),
            mail: user.email,
            nickName: user.displayName,
            password: "",
          ),
        );
        saveGoogleLogin(user.email);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => FirstTime_editUserInfo()));
      }
    }
  }

  void saveGoogleLogin(String account) async {
    //儲存account shared preferences (後用來判斷此裝置是否登入過)
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("googleLogin", account);
    // user_Account = account;
  }

  void checkLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? googleLogin = pref.getString("googleLogin");
    String? selfLogin = pref.getString("selfLogin");
    String? lock = pref.getString("lock");
    String? pin = pref.getString("pin");
    if (selfLogin != null) {
      print("已登入過，帳號:" + selfLogin);
      if (lock == 'true') {
        print("密碼:" + pin!);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LockPage()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MainPage()));
      }
    } else if (googleLogin != null) {
      print("已登入過，Google帳號:" + googleLogin);
      if (lock == 'true') {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LockPage()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MainPage()));
      }
    } else {
      print("已登出APP或第一次開啟");
    }
  }
}
