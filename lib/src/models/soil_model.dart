class SoilModel {
  final int id;
  final String name;

  SoilModel({
    required this.id,
    required this.name,
  });

  factory SoilModel.fromJson(Map<String, dynamic> json) {
    return SoilModel(
      id: json["id"] as int,
      name: json["name"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
    };
  }

  @override
  String toString() {
    return 'SoilModel{id: $id, name: $name}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SoilModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
