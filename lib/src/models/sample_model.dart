import 'package:bodenanalyse/src/models/crop_model.dart';
import 'package:bodenanalyse/src/models/property_model.dart';

class SampleModel {
  final int id;
  final DateTime datetime;
  final double lat;
  final double lng;
  final CropModel cropModel;
  final List<PropertyModel> properties;

  SampleModel({
    required this.id,
    required this.datetime,
    required this.lat,
    required this.lng,
    required this.cropModel,
    required this.properties,
  });

  factory SampleModel.fromJson(Map<String, dynamic> json) {
    return SampleModel(
      id: json["id"] as int,
      datetime: json["datetime"] as DateTime,
      lat: json["lat"] as double,
      lng: json["lng"] as double,
      cropModel: CropModel.fromJson(json["crop"]),
      properties: List<PropertyModel>.from(
        json["properties"].map(
          (e) => PropertyModel.fromJson(e),
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "datetime": datetime,
      "lat": lat,
      "lng": lng,
      "crop": cropModel.toJson(),
      "properties": properties
          .map(
            (e) => e.toJson(),
          )
          .toList()
    };
  }
}
