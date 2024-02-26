//import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  static SharedPreferences? prefs;
  static Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> setToken(String token) async {
    return prefs!.setString("token", token);
  }

  static Future<String> getToken() async {
    return prefs!.getString("token") ?? '';
  }

  static Future<bool> setEmail(String email) async {
    return prefs!.setString("email", email);
  }

  static Future<String> getEmail() async {
    return prefs!.getString("email") ?? '';
  }

  static Future<bool> setLoginFlag(bool login) async {
    return prefs!.setBool("loginflag", login);
  }

  static Future<bool> getLoginFlag() async {
    return prefs!.getBool("loginflag") ?? false;
  }
}
