// ignore_for_file: file_names
abstract class HistoryApiDataSource {
  Future<Map<String, dynamic>?> searchHistoryByType(int type);
}
