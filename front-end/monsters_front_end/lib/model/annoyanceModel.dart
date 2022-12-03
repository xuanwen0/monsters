// ignore_for_file: file_names

import 'dart:convert';
import 'dart:io';

Data annoyanceFromJson(String str) => Data.fromJson(json.decode(str));

String annoyanceToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    required this.data,
    required this.result,
    required this.errorCode,
    required this.message,
  });

  List<Annoyance> data;
  bool result;
  String errorCode;
  String message;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        data: List<Annoyance>.from(
            json["data"].map((x) => Annoyance.fromJson(x))),
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

class Annoyance {
  int? id;
  String? account;
  String? content;
  int? type;
  int? monsterId;
  String? mood;
  int? index;
  String? time;
  int? solve;
  int? share;
  File? contentFile;
  File? moodFile;
  Annoyance(
      {this.id,
      this.account,
      this.content,
      this.type,
      this.monsterId,
      this.mood,
      this.index,
      this.time,
      this.solve,
      this.share,
      this.contentFile,
      this.moodFile});

  factory Annoyance.fromJson(Map<String, dynamic> json) => Annoyance(
        id: json['id'],
        account: json['account'],
        content: json['content'],
        type: json['type'],
        monsterId: json['monsterId'],
        mood: json['mood'],
        index: json['index'],
        time: json['time'],
        solve: json['solve'],
        share: json['share'],
        contentFile: json['contentFile'],
        moodFile: json['moodFile'],
      );
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['account'] = account;
    data['content'] = content;
    data['type'] = type;
    data['monsterId'] = monsterId;
    data['mood'] = mood;
    data['index'] = index;
    data['time'] = time;
    data['solve'] = solve;
    data['share'] = share;
    data['contentFile'] = contentFile;
    data['moodFile'] = moodFile;
    return data;
  }

  String toString() {
    return "{account:$account,id: $id,account: $account,content: $content, type: $type, monsterId: $monsterId, mood: $mood, index: $index, time: $time, solve: $solve, share: $share, contentFile: $contentFile, moodFile: $moodFile}}";
  }
}
