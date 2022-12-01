// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:monsters_front_end/repository/annoyanceRepo.dart';

import '../API/answerbookAPI.dart';

class AnswerbookRepository implements AnswerbookApiDataSource {
  final client = http.Client();
  // http://220.132.124.140:5000/interaction/answerBook
  @override
  Future<Map<String, dynamic>> searchAnswerbook() {
    return _getAnswerBook(Uri.parse('$domain/interaction/answerBook'));
  }

  Future<Map<String, dynamic>> _getAnswerBook(Uri url) async {
    final request =
        await client.get(url, headers: {'Content-type': 'application/json'});
    var str = request.body.toString();
    const start = "[";
    const end = "]";
    final startIndex = str.indexOf(start);
    final endIndex = str.indexOf(end, startIndex + start.length);
    var stringtoJson = str.substring(startIndex + start.length, endIndex);
    if (request.statusCode == 200) {
      Map<String, dynamic> answerBook = jsonDecode(stringtoJson);
      return Future.value(answerBook);
    } else {
      Map<String, dynamic> answerBook = jsonDecode(stringtoJson);
      return answerBook;
    }
  }
}
