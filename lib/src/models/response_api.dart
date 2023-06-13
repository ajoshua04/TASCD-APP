import 'dart:convert';

ResponseApi responseApiFromJson(String str) =>
    ResponseApi.fromJson(json.decode(str));

String responseApiToJson(ResponseApi data) => json.encode(data.toJson());

class ResponseApi {
  String? cause;
  String? message;
  Object? data;
  Object? userLoginDto;
  Object? succes;
  Object? code;

  ResponseApi(
      {this.cause,
      this.message,
      this.data,
      this.succes,
      this.code,
      this.userLoginDto});

  ResponseApi.fromJson(Map<String, dynamic> json) {
    cause = json["cause"];
    message = json["message"];
    succes = json["succes"];
    code = json["code"];

    try {
      data = json['data'];
    } catch (e) {
      print("Exception data $e");
    }

    try {
      userLoginDto = json['data']['userLoginDto'];
    } catch (e) {
      print("Exception data $e");
    }
  }

  Map<String, dynamic> toJson() => {
        "cause": cause,
        "message": message,
        "data": data,
        "succes": succes,
        "code": code,
      };
}
