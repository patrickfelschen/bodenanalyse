import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
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
}
