import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences? _sharedPreferences;

  factory SharedPrefs() => SharedPrefs._internal();

  SharedPrefs._internal();

  Future<void> init() async {
    if (_sharedPreferences == null) {
      _sharedPreferences = await SharedPreferences.getInstance();
    }
  }

  bool? readBool(String key) {
    return _sharedPreferences!.getBool("$key");
  }

  int? readInt(String key) {
    return _sharedPreferences!.getInt("$key") ?? 0;
  }

  String? readString(String key) {
    return _sharedPreferences!.getString(key.toString()) ?? "";
  }

  Future<bool> writeBool(String key, bool value) async {
    return await _sharedPreferences!.setBool("$key", value);
  }

  Future<bool> writeInt(String key, int value) async {
    return await _sharedPreferences!.setInt("$key", value);
  }

  Future<bool> writeString(String key, String value) async {
    return await _sharedPreferences!.setString("$key", value);
  }
}
