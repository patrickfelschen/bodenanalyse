import 'package:flutter/foundation.dart';

class AuthProvider with ChangeNotifier {
  void signIn({required String email, required String password}) {}

  void signUp({required String email, required String password}) {}

  void signOut() {}
}
