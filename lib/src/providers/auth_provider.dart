import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {

  Future<void> saveToken({
    required String token,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
  }

  Future<String?> loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    notifyListeners();
  }

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    notifyListeners();
  }

  Future<void> signOut() async {
    notifyListeners();
  }
}
