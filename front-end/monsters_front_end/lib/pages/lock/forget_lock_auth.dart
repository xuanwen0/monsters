import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:email_auth/email_auth.dart';
import 'package:monsters_front_end/pages/lock/setting_lock_page.dart';
import 'package:monsters_front_end/pages/style.dart';

class Forget_Lock_Auth extends StatefulWidget {
  @override
  _Forget_Lock_AuthState createState() => _Forget_Lock_AuthState();
}

class _Forget_Lock_AuthState extends State<Forget_Lock_Auth> {
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late EmailAuth emailAuth;

  @override
  void initState() {
    super.initState();
    // Initialize the package
    emailAuth = EmailAuth(
      sessionName: "貘nsters",
    );
  }

  void sendOTP() async {
    emailAuth.sessionName = "貘nsters";
    var res = await emailAuth.sendOtp(recipientMail: _mailController.text);
    if (res) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(seconds: 1),
          backgroundColor: BackgroundColorWarm,
          content: Text(
            "認證碼傳送成功",
            style: TextStyle(color: Colors.white, fontSize: 30),
          )));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(seconds: 1),
          backgroundColor: BackgroundColorWarm,
          content: Text(
            "認證碼傳送失敗",
            style: TextStyle(color: Colors.white, fontSize: 30),
          )));
    }
  }

  void verifyOTP() {
    var res = emailAuth.validateOtp(
        recipientMail: _mailController.text, userOtp: _otpController.text);
    if (res) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(seconds: 1),
          backgroundColor: BackgroundColorWarm,
          content: Text(
            "認證成功",
            style: TextStyle(color: Colors.white, fontSize: 30),
          )));

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SettingLockPage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(seconds: 1),
          backgroundColor: BackgroundColorWarm,
          content: Text(
            "認證失敗",
            style: TextStyle(color: Colors.white, fontSize: 30),
          )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xfffffed4),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Stack(
                      children: [
                        //上一頁
                        Align(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                              icon: const Icon(Icons.arrow_back_rounded),
                              color: const Color.fromRGBO(255, 187, 0, 1),
                              iconSize: 57.0,
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            )),
                        //標題
                        Container(
                          alignment: Alignment.topCenter,
                          padding: const EdgeInsets.only(top: 8),
                          child: const Text(
                            '忘記密碼鎖',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 40,
                              color: Color.fromRGBO(160, 82, 45, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 50.0),
                  //信箱
                  TextFormField(
                    autofocus: false,
                    controller: _mailController,
                    decoration: const InputDecoration(
                      labelText: "信箱",
                      hintText: '請輸入信箱',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        ///設定邊框四個角的弧度
                        borderRadius: BorderRadius.all(Radius.circular(90)),

                        ///用來配置邊框的樣式
                        borderSide: BorderSide(
                          ///設定邊框的顏色
                          color: Color.fromRGBO(160, 82, 45, 1),
                          width: 2.0,
                        ),
                      ),
                      fillColor: Color.fromRGBO(255, 255, 255, 1),
                      filled: true,
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (email) =>
                        email != null && !EmailValidator.validate(email)
                            ? '請輸入正確的信箱格式'
                            : null,
                  ),
                  SizedBox(height: 10.0),
                  //傳送認證碼
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () => sendOTP(),
                        child: const Text(
                          '傳送認證碼',
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 20,
                            color: Color.fromRGBO(160, 82, 45, 1),
                          ),
                        )),
                  ),
                  SizedBox(height: 10.0),
                  //認證碼
                  TextFormField(
                    controller: _otpController,
                    decoration: const InputDecoration(
                      labelText: "認證碼",
                      hintText: '請輸入認證碼',
                      prefixIcon: Icon(Icons.password),
                      border: OutlineInputBorder(
                        ///設定邊框四個角的弧度
                        borderRadius: BorderRadius.all(Radius.circular(90)),

                        ///用來配置邊框的樣式
                        borderSide: BorderSide(
                          ///設定邊框的顏色
                          color: Color.fromRGBO(160, 82, 45, 1),
                          width: 2.0,
                        ),
                      ),
                      fillColor: Color.fromRGBO(255, 255, 255, 1),
                      filled: true,
                    ),
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isNotEmpty && value.length == 6) {
                        return null;
                      } else if (value.isNotEmpty && value.length < 6) {
                        return '認證碼為6數';
                      } else {
                        return '認證碼不得空白';
                      }
                    },
                  ),
                  SizedBox(height: 50.0),
                  //認證
                  SizedBox(
                    width: 200.0,
                    height: 60.0,
                    child: RaisedButton(
                      color: Color.fromRGBO(160, 82, 45, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.0)),
                      child: const Text(
                        '認證',
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 30,
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                        softWrap: false,
                      ),
                      onPressed: () {
                        final isValidForm = _formKey.currentState!.validate();
                        if (isValidForm) {
                          verifyOTP();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
