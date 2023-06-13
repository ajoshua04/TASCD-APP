// ignore_for_file: prefer_final_fields

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../api/enviorment.dart';
import '../models/response_api.dart';
import '../models/user.dart';

class VerseProvider {
  String _url = Enviorment.API_DELIVERY;

  late BuildContext context;
  late User sessionUser;

  Future? init(BuildContext context, User sessionUser) {
    this.context = context;
    this.sessionUser = sessionUser;
  }

  Future<ResponseApi>? getVerse() async {
    try {
      Uri url = Uri.http(_url, '/tascd-api/v1/home/');
      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${sessionUser.accessToken as String}'
      };

      final response = await http.get(url, headers: headers);

      final data = json.decode(utf8.decode(response.bodyBytes));

      ResponseApi responseApi = ResponseApi.fromJson(data);

      print("Info al traer el verso : $data");

      return responseApi;
    } catch (e) {
      print("Error al traer el verso : $e");
      rethrow;
    }
  }
}
