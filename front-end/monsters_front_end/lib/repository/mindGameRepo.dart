// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';

import '../API/mindGameAPI.dart';
import '../model/mindGameModel.dart';
import 'package:http/http.dart' as http;

class MindGameRepository implements MindGameApiDataSource {
  final client = http.Client();
  final String domain = "http://10.0.2.2:8080";

  @override
  Future<Map<String, dynamic>?> searchMindGame() {
    return _searchMindGame(Uri.parse('$domain/mindGame'));
  }

  Future<Map<String, dynamic>?> _searchMindGame(Uri url) async {
    try {
      final request =
          await client.get(url, headers: {'Content-type': 'application/json'});
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
