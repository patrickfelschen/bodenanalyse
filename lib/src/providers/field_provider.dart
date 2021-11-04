import 'dart:convert';

import 'package:bodenanalyse/src/models/field_model.dart';
import 'package:bodenanalyse/src/models/sample_model.dart';
import 'package:bodenanalyse/src/models/soil_model.dart';
import 'package:bodenanalyse/src/services/shared_preferences_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class FieldProvider with ChangeNotifier {
  late String _baseUrl;
  late SharedPreferencesService _sharedPreferencesService;

  late SoilModel _selectedSoilModel = SoilModel(id: 0, name: "");
  late FieldModel _selectedFieldModel = FieldModel(
    id: 0,
    lat: 0,
    lng: 0,
    name: "",
    soilModel: SoilModel(
      id: 0,
      name: "",
    ),
  );

  List<FieldModel> _fields = [];
  List<SoilModel> _soils = [];
  List<SampleModel> _samples = [];

  FieldProvider() {
    _baseUrl = "http://131.173.124.199:8080/";
    _sharedPreferencesService = SharedPreferencesService();

    loadAllSoils();
    loadAllFields();
  }

  void setSelectedSoilModel(SoilModel soilModel) {
    _selectedSoilModel = soilModel;
    notifyListeners();
  }

  SoilModel getSelectedSoilModel() {
    return _selectedSoilModel;
  }

  void setSelectedFieldModel(FieldModel fieldModel) {
    _selectedFieldModel = fieldModel;
    notifyListeners();
  }

  FieldModel getSelectedFieldModel() {
    return _selectedFieldModel;
  }

  List<SoilModel> getSoils() {
    return _soils;
  }

  List<FieldModel> getFields() {
    return _fields;
  }

  List<SampleModel> getSamples() {
    return _samples;
  }

  Future<void> loadAllSoils() async {
    String? token = await _sharedPreferencesService.loadToken();

    if (token == null || token == "") {
      print("No Token");
      return;
    }

    Map<String, String>? reqHeader = {
      "token": token,
    };

    http.Response response = await http.get(
      Uri.parse(_baseUrl + "soils"),
      headers: reqHeader,
    );

    print("POST Request:");
    print(reqHeader);
    print("RESPONSE:");
    print("Status Code:" + response.statusCode.toString());
    print(response.body);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonBody = jsonDecode(response.body);

      List<SoilModel> responseSoils = (jsonBody["soils"] as List)
          .map((e) => SoilModel.fromJson(e))
          .toList();

      _soils = responseSoils;
    } else {
      _soils = [];
    }
    notifyListeners();
  }

  Future<void> createField(FieldModel fieldModel) async {
    String? token = await _sharedPreferencesService.loadToken();

    if (token == null || token == "") {
      print("No Token");
      return;
    }

    Map<String, String>? reqHeader = {
      "Content-Type": "application/json",
      "token": token,
    };

    Map<String, dynamic> reqBody = fieldModel.toJson();
    Map<String, dynamic> req = {"field": reqBody};

    String bodyEncoded = json.encode(req);

    http.Response response = await http.post(
      Uri.parse(_baseUrl + "fields"),
      headers: reqHeader,
      body: bodyEncoded,
    );

    print("POST Request:");
    print(bodyEncoded);
    print("RESPONSE:");
    print("Status Code:" + response.statusCode.toString());
    print(response.body);

    if (response.statusCode == 200) {}
  }

  Future<void> updateField(FieldModel fieldModel) async {
    String? token = await _sharedPreferencesService.loadToken();

    if (token == null || token == "") {
      print("No Token");
      return;
    }

    Map<String, String>? reqHeader = {
      "Content-Type": "application/json",
      "token": token,
    };

    Map<String, dynamic> reqBody = fieldModel.toJson();
    Map<String, dynamic> req = {"field": reqBody};

    String bodyEncoded = json.encode(req);

    http.Response response = await http.patch(
      Uri.parse(_baseUrl + "fields/${fieldModel.id}"),
      headers: reqHeader,
      body: bodyEncoded,
    );

    print("PATCH Request:");
    print(bodyEncoded);
    print("RESPONSE:");
    print("Status Code:" + response.statusCode.toString());
    print(response.body);

    if (response.statusCode == 200) {}
  }

  Future<void> loadAllFields() async {
    String? token = await _sharedPreferencesService.loadToken();

    if (token == null || token == "") {
      print("No Token");
      return;
    }

    Map<String, String>? reqHeader = {
      "Content-Type": "application/json",
      "token": token,
    };

    http.Response response = await http.get(
      Uri.parse(_baseUrl + "fields"),
      headers: reqHeader,
    );

    print("POST Request:");
    print(reqHeader);
    print("RESPONSE:");
    print("Status Code:" + response.statusCode.toString());
    print(response.body);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonBody = jsonDecode(response.body);

      List<FieldModel> responseFields = (jsonBody["fields"] as List)
          .map((e) => FieldModel.fromJson(e))
          .toList();

      _fields = responseFields;
    } else {
      _fields = [];
    }
    notifyListeners();
  }

  Future<void> loadAllSamples() async {
    String? token = await _sharedPreferencesService.loadToken();

    if (token == null || token == "") {
      print("No Token");
      return;
    }

    Map<String, String>? reqHeader = {
      "Content-Type": "application/json",
      "token": token,
    };

    int fieldId = _selectedFieldModel.id;

    http.Response response = await http.get(
      Uri.parse(_baseUrl + "fields/$fieldId/samples"),
      headers: reqHeader,
    );

    print("POST Request:");
    print(reqHeader);
    print("RESPONSE:");
    print("Status Code:" + response.statusCode.toString());
    print(response.body);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonBody = jsonDecode(response.body);

      List<SampleModel> responseSamples = (jsonBody["samples"] as List)
          .map((e) => SampleModel.fromJson(e))
          .toList();

      print(responseSamples);

      _samples = responseSamples;
    } else {
      _samples = [];
    }
    notifyListeners();
  }
}
