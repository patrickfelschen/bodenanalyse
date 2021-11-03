class FieldModel {
  final int id;
  final double lat;
  final double lng;
  final String name;

  FieldModel({
    required this.id,
    required this.lat,
    required this.lng,
    required this.name,
  });

  factory FieldModel.fromJson(Map<String, dynamic> json) {
    return FieldModel(
      id: json["id"] as int,
      lat: json["lat"] as double,
      lng: json["lng"] as double,
      name: json["name"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "lat": lat,
      "lng": lng,
      "name": name,
    };
  }
}
