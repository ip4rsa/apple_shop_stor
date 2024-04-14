import 'package:apple_shop/di/di.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthManager {
  static final ValueNotifier<String?> authChangeNotif = ValueNotifier(null);
  static final SharedPreferences _sharepref = locator.get();

  static void saveToken(String token) async {
    _sharepref.setString('accses_token', token);
    authChangeNotif.value = token;
  }

  static String readAuth() {
    return _sharepref.getString('accses_token') ?? '';
  }

  static void logout() {
    _sharepref.clear();
    authChangeNotif.value = null;
  }
}
