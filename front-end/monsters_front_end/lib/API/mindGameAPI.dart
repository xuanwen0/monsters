// ignore_for_file: file_names

import 'package:monsters_front_end/model/mindGameModel.dart';

abstract class MindGameApiDataSource {
  Future<Map<String, dynamic>?> searchMindGameById(int id);
}
