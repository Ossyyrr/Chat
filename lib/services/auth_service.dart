import 'dart:convert';

import 'package:chat/global/enviroment.dart';
import 'package:chat/models/login_response.dart';
import 'package:chat/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService with ChangeNotifier {
  late Usuario usuario;

  Future login(String email, String password) async {
    final data = {
      "email": email,
      'password': password,
    };

    // ! Solo funciona en simulador

    var uri = Uri.parse('${Enviroment.apiUrl}/login/');
    try {
      final resp = await http.post(uri,
          body: jsonEncode(data),
          headers: {'Content-Type': 'application/json'});
      print('resp.body *************  en emulador funciona');
      print(resp.body);

      if (resp.statusCode == 200) {
        final loginResponse = loginResponseFromJson(resp.body);
        usuario = loginResponse.usuario;
      }
    } catch (e) {
      print('ERROR: ');
      print(e);
    }
  }
}
