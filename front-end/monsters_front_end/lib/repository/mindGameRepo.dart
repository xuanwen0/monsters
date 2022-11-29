// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';

import 'package:monsters_front_end/repository/annoyanceRepo.dart';

import '../API/mindGameAPI.dart';
import '../model/mindGameModel.dart';
import 'package:http/http.dart' as http;

class MindGameRepository implements MindGameApiDataSource {
  final client = http.Client();

  @override
  Future<Map<String, dynamic>?> searchMindGame() {
    return _searchMindGame(Uri.parse('$domain/interaction/mindGame'));
  }

  Future<Map<String, dynamic>?> _searchMindGame(Uri url) async {
    try {
      final request =
          await client.get(url, headers: {'Content-type': 'application/json'});
      print("*" * 20);
      print("mindGame status");
      print("status: " + request.statusCode.toString());
      print("*" * 20);
      if (request.statusCode == 200) {
        Map<String, dynamic> mindGame = jsonDecode(request.body);
        return Future.value(mindGame);
      } else {
        Map<String, dynamic> mindGame = jsonDecode(request.body);
        return mindGame;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
