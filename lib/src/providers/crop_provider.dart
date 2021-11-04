import 'dart:convert';

import 'package:bodenanalyse/src/models/crop_model.dart';
import 'package:bodenanalyse/src/services/shared_preferences_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class CropProvider with ChangeNotifier {
  late SharedPreferencesService _sharedPreferencesService;
  late String _baseUrl;

  CropProvider() {
    _baseUrl = "http://131.173.124.199:8080/";
    _sharedPreferencesService = SharedPreferencesService();
  }

  Future<List<CropModel>> getAllCrops() async {
    String? token = await _sharedPreferencesService.loadToken();

    if (token == null || token == "") {
      print("No Token");
      return List.empty();
    }

    Map<String, String>? reqHeader = {
      "token": token,
    };

    http.Response response = await http.get(
      Uri.parse(_baseUrl + "crops"),
      headers: reqHeader,
    );

    print("POST Request:");
    print(reqHeader);
    print("RESPONSE:");
    print("Status Code:" + response.statusCode.toString());
    print(response.body);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonBody = jsonDecode(response.body);

      List<CropModel> responseCrops = (jsonBody["crops"] as List)
          .map((e) => CropModel.fromJson(e))
          .toList();

      print(responseCrops.toString());
      return responseCrops;
    }

    return List.empty();
  }
}
