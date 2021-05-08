// To parse this JSON data, do
//
//     final loginUser = loginUserFromJson(jsonString);

import 'dart:convert';

LoginUser loginUserFromJson(String str) => LoginUser.fromJson(json.decode(str));

String loginUserToJson(LoginUser data) => json.encode(data.toJson());

class LoginUser {
  LoginUser({
    this.status,
    this.user,
  });

  int status;
  User user;

  factory LoginUser.fromJson(Map<String, dynamic> json) => LoginUser(
    status: json["status"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "user": user.toJson(),
  };
}

class User {
  User({
    this.id,
    this.loggedinToken,
    this.firstName,
    this.lastName,
    this.email,
  });

  String id;
  String loggedinToken;
  String firstName;
  String lastName;
  String email;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    loggedinToken: json["loggedin_token"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "loggedin_token": loggedinToken,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
  };
}
