import 'dart:convert';

import 'package:bodenanalyse/src/models/crop_model.dart';
import 'package:bodenanalyse/src/models/field_model.dart';
import 'package:bodenanalyse/src/models/property_model.dart';
import 'package:bodenanalyse/src/models/sample_model.dart';
import 'package:bodenanalyse/src/services/shared_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AnalysisProvider with ChangeNotifier {
  late SharedPreferencesService _sharedPreferencesService;
  late String _baseUrl;

  late List<PropertyModel> _propertyList;
  late bool _tutorialSteps;
  late CropModel _cropModel;
  late DateTime _datetime;
  late double _lat;
  late double _lng;

  late FieldModel _seletctedFieldModel;

  AnalysisProvider() {
    _sharedPreferencesService = SharedPreferencesService();
    _baseUrl = "http://131.173.124.199:8080/";

    _propertyList = List.empty(growable: true);
    _tutorialSteps = false;
    _cropModel = CropModel(id: 0, name: '', favorite: false);
    _datetime = DateTime.now();
    _lat = 0.0;
    _lng = 0.0;
  }

  Future<void> createSample() async {
    String? token = await _sharedPreferencesService.loadToken();

    if (token == null || token == "") {
      print("No Token");
      return;
    }

    Map<String, String>? reqHeader = {
      "Content-Type": "application/json",
      "token": token,
    };

    SampleModel newSample = SampleModel(
      id: 0,
      datetime: DateTime.now(),
      lat: _lat,
      lng: _lng,
      cropModel: _cropModel,
      properties: _propertyList,
    );

    Map<String, dynamic> reqBody = newSample.toJson();
    //Map<String, dynamic> req = {"sample": reqBody};

    String bodyEncoded = json.encode(reqBody);

    http.Response response = await http.post(
      Uri.parse(_baseUrl + "fields/${_seletctedFieldModel.id}/samples"),
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

  void setSelectedFieldModel(FieldModel fieldModel) {
    _seletctedFieldModel = fieldModel;
  }

  FieldModel getSelectedFieldModel() {
    return _seletctedFieldModel;
  }

  void addProperty(PropertyModel model) {
    _propertyList.add(model);
    notifyListeners();
  }

  void clearProperties() {
    _propertyList = List.empty(growable: true);
  }

  List<PropertyModel> getPropertyList() {
    return _propertyList;
  }

  void printPropertyList() {
    print(_propertyList);
  }

  void setTutorialSteps(bool value) {
    _tutorialSteps = value;
  }

  bool getTutorialStesp() {
    return _tutorialSteps;
  }

  void setCropModel(CropModel cropModel) {
    _cropModel = cropModel;
  }

  CropModel getCropModel() {
    return _cropModel;
  }

  void setDateTime(DateTime dateTime) {
    _datetime = dateTime;
  }

  DateTime getDateTime() {
    return _datetime;
  }

  void setLat(double lat) {
    _lat = lat;
  }

  double getLat() {
    return _lat;
  }

  void setLng(double lng) {
    _lng = lng;
  }

  double getLng() {
    return _lng;
  }
}
