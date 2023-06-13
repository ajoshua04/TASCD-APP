import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password1;
  String? password2;
  String? accessToken;
  String? refreshToken;
  Object? appConfiguration;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password1,
    this.password2,
    this.accessToken,
    this.refreshToken,
    this.appConfiguration,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] is int ? json["id"].toString() : json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        password1: json["password1"],
        password2: json["password2"],
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
        appConfiguration: json["appConfiguration"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password1": password1,
        "password2": password2,
        "accessToken": accessToken,
        "refreshToken": refreshToken,
        "appConfiguration": appConfiguration,
      };
}
