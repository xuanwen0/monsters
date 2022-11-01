// ignore_for_file: file_names

import 'dart:convert';

class DailyTest {
  final int id;
  final String question;
  final String optionOne;
  final String optionTwo;
  final String optionThree;
  final String optionFour;
  final int answer;
  final String learn;

  DailyTest(
      {required this.id,
      required this.question,
      required this.optionOne,
      required this.optionTwo,
      required this.optionThree,
      required this.optionFour,
      required this.answer,
      required this.learn});

  DailyTest copyWith(
      {int? id,
      String? question,
      String? optionOne,
      String? optionTwo,
      String? optionThree,
      String? optionFour,
      int? answer,
      String? learn}) {
    return DailyTest(
        id: id ?? this.id,
        question: question ?? this.question,
        optionOne: optionOne ?? this.optionOne,
        optionTwo: optionTwo ?? this.optionTwo,
        optionThree: optionThree ?? this.optionThree,
        optionFour: optionFour ?? this.optionFour,
        answer: answer ?? this.answer,
        learn: learn ?? this.learn);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question': question,
      'optionOne': optionOne,
      'optionTwo': optionTwo,
      'optionThree': optionThree,
      'optionFour': optionFour,
      'answer': answer,
      'learn': learn
    };
  }

  factory DailyTest.fromMap(Map<String, dynamic> map) {
    return DailyTest(
        id: map['id'],
        question: map['question'],
        optionOne: map['optionOne'],
        optionTwo: map['optionTwo'],
        optionThree: map['optionThree'],
        optionFour: map['optionFour'],
        answer: map['answer'],
        learn: map['learn']);
  }

  String toJson() {
    return json.encode(toMap());
  }

  factory DailyTest.fromJson(String source) =>
      DailyTest.fromMap(json.decode(source));

  @override
  String toString() =>
      'DailyTest(id: $id, question: $question, optionOne: $optionOne, optionTwo: $optionTwo, optionThree: $optionThree, optionFour: $optionFour, answer: $answer, learn: $learn)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DailyTest &&
        other.id == id &&
        other.question == question &&
        other.optionOne == optionOne &&
        other.optionTwo == optionTwo &&
        other.optionThree == optionThree &&
        other.optionFour == optionFour &&
        other.answer == answer &&
        other.learn == learn;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      question.hashCode ^
      optionOne.hashCode ^
      optionTwo.hashCode ^
      optionThree.hashCode ^
      optionFour.hashCode ^
      answer.hashCode ^
      learn.hashCode;
}
