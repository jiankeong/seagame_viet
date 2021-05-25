import 'package:flutter/foundation.dart';

import '../models/user.dart';
import './auth_provider.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  AuthProvider? authProvider;

  UserProvider(this._user, this.authProvider);

  User? get user {
    return _user == null ? null : _user!;
  }

  void updateAuthProvider(AuthProvider newAuthProviderState) {
    this.authProvider = newAuthProviderState;
  }

  void parsedUserData(Map<String, dynamic> userData) {
    _user = User.fromJson(userData);

    notifyListeners();
    return;
  }
}
