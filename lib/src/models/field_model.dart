class FieldModel {
  final int id;
  final String userId;
  final String name;

  FieldModel({
    required this.id,
    required this.userId,
    required this.name,
  });

  factory FieldModel.fromJson(Map<String, dynamic> json) {
    return FieldModel(
      id: json["id"] as int,
      userId: json["userId"] as String,
      name: json["name"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "userId": userId,
      "name": name,
    };
  }
}
