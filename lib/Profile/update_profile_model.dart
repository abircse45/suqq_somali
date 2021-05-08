// To parse this JSON data, do
//
//     final updateProfileModel = updateProfileModelFromJson(jsonString);

import 'dart:convert';

UpdateProfileModel updateProfileModelFromJson(String str) => UpdateProfileModel.fromJson(json.decode(str));

String updateProfileModelToJson(UpdateProfileModel data) => json.encode(data.toJson());

class UpdateProfileModel {
  UpdateProfileModel({
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

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) => UpdateProfileModel(
    status: json["status"] == null ? null : json["status"],
    firstName: json["first_name"] == null ? null : json["first_name"],
    lastName: json["last_name"] == null ? null : json["last_name"],
    email: json["email"] == null ? null : json["email"],
    profileCity: json["profile_city"] == null ? null : json["profile_city"],
    profilePic: json["profile_pic"] == null ? null : json["profile_pic"],
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "first_name": firstName == null ? null : firstName,
    "last_name": lastName == null ? null : lastName,
    "email": email == null ? null : email,
    "profile_city": profileCity == null ? null : profileCity,
    "profile_pic": profilePic == null ? null : profilePic,
  };
}
