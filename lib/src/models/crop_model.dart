class CropModel {
  final String id;
  final bool favorite;

  CropModel({
    required this.id,
    required this.favorite,
  });

  factory CropModel.fromJson(Map<String, dynamic> json) {
    return CropModel(
      id: json["id"] as String,
      favorite: json["favorite"] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "favorite": favorite,
    };
  }
}
