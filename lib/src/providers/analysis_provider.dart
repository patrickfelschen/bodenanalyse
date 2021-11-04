import 'package:bodenanalyse/src/models/property_model.dart';
import 'package:bodenanalyse/src/services/shared_preferences_service.dart';
import 'package:flutter/material.dart';

class AnalysisProvider with ChangeNotifier {
  late SharedPreferencesService _sharedPreferencesService;
  late List<PropertyModel> _propertyList;

  AnalysisProvider() {
    _sharedPreferencesService = SharedPreferencesService();
  }

  void addProperty(PropertyModel model) {
    _propertyList.add(model);
  }
}