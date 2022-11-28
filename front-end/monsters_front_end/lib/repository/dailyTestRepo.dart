// ignore_for_file: file_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:monsters_front_end/repository/annoyanceRepo.dart';

import '../API/dailyTestAPI.dart';

class DailyTestRepository implements DailyTestApiDataSource {
  final client = http.Client();
  @override
  Future<Map<String, dynamic>> searchDailyTest() {
    return _getDailyTest(Uri.parse('$domain/interaction/dailyTest'));
  }

  Future<Map<String, dynamic>> _getDailyTest(Uri url) async {
    final request =
        await client.get(url, headers: {'Content-type': 'application/json'});
    if (request.statusCode == 200) {
      Map<String, dynamic> dailyTest = jsonDecode(request.body);
      return Future.value(dailyTest);
    } else {
      Map<String, dynamic> dailyTest = jsonDecode(request.body);
      return dailyTest;
    }
  }
}
