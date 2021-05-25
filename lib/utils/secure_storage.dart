import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../constants/shared_prefs_constants.dart';

class SecureStorage {
  static FlutterSecureStorage? _flutterSecureStorage;

  factory SecureStorage() => SecureStorage._internal();

  SecureStorage._internal();

  Future<void> init() async {
    if (_flutterSecureStorage == null) {
      _flutterSecureStorage = FlutterSecureStorage();
    }
  }

  Future<String?> readString(String key) async {
    return await _flutterSecureStorage!.read(key: key);
  }

  Future<void> writeString(String key, String? value) async {
    return await _flutterSecureStorage!.write(key: key, value: value);
  }

  Future<void> deleteItem(String key) async {
    return await _flutterSecureStorage!.delete(key: key);
  }

  Future<String?> readLoginToken() async {
    return await readString(kLoginToken);
  }

  Future<void> writeLoginToken(String? value) async {
    return await writeString(kLoginToken, value);
  }

  Future<void> deleteLoginToken() async {
    return await deleteItem(kLoginToken);
  }
}
