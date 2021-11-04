import 'package:bodenanalyse/src/models/crop_model.dart';
import 'package:bodenanalyse/src/models/property_model.dart';
import 'package:bodenanalyse/src/services/shared_preferences_service.dart';
import 'package:flutter/material.dart';

class AnalysisProvider with ChangeNotifier {
  late SharedPreferencesService _sharedPreferencesService;
  late List<PropertyModel> _propertyList;
  late bool _tutorialSteps;
  late CropModel _cropModel;
  late DateTime _datetime;
  late double _lat;
  late double _lng;


  AnalysisProvider() {
    _sharedPreferencesService = SharedPreferencesService();
    _propertyList = List.empty(growable: true);
    _tutorialSteps = false;
    _cropModel = CropModel(id: 0, name: '', favorite: false);
    _datetime = DateTime.now();
    _lat = 0.0;
    _lng = 0.0;
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