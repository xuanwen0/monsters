import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';
import 'package:monsters_front_end/pages/drawer_personalInfo.dart';
import 'package:monsters_front_end/pages/home.dart';

import 'package:monsters_front_end/repository/memberRepo.dart';

class Edit_personalInfo extends StatefulWidget {
  @override
  _Edit_personalInfoState createState() => _Edit_personalInfoState();
}

class _Edit_personalInfoState extends State<Edit_personalInfo> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();

  //生日
  DateTime date = DateTime.now();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final MemberRepository memberRepository = MemberRepository();

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
                    const SizedBox(height: 150),
                    //標題
                    const Text(
                      '編輯個人資料',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 47,
                        color: Color.fromRGBO(160, 82, 45, 1),
                      ),
                    ),
                    const SizedBox(height: 70.0),
                    //暱稱
                    TextFormField(
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
                    SizedBox(height: 20.0),
                    //生日
                    Row(
                      children: [
                        Text(
                          '生日  :',
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 30,
                            color: Colors.grey[700],
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
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 30,
                              color: Color.fromRGBO(160, 82, 45, 1),
                            ),
                            softWrap: false,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50.0),
                    //儲存or取消
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 150.0,
                          height: 50.0,
                          child: RaisedButton(
                            color: Color.fromRGBO(160, 82, 45, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22.0)),
                            child: const Text(
                              '儲存',
                              style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 30,
                                color: Color.fromRGBO(255, 255, 255, 1),
                              ),
                              softWrap: false,
                            ),
                            onPressed: () {
                              final isValidForm =
                                  _formKey.currentState!.validate();
                              if (isValidForm) {
                                // ScaffoldMessenger.of(context).showSnackBar(
                                //     SnackBar(content: Text("儲存成功")));
                                Navigator.of(context).pop();
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
                                borderRadius: BorderRadius.circular(22.0)),
                            child: const Text(
                              '取消',
                              style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 30,
                                color: Color.fromRGBO(255, 255, 255, 1),
                              ),
                              softWrap: false,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          ),
        )));
  }
}
