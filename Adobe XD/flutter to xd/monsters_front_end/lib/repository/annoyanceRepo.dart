// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';

import '../API/annoyanceAPI.dart';
import '../model/annoyanceModel.dart';
import 'package:http/http.dart' as http;

class AnnoyanceRepository implements AnnoyanceApiDataSource {
  final client = http.Client();
  final String domain = "http://10.0.2.2:8080";
  @override
  Future<String> createAnnoyance(Annoyance annoyance) {
    return _createAnnoyance(Uri.parse('$domain/annoyance/create'), annoyance);
  }

  @override
  Future<Map<String, dynamic>?> searchAnnoyanceByAccount(String account) {
    return _searchAnnoyanceByAccount(
        Uri.parse('$domain/annoyance/search?account=$account'));
  }

  Future<String> _createAnnoyance(
    Uri url,
    Annoyance annoyance,
  ) async {
    try {
      final request = await client.post(url,
          headers: {'Content-type': 'application/json'},
          body: json.encode(annoyance));
      if (request.statusCode == 200) {
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

  Future<Map<String, dynamic>?> _searchAnnoyanceByAccount(Uri url) async {
    try {
      final request =
          await client.get(url, headers: {'Content-type': 'application/json'});
      if (request.statusCode == 200) {
        Map<String, dynamic> annoyance = jsonDecode(request.body);
        return Future.value(annoyance);
      } else {
        Map<String, dynamic> annoyance = jsonDecode(request.body);
        return annoyance;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
