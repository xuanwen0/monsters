import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:monsters_front_end/main.dart';
import 'package:monsters_front_end/model/memberModel.dart';
import 'package:monsters_front_end/pages/home.dart';
import 'package:monsters_front_end/pages/style.dart';
import 'package:monsters_front_end/repository/memberRepo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher_string.dart';

class FirstTime_editUserInfo extends StatefulWidget {
  FirstTime_editUserInfo({Key? key, required this.user}) : super(key: key);
  final GoogleSignInAccount user;

  @override
  _FirstTime_editUserInfoState createState() =>
      _FirstTime_editUserInfoState(user);
}

class _FirstTime_editUserInfoState extends State<FirstTime_editUserInfo> {
  final TextEditingController _nicknameController = TextEditingController();
  //生日
  DateTime date = DateTime.now();
  final GoogleSignInAccount user;
  StateSetter? BirthDayState;
  StateSetter? CheckState;
  _FirstTime_editUserInfoState(this.user);

  bool isCheck = false;
  bool read = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final MemberRepository memberRepository = MemberRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xfffffed4),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
          children: [
            Form(
              key: _formKey,
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      //標題
                      const Text(
                        '首次Google登入\n設定個人資料',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 40,
                          color: Color.fromRGBO(160, 82, 45, 1),
                        ),
                      ),
                      const SizedBox(height: 50.0),
                      //暱稱
                      TextFormField(
                          style: const TextStyle(color: Colors.black),
                          autofocus: false,
                          controller: _nicknameController
                            ..text = user.displayName!,
                          decoration: const InputDecoration(
                            labelText: "暱稱",
                            hintText: '請輸入暱稱',
                            prefixIcon: Icon(Icons.person_pin),
                            border: OutlineInputBorder(
                              ///設定邊框四個角的弧度
                              borderRadius:
                                  BorderRadius.all(Radius.circular(90)),

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
                          validator: (value) {
                            if (value!.isNotEmpty) {
                              return null;
                            } else {
                              return '暱稱不得空白';
                            }
                          }),
                      const SizedBox(height: 40.0),
                      //生日
                      StatefulBuilder(builder:
                          (BuildContext context, StateSetter setState) {
                        BirthDayState = setState;
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '生日  :',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: BackgroundColorWarm,
                              ),
                              softWrap: false,
                            ),
                            const SizedBox(width: 10.0),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                    width: 3, color: const Color(0xffa0522d)),
                              ),
                              child: TextButton.icon(
                                onPressed: () async {
                                  DateTime? newDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2100),
                                  );
                                  if (newDate == null) return;
                                  BirthDayState!(() => date = newDate);
                                },
                                icon: Icon(
                                  Icons.calendar_month,
                                  color: Colors.grey[700],
                                  size: 30,
                                ),
                                label: Text(
                                  '${date.year}/${date.month}/${date.day}',
                                  style: const TextStyle(
                                    fontFamily: 'Segoe UI',
                                    fontSize: 30,
                                    color: Colors.black,
                                  ),
                                  softWrap: false,
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                      const SizedBox(height: 40.0),
                      //使用條款與隱私權政策
                      StatefulBuilder(builder:
                          (BuildContext context, StateSetter setState) {
                        CheckState = setState;
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                                value: isCheck,
                                onChanged: (value) {
                                  if (read) {
                                    CheckState!(() {
                                      isCheck = value!;
                                    });
                                  }
                                }),
                            Text(
                              '同意遵守',
                              style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 20,
                                color: Colors.grey[700],
                              ),
                              softWrap: false,
                            ),
                            TextButton(
                                onPressed: () {
                                  launchUrlString(
                                      "https://docs.google.com/document/d/1XD3QLIDcEqYx2Zy9F0QHipRkf6KpcblE/edit?usp=share_link&ouid=100075254026289201699&rtpof=true&sd=true");
                                  read = true;
                                  setState(() {});
                                },
                                child: const Text(
                                  '使用條款',
                                  style: TextStyle(
                                    fontFamily: 'Segoe UI',
                                    fontSize: 20,
                                    color: Colors.blueAccent,
                                  ),
                                  softWrap: false,
                                )),
                          ],
                        );
                      }),
                      const SizedBox(height: 20.0),
                      //完成按鈕
                      SizedBox(
                        width: 150.0,
                        height: 50.0,
                        child: RaisedButton(
                          color: Color.fromRGBO(160, 82, 45, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22.0)),
                          child: const Text(
                            '完成',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 30,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                            softWrap: false,
                          ),
                          onPressed: () async {
                            final isValidForm =
                                _formKey.currentState!.validate();
                            if (isValidForm) {
                              if (read) {
                                memberRepository.createMember(
                                  Member(
                                    account: user.email,
                                    birthday: formatDate(
                                            date, [yyyy, '-', mm, '-', dd])
                                        .toString(),
                                    mail: user.email,
                                    nick_name: _nicknameController.text,
                                    password: "",
                                  ),
                                );
                                saveGoogleLogin(user.email);
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MainPage()));
                              }
                            }
                          },
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ))));
  }

  void saveGoogleLogin(String account) async {
    //儲存account shared preferences (後用來判斷此裝置是否登入過)
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("googleLogin", account);
    user_Account = account;
  }
}
