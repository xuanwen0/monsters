// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';

import '../API/memberAPI.dart';
import '../main.dart';
import '../model/memberModel.dart';
import 'package:http/http.dart' as http;

import 'annoyanceRepo.dart';

class MemberRepository implements MemberApiDataSource {
  final client = http.Client();
  // final String domain = "http://10.0.2.2:8080";
  @override
  Future<String> createMember(Member member) {
    return _createMember(Uri.parse('$domain/member/create'), member);
  }

  @override
  Future<String> login(Member member) {
    return _login(Uri.parse('$domain/member/login'), member);
  }

  Future<String> _createMember(
    Uri url,
    Member member,
  ) async {
    try {
      final request = await client.post(url,
          headers: {'Content-type': 'application/json'},
          body: json.encode(member));
      if (request.statusCode == 200) {
        return request.body;
      } else {
        return request.body;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> _login(
    Uri url,
    Member member,
  ) async {
    try {
      log("2");
      final request = await client.post(url,
          headers: {'Content-type': 'application/json'},
          body: json.encode(member));
          
          log(request.statusCode.toString());
      if (request.statusCode == 200) {
        return request.body;
      } else {
        return request.body;
      }
    } catch (e) {
      log(e.toString());
      return e.toString();
    }
  }

  @override
  Future<Map<String, dynamic>?> searchPersonalInfoByAccount(String account) {
    return _searchPersonalInfoByAccount(
        Uri.parse('$domain/member/$user_Account'));
  }
  Future<Map<String, dynamic>?> _searchPersonalInfoByAccount(Uri url) async {
    try {
      final request =
          await client.get(url, headers: {'Content-type': 'application/json'});
    log("*" * 20);
    log("member status");
    log("status: " + request.statusCode.toString());
    log("*" * 20);
      if (request.statusCode == 200) {
        Map<String, dynamic> personalInfo = jsonDecode(request.body);
        return Future.value(personalInfo);
      } else {
        Map<String, dynamic> personalInfo = jsonDecode(request.body);
        return personalInfo;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
