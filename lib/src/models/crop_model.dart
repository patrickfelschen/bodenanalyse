class CropModel {
  final int id;
  final String type;
  final bool favorite;

  CropModel({
    required this.id,
    required this.type,
    required this.favorite,
  });

  factory CropModel.fromJson(Map<String, dynamic> json) {
    return CropModel(
      id: json["id"] as int,
      type: json["type"] as String,
      favorite: json["favorite"] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "type": type,
      "favorite": favorite,
    };
  }
}
