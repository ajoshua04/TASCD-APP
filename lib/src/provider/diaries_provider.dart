// ignore_for_file: prefer_final_fields

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tascd/src/models/response_api.dart';

import '../api/enviorment.dart';
import '../models/diary_response.dart';
import '../models/user.dart';

class DiariesProvider {
  String _url = Enviorment.API_DELIVERY;

  late BuildContext context;
  late User sessionUser;

  Future? init(BuildContext context, User sessionUser) {
    this.context = context;
    this.sessionUser = sessionUser;
  }

  Future<DiaryResponseApi>? getDiaries() async {
    try {
      Uri url = Uri.https(_url, '/tascd-api/v1/home/diary/${sessionUser.id}');
      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${sessionUser.accessToken as String}'
      };

      final response = await http.get(url, headers: headers);

      final data = json.decode(utf8.decode(response.bodyBytes));

      DiaryResponseApi responseApi = DiaryResponseApi.fromJson(data);

      print("Info al traer el los diarios : $data");

      return responseApi;
    } catch (e) {
      print("Error al traer los diarios : $e");
      rethrow;
    }
  }

  Future<ResponseApi>? createDiary(String qtdd, String userId) async {
    try {
      Uri url = Uri.https(_url, '/tascd-api/v1/pampe/');
      String bodyParams = json.encode({'qtdd': qtdd, 'userId': userId});
      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${sessionUser.accessToken as String}'
      };

      final response = await http.post(url, headers: headers, body: bodyParams);

      final data = json.decode((response.body));

      ResponseApi responseApi = ResponseApi.fromJson(data);

      print("Info al crear diario : $data");

      return responseApi;
    } catch (e) {
      print("Error al crear diario : $e");
      rethrow;
    }
  }
}
