import 'dart:convert';

import 'package:tascd/src/models/diary.dart';

DiaryResponseApi diaryResponseApiFromJson(String str) =>
    DiaryResponseApi.fromJson(json.decode(str));

String diaryResponseApiToJson(DiaryResponseApi data) =>
    json.encode(data.toJson());

class DiaryResponseApi {
  String? cause;
  String? message;
  Object? data;
  Object? succes;
  Object? code;
  List<Diary>? diaries = [];

  DiaryResponseApi(
      {this.cause,
      this.message,
      this.data,
      this.succes,
      this.code,
      this.diaries});

  DiaryResponseApi.fromJson(Map<String, dynamic> json) {
    cause = json["cause"];
    message = json["message"];
    succes = json["succes"];
    code = json["code"];

    try {
      data = json['data'];
    } catch (e) {
      print("Exception data $e");
    }

    diaries = json["data"] == null
        ? []
        : List<Diary>.from(
                json['data'].map((model) => Diary.fromJson(model))) ??
            [];
  }

  Map<String, dynamic> toJson() => {
        "cause": cause,
        "message": message,
        "data": data,
        "succes": succes,
        "code": code,
      };
}
