import 'package:bodenanalyse/src/models/soil_model.dart';

class FieldModel {
  final int id;
  final double lat;
  final double lng;
  final String name;
  final SoilModel soilModel;

  FieldModel({
    required this.id,
    required this.lat,
    required this.lng,
    required this.name,
    required this.soilModel,
  });

  factory FieldModel.fromJson(Map<String, dynamic> json) {
    return FieldModel(
      id: json["id"] as int,
      lat: json["lat"] as double,
      lng: json["lng"] as double,
      name: json["name"] as String,
      soilModel: SoilModel.fromJson(json["soil"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "lat": lat,
      "lng": lng,
      "name": name,
      "soil": soilModel.toJson(),
    };
  }
}
