import 'package:bodenanalyse/src/models/criteria_model.dart';

class PropertyModel {
  final int id;
  final int rating;
  final CriteriaModel criteria;

  PropertyModel({
    required this.id,
    required this.rating,
    required this.criteria,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      id: json["id"] as int,
      rating: json["rating"] as int,
      criteria: CriteriaModel.fromJson(json["criteria"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "rating": rating,
      "criteria": criteria.toJson(),
    };
  }
}
