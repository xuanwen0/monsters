// ignore_for_file: file_names

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../API/answerbookAPI.dart';

class AnswerbookRepository implements AnswerbookApiDataSource {
  final client = http.Client();
  final String domain = "http://10.0.2.2:8080";
  @override
  Future<Map<String, dynamic>> searchAnswerbook() {
    return _getAnswerBook(Uri.parse('$domain/answerBook/search'));
  }

  Future<Map<String, dynamic>> _getAnswerBook(Uri url) async {
    final request =
        await client.get(url, headers: {'Content-type': 'application/json'});
    if (request.statusCode == 200) {
      Map<String, dynamic> answerBook = jsonDecode(request.body);
      return Future.value(answerBook);
    } else {
      Map<String, dynamic> answerBook = jsonDecode(request.body);
      return answerBook;
    }
  }
}