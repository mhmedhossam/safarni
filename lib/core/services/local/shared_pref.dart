import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences prefs;
  static const String ktoken = "token";
  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static SharedPref get instance => SharedPref();

  //default setData
  static Future<void> setData(String key, dynamic value) async {
    if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else if (value is String) {
      await prefs.setString(key, value);
    } else if (value is List<String>) {
      await prefs.setStringList(key, value);
    }
  }

  static String? getToken() {
    return getData(ktoken) as String?;
  }

  static Future<void> setToken(String? token) async {
    await setData(ktoken, token);
  }

  //default getData
  static Object? getData(String key) {
    return prefs.get(key);
  }

  //default delete
  static Future<bool> delete(String key) {
    return prefs.remove(key);
  }
}
