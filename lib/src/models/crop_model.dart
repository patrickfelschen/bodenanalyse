class CropModel {
  final int id;
  final String name;
  final bool favorite;

  CropModel({
    required this.id,
    required this.name,
    required this.favorite,
  });

  factory CropModel.fromJson(Map<String, dynamic> json) {
    return CropModel(
      id: json["id"] as int,
      name: json["name"] as String,
      favorite: json["favorite"] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "favorite": favorite,
    };
  }

  @override
  String toString() {
    return 'CropModel{id: $id, name: $name, favorite: $favorite}';
  }
}
