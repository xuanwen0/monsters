// ignore_for_file: file_names

import 'package:monsters_front_end/model/memberModel.dart';

abstract class MemberApiDataSource {
  Future<String> createMember(Member member);

  Future<String> login(Member member);

  Future<Map<String, dynamic>?> searchPersonalInfoByAccount(String account);
}
//http://192.168.0.178:8080/member/search?account=Lin