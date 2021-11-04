class PropertyModel {
  final int id;
  final int rating;
  final String criteriaName;

  PropertyModel({
    required this.id,
    required this.rating,
    required this.criteriaName,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
        id: json["id"] as int,
        rating: json["rating"] as int,
        criteriaName: json["criteria"] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "rating": rating,
      "image": null,
      "criteria": criteriaName,
    };
  }

  @override
  String toString() {
    return 'PropertyModel{id: $id, rating: $rating, criteriaName: $criteriaName}';
  }
}
