import 'package:bodenanalyse/src/models/crop_model.dart';
import 'package:bodenanalyse/src/models/soil_model.dart';

class SampleModel {
  final String id;
  final DateTime datetime;
  final double lat;
  final double lng;
  final SoilModel soilModel;
  final CropModel cropModel;

  SampleModel({
    required this.id,
    required this.datetime,
    required this.lat,
    required this.lng,
    required this.soilModel,
    required this.cropModel,
  });

  factory SampleModel.fromJson(Map<String, dynamic> json) {
    return SampleModel(
      id: json["id"],
      datetime: json["datetime"],
      lat: json["lat"],
      lng: json["lng"],
      soilModel: SoilModel.fromJson(json["soil"]),
      cropModel: CropModel.fromJson(json["crop"]),
    );
  }
}
