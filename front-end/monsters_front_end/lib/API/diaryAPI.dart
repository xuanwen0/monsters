// ignore_for_file: file_names

import 'package:monsters_front_end/model/diaryModel.dart';

abstract class DiaryApiDataSource{
  Future<String> createDiary(Diary diary);

  Future<Map<String, dynamic>?> searchDiaryByAccount(String account);
}

