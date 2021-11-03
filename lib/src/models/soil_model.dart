class SoilModel {
  final int id;
  final String type;

  SoilModel({
    required this.id,
    required this.type,
  });

  factory SoilModel.fromJson(Map<String, dynamic> json) {
    return SoilModel(
      id: json["id"] as int,
      type: json["type"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "type": type,
    };
  }
}
