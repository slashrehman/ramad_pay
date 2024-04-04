import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const String userKey = "UserModel";
  static const String tokenKey = "userToken";
  static const  String accessToken = "accessToken";
  static const  String refreshToken = "refreshToken";
  static const  String name = "name";
  static const  String userName = "userName";
  static const String themeKey = "DarkTheme";
  SharedPref._privateConstructor();

  static final SharedPref instance = SharedPref._privateConstructor();

  readObject(String key) async {
    final prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString(key);
    final response = data == null || data.isEmpty
        ? null
        : json.decode(prefs.getString(key)!);
    return response;
  }

  saveObject(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  Future<String> readString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final response = prefs.getString(key);
    return response.toString();
  }

  saveString(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  readBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getBool(key);
    return value;
  }

  saveBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}