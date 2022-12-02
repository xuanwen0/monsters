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
  String? account;
  String? password;
  String? birthday;
  String? nickName;
  String? mail;
  String? lock;
  String? photo;
  int? dailyTest;

  Member(
      {required this.account,
      this.password,
      this.birthday,
      this.mail,
      this.nickName,
      this.lock,
      this.photo,
      this.dailyTest});

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        account: json['account'],
        birthday: json['birthday'],
        mail: json['mail'],
        nickName: json['nickName'],
        password: json['password'],
        lock: json['lock'],
        photo: json['photo'],
        dailyTest: json['dailyTest'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['account'] = account;
    data['birthday'] = birthday;
    data['mail'] = mail;
    data['nickName'] = nickName;
    data['password'] = password;
    data['lock'] = lock;
    data['photo'] = photo;
    data['dailyTest'] = dailyTest;
    return data;
  }
}
