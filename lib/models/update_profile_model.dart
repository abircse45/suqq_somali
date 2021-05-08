// To parse this JSON data, do
//
//     final updateProfile = updateProfileFromJson(jsonString);

import 'dart:convert';

UpdateProfile updateProfileFromJson(String str) => UpdateProfile.fromJson(json.decode(str));

String updateProfileToJson(UpdateProfile data) => json.encode(data.toJson());

class UpdateProfile {
  UpdateProfile({
    this.status,
    this.firstName,
    this.lastName,
    this.email,
    this.profileCity,
    this.profilePic,
  });

  int status;
  String firstName;
  String lastName;
  String email;
  String profileCity;
  String profilePic;

  factory UpdateProfile.fromJson(Map<String, dynamic> json) => UpdateProfile(
    status: json["status"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    profileCity: json["profile_city"],
    profilePic: json["profile_pic"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "profile_city": profileCity,
    "profile_pic": profilePic,
  };
}
