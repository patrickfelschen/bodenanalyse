import 'package:bodenanalyse/src/models/crop_model.dart';
import 'package:bodenanalyse/src/models/soil_model.dart';

class SampleModel {
  final String id;
  final DateTime date;
  final DateTime time;
  final double lat;
  final double lng;
  final SoilModel soilModel;
  final CropModel cropModel;

  SampleModel({
    required this.id,
    required this.date,
    required this.time,
    required this.lat,
    required this.lng,
    required this.soilModel,
    required this.cropModel,
  });

  factory SampleModel.fromJson(Map<String, dynamic> json) {
    return SampleModel(
      id: json["id"],
      date: json["date"],
      time: json["time"],
      lat: json["lat"],
      lng: json["lng"],
      soilModel: SoilModel.fromJson(json["soil"]),
      cropModel: CropModel.fromJson(json["crop"]),
    );
  }
}
