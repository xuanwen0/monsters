// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:monsters_front_end/repository/annoyanceRepo.dart';

import '../API/answerbookAPI.dart';

class AnswerbookRepository implements AnswerbookApiDataSource {
  final client = http.Client();
  @override
  Future<Map<String, dynamic>> searchAnswerbook() {
    return _getAnswerBook(Uri.parse('$domain/interaction/answerBook'));
  }

  Future<Map<String, dynamic>> _getAnswerBook(Uri url) async {
    final request =
        await client.get(url, headers: {'Content-type': 'application/json'});
    log("*" * 20);
    log("answerBook status");
    log("status: " + request.statusCode.toString());
    log("*" * 20);
    if (request.statusCode == 200) {
      Map<String, dynamic> answerBook = jsonDecode(request.body);
      return Future.value(answerBook);
    } else {
      Map<String, dynamic> answerBook = jsonDecode(request.body);
      return answerBook;
    }
  }
}
