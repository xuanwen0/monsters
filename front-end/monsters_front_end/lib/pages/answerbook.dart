import 'dart:math';
import 'package:flutter/material.dart';

List<String> robotAnswers = [
  "不要忽略你看見的",
  "當然",
  "好",
  "不是很好",
  "不會失望的",
  "尋求支援",
  "僅此一次",
  "試了才知道",
  "試著妥協",
  "當局者迷旁觀者清",
  "思考後再問我",
  "前不著村，後不著店",
  "船到橋頭自然直",
  "有關係嗎",
  "結果會讓你驚訝",
  "主動一點",
  "認清現實吧",
  "天機不可洩漏",
  "不要讓自己後悔",
  "不要",
  "不可能",
  "那又如何",
  "想想未來",
  "做你想做的",
  "失敗又如何",
  "答案就在眼前",
  "不要浪費時間",
  "時機未至",
  "先解決必須的事",
  "去問專業的人",
  "是又如何",
  "時間會解決",
  "休息片刻",
  "給自己一點時間",
  "勇往直前",
  "不做無用之功",
  "將會成功",
  "這會很冒險",
  "真不了的假的",
  "假不了的真的",
  "不要太過分了",
  "斷捨離",
  "拭目以待",
  "盡全力了嗎",
  "見好就收",
  "我想想",
  "下次再說",
  "別人說了不算"
];
var numbersOfAnswers = robotAnswers.length;
String randomAnswer = "";
Random random = Random();

class AnswerbookPage extends StatefulWidget {
  @override
  _AnswerbookPageState createState() => _AnswerbookPageState();
}

class _AnswerbookPageState extends State<AnswerbookPage> {
  String datatochange = "";

  void changedata() {
    setState(() {
      datatochange = robotAnswers[random.nextInt(numbersOfAnswers)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text('看答案'),
            onPressed: changedata,
          ),
          Text(
            "$datatochange",
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      )),
    ));
  }
}
