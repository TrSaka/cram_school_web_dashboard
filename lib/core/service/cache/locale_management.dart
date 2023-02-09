import 'package:flutter_school/core/constants/enums/cache_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleManagement {
  //Singleton
  static late SharedPreferences _preferences;

  static Future<SharedPreferences> initalize() async {
    _preferences = await SharedPreferences.getInstance();
    return _preferences;
  }

  static cacheString(SharedPreferencesKeys key, String value) async {
    _preferences != null
        ? await _preferences.setString(key.toString(), value)
        : null;
  }

  static cacheInteger(SharedPreferences key, int value) async {
    _preferences != null
        ? await _preferences.setInt(key.toString(), value)
        : null;
  }

  static fetchString(SharedPreferencesKeys key) async {
    _preferences != null ? await _preferences.getString(key.toString()) : null;
  }

  static fetchInteger(SharedPreferences key) async {
    _preferences != null ? await _preferences.getInt(key.toString()) : null;
  }
}
