import 'package:bodenanalyse/src/models/settings_model.dart';

class UserModel {
  final String id;
  final String email;
  final String jwtToken;
  final SettingsModel settingsModel;

  UserModel({
    required this.id,
    required this.email,
    required this.jwtToken,
    required this.settingsModel,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"] as String,
      email: json["email"] as String,
      jwtToken: json["jwtToken"] as String,
      settingsModel: SettingsModel.fromJson(json["settings"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "email": email,
      "jwtToken": jwtToken,
      "settings": settingsModel.toJson(),
    };
  }
}
