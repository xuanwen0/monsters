import 'package:flutter/material.dart';
import 'dart:developer' as dv;
import 'package:monsters_front_end/main.dart';
import 'package:monsters_front_end/model/memberModel.dart';

import 'package:monsters_front_end/repository/memberRepo.dart';

class Edit_personalInfo extends StatefulWidget {
  var data;
  Edit_personalInfo({required this.data});

  @override
  _Edit_personalInfoState createState() => _Edit_personalInfoState(data);
}

class _Edit_personalInfoState extends State<Edit_personalInfo> {
  final TextEditingController _nicknameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final MemberRepository memberRepository = MemberRepository();
  var data;
  _Edit_personalInfoState(this.data);

  @override
  Widget build(BuildContext context) {
    dv.log(data.toString());

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xfffffed4),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 150),
                              //標題
                              const Text(
                                '編輯個人資料',
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
                                  controller: _nicknameController,
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
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if (value!.isNotEmpty) {
                                      return null;
                                    } else {
                                      return '暱稱不得空白';
                                    }
                                  }),
                              SizedBox(height: 30.0),
                              //儲存or取消
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: 150.0,
                                    height: 50.0,
                                    child: RaisedButton(
                                      color: Color.fromRGBO(160, 82, 45, 1),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(22.0)),
                                      child: const Text(
                                        '儲存',
                                        style: TextStyle(
                                          fontFamily: 'Segoe UI',
                                          fontSize: 30,
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1),
                                        ),
                                        softWrap: false,
                                      ),
                                      onPressed: () {
                                        final isValidForm =
                                            _formKey.currentState!.validate();
                                        if (isValidForm) {
                                          final MemberRepository
                                              memberRepository =
                                              MemberRepository();

                                          memberRepository.modifyPersonalInfo(
                                            Member(
                                              account: user_Account,
                                              nickName:
                                                  _nicknameController.text.toString(),
                                            ),
                                          );

                                          // ScaffoldMessenger.of(context)
                                          //     .showSnackBar(const SnackBar(
                                          //         duration:
                                          //             Duration(seconds: 1),
                                          //         backgroundColor:
                                          //             BackgroundColorWarm,
                                          //         content: Text(
                                          //           "儲存成功",
                                          //           style: TextStyle(
                                          //               color: Colors.white,
                                          //               fontSize: 30),
                                          //         )));

                                          // Navigator.of(context).pop();
                                        }
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 150.0,
                                    height: 50.0,
                                    child: RaisedButton(
                                      color: Color.fromRGBO(160, 82, 45, 1),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(22.0)),
                                      child: const Text(
                                        '取消',
                                        style: TextStyle(
                                          fontFamily: 'Segoe UI',
                                          fontSize: 30,
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1),
                                        ),
                                        softWrap: false,
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                    )))));
  }
}
