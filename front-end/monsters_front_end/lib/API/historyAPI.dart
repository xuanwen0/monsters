// ignore_for_file: file_names

import 'package:monsters_front_end/model/annoyanceModel.dart';

abstract class HistoryApiDataSource {
  Future<Map<String, dynamic>?> searchHistoryByType(int type);
}
