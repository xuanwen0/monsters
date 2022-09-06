import 'dart:convert';

import 'package:adobe_xd/page_link.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

import 'package:http/http.dart' as http;
import 'package:monsters_front_end/pages/login.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monsters_front_end/pages/login_selfacount.dart';
import 'package:monsters_front_end/repository/memberRepo.dart';

import '../model/memberModel.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final TextEditingController _checkpwdController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  //性別 0:男 1:女
  int groupValue = 0;
  //生日
  DateTime date = DateTime.now();
  //條款
  bool isCheck = false;

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
                    //上一頁
                    Align(
                      alignment: Alignment.topLeft,
                      child:
                          // Adobe XD layer: 'Icon ionic-md-arrow…' (shape)
                          PageLink(
                        links: [
                          PageLinkInfo(
                            transition: LinkTransition.Fade,
                            ease: Curves.easeOut,
                            duration: 0.3,
                            pageBuilder: () => LoginPage(),
                          ),
                        ],
                        child: SvgPicture.string(
                          _svg_ryq30,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    //標題
                    Text(
                      '註冊',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 47,
                        color: Color.fromRGBO(160, 82, 45, 1),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    //帳號
                    TextFormField(
                      autofocus: false,
                      controller: _accountController,
                      decoration: const InputDecoration(
                        labelText: "帳號",
                        hintText: '請輸入帳號',
                        prefixIcon: Icon(Icons.person),
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
                        if (value!.isNotEmpty && value.length > 5) {
                          return null;
                        } else if (value.isNotEmpty && value.length < 6) {
                          return '帳號需至少6數';
                        } else {
                          return '帳號不得空白';
                        }
                      },
                    ),
                    SizedBox(height: 10.0),
                    //密碼
                    TextFormField(
                        controller: _pwdController,
                        decoration: const InputDecoration(
                          labelText: "密碼",
                          hintText: '請輸入密碼',
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
                          if (value!.isNotEmpty && value.length > 5) {
                            return null;
                          } else if (value.isNotEmpty && value.length < 6) {
                            return '密碼需至少6數';
                          } else {
                            return '密碼不得空白';
                          }
                        }),
                    SizedBox(height: 10.0),
                    //確認密碼
                    TextFormField(
                        autofocus: false,
                        controller: _checkpwdController,
                        decoration: const InputDecoration(
                          labelText: "確認密碼",
                          hintText: '請再次輸入密碼',
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
                          if (value!.isEmpty) {
                            return '確認密碼不得空白';
                          } else if (value.isNotEmpty && value.length < 6) {
                            return '確認密碼需至少6數';
                          } else if (value == _pwdController.text) {
                            return null;
                          } else {
                            return '與密碼不一致';
                          }
                        }),
                    SizedBox(height: 10.0),
                    //email
                    TextFormField(
                      autofocus: false,
                      controller: _mailController,
                      decoration: const InputDecoration(
                        labelText: "信箱",
                        hintText: '請輸入信箱',
                        prefixIcon: Icon(Icons.mail),
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
                    //全名
                    TextFormField(
                        autofocus: false,
                        controller: _fullnameController,
                        decoration: const InputDecoration(
                          labelText: "全名",
                          hintText: '請輸入全名',
                          prefixIcon: Icon(Icons.person_outline_rounded),
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
                          if (value!.isNotEmpty && value.length > 1) {
                            return null;
                          } else if (value.isNotEmpty && value.length < 2) {
                            return '請輸入全名';
                          } else {
                            return '全名不得空白';
                          }
                        }),
                    SizedBox(height: 10.0),
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
                    SizedBox(height: 10.0),
                    //生日
                    Row(
                      children: [
                        Text(
                          '生日  :',
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 20,
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
                          ),
                          label: Text(
                            '${date.year}/${date.month}/${date.day}',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 20,
                              color: Color.fromRGBO(160, 82, 45, 1),
                            ),
                            softWrap: false,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    //性別
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "性別  :",
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 20,
                            color: Colors.grey[700],
                          ),
                          softWrap: false,
                        )),
                    SizedBox(height: 5.0),
                    Row(children: [
                      Expanded(
                        child: RadioListTile<int>(
                          contentPadding: EdgeInsets.all(0.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          tileColor: Colors.grey[200],
                          value: 0,
                          groupValue: groupValue,
                          onChanged: (value) {
                            setState(() {
                              groupValue = value!;
                            });
                          },
                          secondary: Icon(
                            Icons.male,
                            color: Color.fromRGBO(160, 82, 45, 1),
                          ),
                          title: const Text(
                            "男",
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 18,
                              color: Color.fromRGBO(160, 82, 45, 1),
                            ),
                            softWrap: false,
                          ),
                          dense: true,
                          activeColor:
                              Color.fromRGBO(160, 82, 45, 1), // 指定選中時勾選框的顏色
                          selected: false,
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Expanded(
                        child: RadioListTile<int>(
                          contentPadding: EdgeInsets.all(0.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          value: 1,
                          groupValue: groupValue,
                          tileColor: Colors.grey[200],
                          onChanged: (value) {
                            setState(() {
                              groupValue = value!;
                            });
                          },
                          secondary: Icon(
                            Icons.female,
                            color: Color.fromRGBO(160, 82, 45, 1),
                          ),
                          title: const Text(
                            "女",
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 18,
                              color: Color.fromRGBO(160, 82, 45, 1),
                            ),
                            softWrap: false,
                          ),
                          dense: true,
                          activeColor:
                              Color.fromRGBO(160, 82, 45, 1), // 指定選中時勾選框的顏色
                        ),
                      ),
                    ]),
                    SizedBox(height: 10.0),
                    //使用條款與隱私權政策
                    Row(
                      children: [
                        Checkbox(
                            value: isCheck,
                            onChanged: (value) {
                              setState(() {
                                isCheck = value!;
                              });
                            }),
                        Text(
                          '同意遵守',
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 15,
                            color: Colors.grey[700],
                          ),
                          softWrap: false,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              '使用條款',
                              style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 15,
                                color: Colors.blueAccent,
                              ),
                              softWrap: false,
                            )),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    //註冊
                    SizedBox(
                      width: 200.0,
                      height: 60.0,
                      child: RaisedButton(
                        color: Color.fromRGBO(160, 82, 45, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22.0)),
                        child: const Text(
                          '註冊',
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
                            signUp();
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 20.0),
                    //登入
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: TextButton(
                        child: const Text(
                          "已經有帳號了嗎?  登入",
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 20,
                            color: Color.fromRGBO(160, 82, 45, 1),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Login_selfacount()));
                        },
                      ),
                    ),
                  ],
                )),
          ),
        )));
  }

  void signUp() async {
    //註冊功能 !!尚未完成!!
    if (isCheck == true) {
      memberRepository.createMember(
        Member(
          account: _accountController.text,
          birthday: date.toString(),
          gender: groupValue,
          mail: _mailController.text,
          name: _fullnameController.text,
          nick_name: _nicknameController.text,
          password: _pwdController.text,
        ),
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Login_selfacount()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("請詳細閱讀使用條款，並勾選同意。")));
    }
  }
}

const String _svg_ryq30 =
    '<svg viewBox="13.7 21.9 45.6 41.1" ><path transform="translate(8.07, 15.61)" d="M 47.28736877441406 22.92952919006348 L 19.54702568054199 22.92952919006348 L 30.30613327026367 13.09178352355957 C 31.84870529174805 11.54302215576172 31.84870529174805 9.040220260620117 30.30613327026367 7.491456031799316 C 28.76356315612793 5.942692756652832 26.26174545288086 5.942692756652832 24.70621109008789 7.491456031799316 L 6.791648864746094 24.09420013427734 C 6.013882637023926 24.81282615661621 5.624999046325684 25.79164695739746 5.624999046325684 26.86958694458008 L 5.624999046325684 26.91914939880371 C 5.624999046325684 27.99708938598633 6.013882637023926 28.97590446472168 6.791648864746094 29.69453430175781 L 24.69325065612793 46.29727935791016 C 26.24878120422363 47.84604263305664 28.75060272216797 47.84604263305664 30.29317092895508 46.29727935791016 C 31.83573913574219 44.74851226806641 31.83573913574219 42.2457160949707 30.29317092895508 40.69694900512695 L 19.5340633392334 30.85920524597168 L 47.27440643310547 30.85920524597168 C 49.46512222290039 30.85920524597168 51.24102020263672 29.08742141723633 51.24102020263672 26.89437294006348 C 51.25398254394531 24.66414642333984 49.47808074951172 22.92952919006348 47.28736877441406 22.92952919006348 Z" fill="#ffbb00" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
