// ignore_for_file: file_names

import 'dart:convert';

import 'dart:io';

Data diaryFromJson(String str) => Data.fromJson(json.decode(str));

String diaryToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    required this.data,
    required this.result,
    required this.errorCode,
    required this.message,
  });

  List<Diary> data;
  bool result;
  String errorCode;
  String message;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        data: List<Diary>.from(json["data"].map((x) => Diary.fromJson(x))),
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

class Diary {
  int? id;
  String? account;
  String? content;
  int? index;
  String? time;
  int? share;
  File? contentFile;
  Diary({
    this.id,
    this.account,
    this.content,
    this.index,
    this.time,
    this.share,
    this.contentFile,
  });

  factory Diary.fromJson(Map<String, dynamic> json) => Diary(
        id: json['id'],
        account: json['account'],
        content: json['content'],
        index: json['index'],
        time: json['time'],
        share: json['share'],
        contentFile: json['contentFile'],
      );
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['account'] = account;
    data['content'] = content;
    data['index'] = index;
    data['time'] = time;
    data['share'] = share;
    data['contentFile'] = contentFile;
    return data;
  }
}
