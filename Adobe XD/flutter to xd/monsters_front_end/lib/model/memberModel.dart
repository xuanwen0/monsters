// ignore_for_file: file_names

import 'dart:convert';

Data memberFromJson(String str) => Data.fromJson(json.decode(str));

String memberToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    required this.data,
    required this.result,
    required this.errorCode,
    required this.message,
  });

  List<Member> data;
  bool result;
  String errorCode;
  String message;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        data: List<Member>.from(json["data"].map((x) => Member.fromJson(x))),
        result: json["result"],
        errorCode: json["errorCode"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "result": result,
        "errorCode": errorCode,
        "message": message,
      };
}

class Member {
  Member({
    required this.account,
    required this.password,
    required this.birthday,
    required this.name,
    required this.nick_name,
    required this.gender,
    required this.mail,
    this.lock,
    this.photo,
    this.theme,
  });

  String account;
  String password;
  String birthday;
  String name;
  String nick_name;
  int? gender;
  String mail;
  String? lock;
  String? photo;
  int? theme;

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        account: json["account"],
        password: json["password"],
        birthday: json["birthday"],
        name: json["name"],
        nick_name: json["nick_name"],
        gender: json["gender"],
        mail: json["mail"],
        lock: json["lock"],
        photo: json["photo"],
        theme: json["theme"],
      );

  Map<String, dynamic> toJson() => {
        "account": account,
        "password": password,
        "birthday": birthday,
        "name": name,
        "nick_name": nick_name,
        "gender": gender,
        "mail": mail,
        "lock": lock,
        "photo": photo,
        "theme": theme,
      };
}
