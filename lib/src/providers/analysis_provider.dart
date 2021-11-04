import 'package:bodenanalyse/src/models/property_model.dart';
import 'package:bodenanalyse/src/services/shared_preferences_service.dart';
import 'package:flutter/material.dart';

class AnalysisProvider with ChangeNotifier {
  late SharedPreferencesService _sharedPreferencesService;
  late List<PropertyModel> _propertyList;
  late bool _tutorialSteps;

  AnalysisProvider() {
    _sharedPreferencesService = SharedPreferencesService();
    _propertyList = List.empty(growable: true);
    _tutorialSteps = false;
  }

  void addProperty(PropertyModel model) {
    _propertyList.add(model);
    notifyListeners();
  }

  void clearProperties() {
    _propertyList = List.empty(growable: true);
  }

  void printPropertyList() {
    print(_propertyList);
  }

  void setTutorialSteps(bool value) {
    _tutorialSteps = value;
  }
}