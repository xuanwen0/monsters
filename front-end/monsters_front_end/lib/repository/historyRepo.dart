// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';
import 'package:monsters_front_end/main.dart';

import '../API/historyAPI.dart';
import '../model/annoyanceModel.dart';
import 'package:http/http.dart' as http;

const String domain = "http://220.132.124.140:5000";

class HistoryRepository implements HistoryApiDataSource {
  final client = http.Client();
  @override
  Future<Map<String, dynamic>?> searchHistoryByType(int type) {
    String searchType = "";
    if (type == 2) {
      searchType = "/annoyance";
    }
    if (type == 3) {
      searchType = "/diary";
    }

    return _searchHistoryByType(
        Uri.parse('$domain/history${searchType}/$user_Account'));
  }

  Future<Map<String, dynamic>?> searchAnnoyanceByAccount(String account) {
    return _searchHistoryByType(
        Uri.parse('$domain/history/annoyance/$account'));
  }

  Future<Map<String, dynamic>?> searchdiaryByAccount(String account) {
    return _searchHistoryByType(Uri.parse('$domain/history/diary/$account'));
  }

  Future<Map<String, dynamic>?> _searchHistoryByType(Uri url) async {
    try {
      final request =
          await client.get(url, headers: {'Content-type': 'application/json'});
      if (request.statusCode == 200) {
        Map<String, dynamic> history = jsonDecode(request.body);
        return Future.value(history);
      } else {
        Map<String, dynamic> history = jsonDecode(request.body);
        return history;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
