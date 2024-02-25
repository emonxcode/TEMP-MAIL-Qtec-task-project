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
}
