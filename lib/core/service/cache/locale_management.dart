// ignore_for_file: unrelated_type_equality_checks

import 'dart:convert';
import 'package:flutter_school/core/constants/enums/cache_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/auth_model.dart';

class LocalManagement {
  LocalManagement._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }

  final _jsonString = '{"status": false, "extra": null}';

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
      _preferences!.getString(key.toString());

  int? fetchInteger(SharedPreferencesKeys key) =>
      _preferences!.getInt(key.toString());

  Future<void> deleteString(SharedPreferencesKeys key) async {
    await _preferences!.remove(key.toString());
  }

  Future<void> deleteInteger(SharedPreferencesKeys key) async {
    await _preferences!.remove(key.toString());
  }

  Future? cacheAuth(model, bool remembered) async {
    return await _preferences!.setString(
      remembered == true
          ? SharedPreferencesKeys.CACHE_AUTH.toString()
          : SharedPreferencesKeys.HIDE_CACHE_AUTH.toString(),
      json.encode(model),
    );
  }

 fetchAuth(String key)  {
    final data =  json.decode(_preferences!.getString(key) ?? _jsonString);

    if (data['status'] != false) {
      var authData = AuthModel.fromMap(data);

      AuthModel userModel = AuthModel(
        numberID: authData.numberID,
        email: authData.email,
        password: authData.password,
      );
      return userModel;
    }
    return null;
  }

  deleteAuth(key) async {
    return await _preferences!.remove(
        SharedPreferencesKeys.CACHE_AUTH.toString());
  }
}
