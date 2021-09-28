import 'database_helper.dart';

class LocalDataSource {
  DatabaseHelper _databaseHelper;

  LocalDataSource(this._databaseHelper);

  Future<int> insertPost(Map<String, dynamic> row) async {
    return await _databaseHelper.insert(row);
  }

  Future<String> queryAllPosts() async {
    return "";
  }

  Future<int> queryRowCount() async {
    return await _databaseHelper.queryRowCount();
  }

  Future<void> deleteAll() async {
    await _databaseHelper.deleteAll();
  }
}
