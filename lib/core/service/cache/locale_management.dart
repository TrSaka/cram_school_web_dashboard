import 'package:flutter_school/core/constants/enums/cache_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalManagement {
  LocalManagement._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }

  static final LocalManagement _instance = LocalManagement._init();

  SharedPreferences? _preferences;
  static LocalManagement get instance => _instance;

  static Future prefrencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
  }

  Future<void> cacheString(SharedPreferencesKeys key, String value) async {
    await _preferences!.setString(key.toString(), value);
  }

  Future<void> cacheInteger(SharedPreferencesKeys key, int value) async {
    await _preferences!.setInt(key.toString(), value);
  }

  String? fetchString(SharedPreferencesKeys key) =>
      _preferences?.getString(key.toString());

  int? fetchInteger(SharedPreferencesKeys key) =>
      _preferences!.getInt(key.toString());
}
