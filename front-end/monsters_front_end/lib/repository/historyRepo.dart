// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';
import 'package:monsters_front_end/main.dart';

import '../API/historyAPI.dart';
import 'package:http/http.dart' as http;

import 'annoyanceRepo.dart';

class HistoryRepository implements HistoryApiDataSource {
  final client = http.Client();
  @override
  Future<Map<String, dynamic>?> searchHistoryByType(int type) {
    String searchType = "";
    if (type == 1) {
      searchType = userAccount;
    }
    if (type == 2) {
      searchType = "annoyance/$userAccount";
    }
    if (type == 3) {
      // searchType = "diary/$userAccount";
      searchType = "diary/$userAccount";
    }
    if (type == 4) {
      searchType = "annoyance/0/$userAccount";
    }
    if (type == 5) {
      searchType = "annoyance/1/$userAccount";
    }

    return _searchHistoryByType(Uri.parse('$domain/history/$searchType'));
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
