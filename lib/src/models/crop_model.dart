class CropModel {
  final int id;
  final String type;

  CropModel({
    required this.id,
    required this.type,
  });

  factory CropModel.fromJson(Map<String, dynamic> json) {
    return CropModel(
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
