import 'dart:convert';

import 'package:bodenanalyse/src/models/crop_model.dart';
import 'package:bodenanalyse/src/services/shared_preferences_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class CropProvider with ChangeNotifier {
  late SharedPreferencesService _sharedPreferencesService;
  late String _baseUrl;

  List<CropModel> _crops = [];

  CropProvider() {
    _baseUrl = "http://131.173.124.199:8080/";
    _sharedPreferencesService = SharedPreferencesService();

    loadAllCrops();
  }

  List<CropModel> getCrops() {
    return _crops;
  }

  Future<void> loadAllCrops() async {
    String? token = await _sharedPreferencesService.loadToken();

    if (token == null || token == "") {
      print("No Token");
      return;
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

      _crops = responseCrops;
    }

    notifyListeners();
  }

  Future<void> updateCrop(CropModel cropModel) async {
    String? token = await _sharedPreferencesService.loadToken();

    if (token == null || token == "") {
      print("No Token");
      return;
    }

    Map<String, String>? reqHeader = {
      "token": token,
      "Content-Type": "application/json"
    };

    Map<String, dynamic> reqBody = cropModel.toJson();
    Map<String, dynamic> req = {"crop": reqBody};

    String bodyEncoded = json.encode(req);

    http.Response response = await http.patch(
      Uri.parse(_baseUrl + "crops"),
      headers: reqHeader,
      body: bodyEncoded,
    );

    print("POST Request:");
    print(reqHeader);
    print(bodyEncoded);
    print("RESPONSE:");
    print("Status Code:" + response.statusCode.toString());
    print(response.body);

    if (response.statusCode == 200) {}
  }
}
