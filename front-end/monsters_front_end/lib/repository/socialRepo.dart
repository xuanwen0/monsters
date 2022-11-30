// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:monsters_front_end/main.dart';
import 'package:monsters_front_end/repository/annoyanceRepo.dart';

import '../API/socialAPI.dart';
import '../model/socialModel.dart';
import 'package:http/http.dart' as http;

class SocialRepository implements SocialApiDataSource {
  final client = http.Client();
  @override
  Future<Map<String, dynamic>?> searchSocialByType(int type) {
    String searchType = "";
    if (type == 1) {}
    if (type == 2) {
      searchType = "/annoyance";
    }
    if (type == 3) {
      searchType = "/diary";
    }
    if (type == 4) {
      searchType = "/$user_Account";
    }

    return _searchSocialByType(Uri.parse('$domain/social$searchType'));
  }

  Future<Map<String, dynamic>?> _searchSocialByType(Uri url) async {
    try {
      final request =
          await client.get(url, headers: {'Content-type': 'application/json'});
      log("*" * 20);
      log("social status");
      log("status: " + request.statusCode.toString());
      log("*" * 20);
      if (request.statusCode == 200) {
        Map<String, dynamic> social = jsonDecode(request.body);
        log("socialBody:");
        log(social.toString());
        return Future.value(social);
      } else {
        Map<String, dynamic> social = jsonDecode(request.body);
        log("socialBody:");
        log(social.toString());
        return social;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
