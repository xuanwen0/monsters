// ignore_for_file: file_names

import 'dart:convert';

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
  Annoyance({
    required this.id,
    required this.account,
    required this.content,
    required this.type,
    required this.monsterId,
    required this.mood,
    required this.index,
    required this.time,
    required this.solve,
    required this.share,
  });

  int id;
  String account;
  String content;
  int type;
  int monsterId;
  String mood;
  int index;
  String time;
  int solve;
  int share;

  factory Annoyance.fromJson(Map<String, dynamic> json) => Annoyance(
        id: json["id"],
        account: json["account"],
        content: json["content"],
        type: json["type"],
        monsterId: json["monsterId"],
        mood: json["mood"],
        index: json["index"],
        time: json["time"],
        solve: json["solve"],
        share: json["share"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "account": account,
        "content": content,
        "type": type,
        "monsterId": monsterId,
        "mood": mood,
        "index": index,
        "time": time,
        "solve": solve,
        "share": share,
      };
}
