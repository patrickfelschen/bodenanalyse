class SettingsModel {
  final String id;
  final bool tutorial;
  final bool location;
  final bool sync;
  final bool voiceControl;

  SettingsModel({
    required this.id,
    required this.tutorial,
    required this.location,
    required this.sync,
    required this.voiceControl,
  });

  factory SettingsModel.fromJson(Map<String, dynamic> json) {
    return SettingsModel(
      id: json["id"] as String,
      tutorial: json["tutorial"] as bool,
      location: json["location"] as bool,
      sync: json["sync"] as bool,
      voiceControl: json["voiceControl"] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "tutorial": tutorial,
      "location": location,
      "sync": sync,
      "voiceControl": voiceControl,
    };
  }
}
