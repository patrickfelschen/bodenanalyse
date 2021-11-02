class CriteriaModel {
  final String id;
  final String name;

  CriteriaModel({
    required this.id,
    required this.name,
  });

  factory CriteriaModel.fromJson(Map<String, dynamic> json) {
    return CriteriaModel(
      id: json["id"] as String,
      name: json["name"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
    };
  }
}
