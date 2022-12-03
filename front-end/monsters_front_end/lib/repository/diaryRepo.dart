// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';

import 'package:monsters_front_end/main.dart';

import '../API/diaryAPI.dart';
import '../model/diaryModel.dart';
import 'package:http/http.dart' as http;

import 'annoyanceRepo.dart';

class DiaryRepository implements DiaryApiDataSource {
  final client = http.Client();
  @override
  Future<String> createDiary(Diary diary) {
    return _createDiary(Uri.parse('$domain/diary/create'), diary);
  }

  @override
  Future<Map<String, dynamic>?> searchDiaryByAccount(String account) {
    return _searchDiaryByAccount(
        Uri.parse('$domain/diary/search/$userAccount'));
  }

  Future<String> _createDiary(
    Uri url,
    Diary diary,
  ) async {
    try {
      var body = json.encode(diary);
      log(diary.index.toString());
      var request = await client.post(url,
          headers: {'Content-type': 'application/json'}, body: body);
      // body: diary);
      log(request.statusCode.toString());
      log(request.body);
      if (request.statusCode == 201) {
        log(
          request.body,
          name: request.statusCode.toString(),
        );
        return request.body;
      } else {
        return request.body;
      }
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  Future<Map<String, dynamic>?> _searchDiaryByAccount(Uri url) async {
    try {
      final request =
          await client.get(url, headers: {'Content-type': 'application/json'});
      if (request.statusCode == 200) {
        Map<String, dynamic> diary = jsonDecode(request.body);
        return Future.value(diary);
      } else {
        Map<String, dynamic> diary = jsonDecode(request.body);
        return diary;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
