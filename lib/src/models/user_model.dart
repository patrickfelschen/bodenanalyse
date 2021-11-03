import 'package:bodenanalyse/src/models/settings_model.dart';

class UserModel {
  final int id;
  final String username;
  final String email;
  final SettingsModel settingsModel;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.settingsModel,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"] as int,
      username: json["username"] as String,
      email: json["email"] as String,
      settingsModel: SettingsModel.fromJson(json["settings"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "username": username,
      "email": email,
      "settings": settingsModel.toJson(),
    };
  }
}
