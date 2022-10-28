import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:monsters_front_end/pages/style.dart';
import 'package:http/http.dart' as http;

class user_Feedback extends StatefulWidget {
  user_Feedback({
    Key? key,
  }) : super(key: key);
  @override
  _user_FeedbackState createState() => _user_FeedbackState();
}

class _user_FeedbackState extends State<user_Feedback> {
  final TextEditingController _messageController = TextEditingController();
  bool warning = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String message = '';
    return Scaffold(
        backgroundColor: const Color(0xfffffed4),
        appBar: secondAppBar("使用回饋"),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
                child: Text("有任何寶貴意見可以寫在下方，\n幫助我們改善貘nsters ！",
                    style: Body1TextStyle),
              ),
              Container(
                  height: 15 * 24.0,
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    border: Border.all(width: 8, color: BackgroundColorSoft),
                  ),
                  child: TextFormField(
                      textInputAction: TextInputAction.done,
                      maxLines: null,
                      autofocus: false,
                      controller: _messageController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: '輸入至少五個字',
                        fillColor: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.length < 5) {
                          return '回饋至少五個字喔';
                        } else {
                          return null;
                        }
                      })),
              const SizedBox(height: 30),
              FlatButton(
                  minWidth: 150,
                  height: 60,
                  color: Color.fromRGBO(255, 237, 151, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9999.0)),
                  // onPressed: () => sendEmail(message: _messageController.text),
                  onPressed: () => print(_messageController.text),
                  //是否第一次按(按鈕文字)
                  child: const Text(
                    '送出',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 36,
                      color: Color(0xffa0522d),
                    ),
                    softWrap: false,
                  ))
            ],
          ),
        ));
  }

  Future sendEmail({required String message}) async {
    if (_messageController.text.length < 5) {
      return;
    }
    String email = "tony960281@gmail.com";
    String name = "tester";
    const serviceId = "service_iexyh7q";
    const templateId = "template_00dj57j";
    const userId = "x0TtUpsa7W7aHFIbl";
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    print(message);
    print(email);
    final response = await http.post(url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json'
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'accessToken': "9OoipUoZgha107DzjjE3w",
          'template_params': {
            'user_name': name,
            'user_email': email,
            'user_message': message
          }
        }));

    print(response.body);
  }
}
