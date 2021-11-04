import 'dart:convert';

import 'package:bodenanalyse/src/models/soil_model.dart';
import 'package:bodenanalyse/src/services/shared_preferences_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class FieldProvider with ChangeNotifier {
  late String _baseUrl;
  late SharedPreferencesService _sharedPreferencesService;

  FieldProvider() {
    _baseUrl = "http://131.173.124.199:8080/";
    _sharedPreferencesService = SharedPreferencesService();
  }

  Future<List<SoilModel>> getAllSoils() async {
    String? token = await _sharedPreferencesService.loadToken();

    if (token == null || token == "") {
      print("No Token");
      return List.empty();
    }

    Map<String, String>? reqHeader = {
      "token": token,
    };

    http.Response response = await http.get(
      Uri.parse(_baseUrl + "soil"),
      headers: reqHeader,
    );

    print("POST Request:");
    print(reqHeader);
    print("RESPONSE:");
    print("Status Code:" + response.statusCode.toString());
    print(response.body);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonBody = jsonDecode(response.body);

      List<SoilModel> responseCrops = (jsonBody["soils"] as List)
          .map((e) => SoilModel.fromJson(e))
          .toList();

      print(responseCrops.toString());
      return responseCrops;
    }

    return List.empty();
  }
}
