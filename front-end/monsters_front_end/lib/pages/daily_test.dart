import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:monsters_front_end/pages/dailyTest_correct.dart';
import 'package:monsters_front_end/pages/dailyTest_wrong.dart';
import 'package:monsters_front_end/pages/style.dart';
import 'package:monsters_front_end/repository/dailyTestRepo.dart';

import 'package:monsters_front_end/model/dailyTestModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Daily_test extends StatefulWidget {
  @override
  _Daily_testState createState() => _Daily_testState();
}

class _Daily_testState extends State<Daily_test> {
  late Future _future;
  var dailyQuesion_ID = 0;
  var daily_question = "question";
  var daily_A = "choose A";
  var daily_B = "choose B";
  var daily_C = "choose C";
  var daily_D = "choose D";
  var correctChoice = 0;
  var learn = "";

  checkAnswer(int userChoice, String userAnswer) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("LastTryDate", DateTime.now().day.toString());
    if (correctChoice == userChoice) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => DailyTest_correct(learn)));
    } else {
      var showChoice;
      var showAnswer;
      if (correctChoice == 1) {
        showChoice = "A";
        showAnswer = daily_A;
      }
      if (correctChoice == 2) {
        showChoice = "B";
        showAnswer = daily_B;
      }
      if (correctChoice == 3) {
        showChoice = "C";
        showAnswer = daily_C;
      }
      if (correctChoice == 4) {
        showChoice = "D";
        showAnswer = daily_D;
      }
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  DailyTest_wrong(showChoice, showAnswer, learn)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColorLight,
      appBar: secondAppBar("每日測驗"),
      body: Container(
        color: BackgroundColorLight,
        padding: const EdgeInsets.fromLTRB(30, 50, 30, 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //題目框
            Expanded(
              flex: 30,
              child: FutureBuilder<dynamic>(
                  future: _future,
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (correctChoice == 0) {
                      //正在讀取資料庫資料
                      return const Center(
                          child: Text(
                        "Loading...",
                        style: TextStyle(fontSize: 30),
                      ));
                    }
                    return Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30.0)),
                        border: Border.all(width: 1, color: Colors.white),
                      ),
                      child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Text(
                                daily_question,
                                style: const TextStyle(
                                    color: BackgroundColorWarm, fontSize: 24),
                              ))),
                    );
                  }),
            ),
            answerBox(option: 1, choice: "A", text: daily_A),
            answerBox(option: 2, choice: "B", text: daily_B),
            answerBox(option: 3, choice: "C", text: daily_C),
            answerBox(option: 4, choice: "D", text: daily_D),
          ],
        ),
      ),
    );
  }

  answerBox({
    required int option,
    required String choice,
    required String text,
  }) {
    return Expanded(
      flex: 15,
      child: GestureDetector(
        onTap: () => checkAnswer(option, text),
        child: Row(
          children: [
            Expanded(
              //circle
              flex: 25,
              child: Stack(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      choice,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 25, color: BackgroundColorWarm),
                    ),
                  ),
                ],
              ),
            ),
            //選項敘述
            Expanded(
              flex: 75,
              child: Container(
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(30.0),
                      right: Radius.circular(30.0)),
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, color: BackgroundColorWarm),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //初始化
  @override
  void initState() {
    _future = getRandomDailyTest();
    super.initState();
  }

  getRandomDailyTest() async {
    final DailyTestRepository dailyTestRepository = DailyTestRepository();
    Future<DailyTest> dailyTest = dailyTestRepository
        .searchDailyTest()
        .then((value) => DailyTest.fromMap(value));

    dailyTest.then((value) {
      dailyQuesion_ID = value.id;
      daily_question = value.question;
      daily_A = value.optionOne;
      daily_B = value.optionTwo;
      daily_C = value.optionThree;
      daily_D = value.optionFour;
      correctChoice = value.answer;
      learn = value.learn;
    }).then((value) => setState(() {}));
  }
}

const String _svg_ryq30 =
    '<svg viewBox="13.7 21.9 45.6 41.1" ><path transform="translate(8.07, 15.61)" d="M 47.28736877441406 22.92952919006348 L 19.54702568054199 22.92952919006348 L 30.30613327026367 13.09178352355957 C 31.84870529174805 11.54302215576172 31.84870529174805 9.040220260620117 30.30613327026367 7.491456031799316 C 28.76356315612793 5.942692756652832 26.26174545288086 5.942692756652832 24.70621109008789 7.491456031799316 L 6.791648864746094 24.09420013427734 C 6.013882637023926 24.81282615661621 5.624999046325684 25.79164695739746 5.624999046325684 26.86958694458008 L 5.624999046325684 26.91914939880371 C 5.624999046325684 27.99708938598633 6.013882637023926 28.97590446472168 6.791648864746094 29.69453430175781 L 24.69325065612793 46.29727935791016 C 26.24878120422363 47.84604263305664 28.75060272216797 47.84604263305664 30.29317092895508 46.29727935791016 C 31.83573913574219 44.74851226806641 31.83573913574219 42.2457160949707 30.29317092895508 40.69694900512695 L 19.5340633392334 30.85920524597168 L 47.27440643310547 30.85920524597168 C 49.46512222290039 30.85920524597168 51.24102020263672 29.08742141723633 51.24102020263672 26.89437294006348 C 51.25398254394531 24.66414642333984 49.47808074951172 22.92952919006348 47.28736877441406 22.92952919006348 Z" fill="#ffbb00" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
