// ignore_for_file: file_names

import 'package:monsters_front_end/model/memberModel.dart';

abstract class MemberApiDataSource {
  Future<String> createMember(Member member);

  Future<Map<String, dynamic>?> login(Member member);
}
