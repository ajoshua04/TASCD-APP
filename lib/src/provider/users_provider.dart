// ignore_for_file: prefer_final_fields

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

import '../api/enviorment.dart';
import '../models/response_api.dart';
import '../models/user.dart';

class UsersProvider {
  String _url = Enviorment.API_DELIVERY;

  late BuildContext context;

  Future? init(BuildContext context) {
    this.context = context;
  }

  Future<ResponseApi>? create(User user) async {
    try {
      Uri url = Uri.http(_url, '/tascd-api/v1/auth/register');
      String bodyParams = json.encode(user);
      Map<String, String> headers = {
        'Content-type': 'application/json',
      };

      final response = await http.post(url, headers: headers, body: bodyParams);

      final data = json.decode(response.body);

      ResponseApi responseApi = ResponseApi.fromJson(data);

      print("Info al crear usuario : $data");

      return responseApi;
    } catch (e) {
      print("Error al crear usuario : $e");
      rethrow;
    }
  }

  Future<ResponseApi>? login(String email, String password) async {
    try {
      Uri url = Uri.http(_url, '/tascd-api/v1/auth/login');
      String bodyParams = json.encode({'email': email, 'password': password});
      Map<String, String> headers = {
        'Content-type': 'application/json',
      };

      final response = await http.post(url, headers: headers, body: bodyParams);

      final data = json.decode(response.body);

      ResponseApi responseApi = ResponseApi.fromJson(data);

      print("Info al iniciar sesion : $data");

      return responseApi;
    } catch (e) {
      print("Error al iniciar sesion : $e");
      rethrow;
    }
  }
}
