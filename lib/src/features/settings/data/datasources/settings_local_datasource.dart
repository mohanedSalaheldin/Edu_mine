import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SettingsLocalDataSource {
  Future<String> getCachedData({required String key});
  Future<Unit> cacheData({
    required String key,
    required String value,
  });
}

class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  @override
  Future<Unit> cacheData({required String key, required String value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
    return unit;
  }

  @override
  Future<String> getCachedData({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringValue = prefs.getString(key)!;
    return stringValue;
  }
}
