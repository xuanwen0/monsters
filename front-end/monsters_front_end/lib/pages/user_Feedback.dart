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
        body: Column(
          children: [
            const Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("若有任何建議歡迎聯繫我們，\n請在下方輸入您的回饋！", style: Body1TextStyle),
            ),
            Container(
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                  border: Border.all(width: 1, color: Colors.white),
                ),
                child: TextFormField(
                    autofocus: false,
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: '請輸入回饋',
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
                      if (value!.length < 5) {
                        return '回饋至少五個字喔';
                      } else {
                        return null;
                      }
                    })),
            FlatButton(
                // onPressed: () => sendEmail(message: message),
                onPressed: () => sendEmail(message: _messageController.text),
                child: const Text("送出"))
          ],
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
