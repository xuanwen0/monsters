// ignore_for_file: file_names
abstract class ManualApiDataSource {
  Future<Map<String, dynamic>> searchOwnedSkinByMonsterId();
  Future<Map<String, dynamic>> searchOwnedMonster();
}
