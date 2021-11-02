import 'package:bodenanalyse/src/models/criteria_model.dart';

class PropertyModel {
  final String id;
  final int rating;
  final String url;
  final CriteriaModel criteria;

  PropertyModel({
    required this.id,
    required this.rating,
    required this.url,
    required this.criteria,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      id: json["id"] as String,
      rating: json["rating"] as int,
      url: json["url"] as String,
      criteria: CriteriaModel.fromJson(json["criteria"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "rating": rating,
      "url": url,
      "criteria": criteria.toJson(),
    };
  }
}
