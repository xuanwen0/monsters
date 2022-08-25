// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';

import '../API/memberAPI.dart';
import '../model/memberModel.dart';
import 'package:http/http.dart' as http;

class MemberRepository implements MemberApiDataSource {
  final client = http.Client();
  final String domain = "http://10.0.2.2:8080";
  @override
  Future<String> createMember(Member member) {
    return _createMember(Uri.parse('$domain/member/create'), member);
  }

  @override
  Future<Map<String, dynamic>?> login(Member member) {
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

  Future<Map<String, dynamic>?> _login(
    Uri url,
    Member member,
  ) async {
    try {
      final request =
          await client.get(url, headers: {'Content-type': 'application/json'});
      if (request.statusCode == 200) {
        Map<String, dynamic> member = jsonDecode(request.body);
        return Future.value(member);
      } else {
        Map<String, dynamic> member = jsonDecode(request.body);
        return member;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
