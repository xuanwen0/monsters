// ignore_for_file: file_names

import 'dart:convert';

Data mindGameFromJson(String str) => Data.fromJson(json.decode(str));

String mindGameToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    required this.data,
    required this.result,
    required this.errorCode,
    required this.message,
  });

  List<MindGame> data;
  bool result;
  String errorCode;
  String message;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        data:
            List<MindGame>.from(json["data"].map((x) => MindGame.fromJson(x))),
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

class MindGame {
  MindGame({required this.id, required this.name, required this.web});

  int id;
  String name;
  String web;

  factory MindGame.fromJson(Map<String, dynamic> json) =>
      MindGame(id: json["id"], name: json["name"], web: json["web"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name, "web": web};
}
