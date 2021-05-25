import 'package:flutter/foundation.dart';

import '../utils/secure_storage.dart';

class AuthProvider with ChangeNotifier {
  String? _token;

  String get token {
    return _token ?? "";
  }

  void setToken(String token) {
    _token = token;
    notifyListeners();
  }

  bool hasLogin() {
    return _token == null ? false : true;
  }

  Future<dynamic> login() async {
    String token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiTGVlIEhvIEppZSIsImFjY291bnRfaWQiOiJMT1JNRSJ9.nNdK6YPmUreGUcTVQH9oGKRcQ4OPsTzCBTGTrZJJY9A';

    _token = token;

    SecureStorage().writeLoginToken(_token);

    notifyListeners();
    return true;
  }

  Future<dynamic> logout() async {
    _token = null;

    SecureStorage().deleteLoginToken();

    notifyListeners();
    return true;
  }
}
