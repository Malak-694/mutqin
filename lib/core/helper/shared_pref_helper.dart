import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  static getData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  static Future<void> setData(String key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (value.runtimeType) {
      case const (String):
        await prefs.setString(key, value);
        break;
      case const (int):
        await prefs.setInt(key, value);
        break;
      case const (double):
        await prefs.setDouble(key, value);
        break;
      case const (bool):
        await prefs.setBool(key, value);
        break;
      case const (List<String>):
        await prefs.setStringList(key, value);
        break;
      default:
        throw Exception("Unsupported type");
    }
  }

  static Future<void> remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  static Future<void> clearAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  /// --------------------
  /// SECURE STORAGE (Encrypted)
  /// --------------------

  static Future<void> setSecureData(String key, value) async {
    switch (value.runtimeType) {
      case const (String):
        await _secureStorage.write(key: key, value: value);
        break;
      case const (int):
        await _secureStorage.write(key: key, value: value);
        break;
      case const (double):
        await _secureStorage.write(key: key, value: value);
        break;
      case const (bool):
        await _secureStorage.write(key: key, value: value);
        break;
      case const (List<String>):
        await _secureStorage.write(key: key, value: value);
        break;
      default:
        throw Exception("Unsupported type");
    }
  }

  static Future<String?> getSecureData(String key) async {
    return await _secureStorage.read(key: key);
  }

  static Future<void> removeSecureData(String key) async {
    await _secureStorage.delete(key: key);
  }

  static Future<void> clearAllSecure() async {
    await _secureStorage.deleteAll();
  }
}
