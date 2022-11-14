import 'package:flutter/material.dart';
import 'package:monsters_front_end/pages/home.dart';
import 'package:monsters_front_end/pages/style.dart';
import 'package:url_launcher/url_launcher_string.dart';

class FirstTime_editUserInfo extends StatefulWidget {
  @override
  _FirstTime_editUserInfoState createState() => _FirstTime_editUserInfoState();
}

class _FirstTime_editUserInfoState extends State<FirstTime_editUserInfo> {
  // final TextEditingController _pwdController = TextEditingController();
  // final TextEditingController _checkpwdController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();

  //生日
  DateTime date = DateTime.now();
  bool isCheck = false;
  bool read = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    //標題
                    const Text(
                      '初次設定個人資料',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 40,
                        color: Color.fromRGBO(160, 82, 45, 1),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    //暱稱
                    TextFormField(
                        style: const TextStyle(color: Colors.black),
                        autofocus: false,
                        controller: _nicknameController,
                        decoration: const InputDecoration(
                          labelText: "暱稱",
                          hintText: '請輸入暱稱',
                          prefixIcon: Icon(Icons.person_pin),
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
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            return null;
                          } else {
                            return '暱稱不得空白';
                          }
                        }),
                    const SizedBox(height: 30.0),
                    //生日
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '生日  :',
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 30,
                            color: BackgroundColorWarm,
                          ),
                          softWrap: false,
                        ),
                        SizedBox(width: 5.0),
                        TextButton.icon(
                          onPressed: () async {
                            DateTime? newDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100),
                            );
                            if (newDate == null) return;
                            setState(() => date = newDate);
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
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    //使用條款與隱私權政策
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                            value: isCheck,
                            onChanged: (value) {
                              if (read) {
                                setState(() {
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
                    ),
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
                        onPressed: () {
                          final isValidForm = _formKey.currentState!.validate();
                          if (isValidForm) {
                            if (read) {
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
        )));
  }
}
