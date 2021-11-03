import 'dart:convert';

import 'package:bodenanalyse/src/models/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  final String _baseUrl = "http://131.173.124.199:8080/";

  late UserModel currentUser;
  bool loggedIn = false;

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

  Future<void> refreshCurrentUser() async {
    String? token = await loadToken();

    if (token == null || token == "") {
      loggedIn = false;
      return;
    }

    Map<String, String>? reqHeader = {
      "Content-Type": "application/json",
      "token": token,
    };

    http.Response response = await http.post(
      Uri.parse(_baseUrl + "user"),
      headers: reqHeader,
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonBody = jsonDecode(response.body);
      currentUser = UserModel.fromJson(jsonBody["user"]);
      loggedIn = true;
    }

    notifyListeners();
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> reqBody = {
      "email": email,
      "password": password,
    };

    http.Response response = await http.post(
      Uri.parse(_baseUrl + "login"),
      headers: {"Content-Type": "application/json"},
      body: reqBody,
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonBody = jsonDecode(response.body);
      String token = jsonBody["token"];
      UserModel user = UserModel.fromJson(jsonBody["user"]);

      await saveToken(token: token);

      currentUser = user;
      loggedIn = true;
    }

    print("POST Request:");
    print(reqBody);
    print("RESPONSE:");
    print("Status Code:" + response.statusCode.toString());
    print(response.body);

    notifyListeners();
  }

  Future<void> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> reqBody = {
      "username": username,
      "email": email,
      "password": password,
    };

    var body = json.encode(reqBody);

    http.Response response = await http.post(
      Uri.parse(_baseUrl + "registration"),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonBody = jsonDecode(response.body);

      String token = jsonBody["token"];
      UserModel user = UserModel.fromJson(jsonBody["user"]);

      await saveToken(token: token);

      currentUser = user;
      loggedIn = true;
    }

    print("POST Request:");
    print(reqBody);
    print("RESPONSE:");
    print("Status Code:" + response.statusCode.toString());
    print(response.body);

    notifyListeners();
  }

  Future<void> signOut() async {
    await saveToken(token: "");
    loggedIn = false;
    notifyListeners();
  }
}
