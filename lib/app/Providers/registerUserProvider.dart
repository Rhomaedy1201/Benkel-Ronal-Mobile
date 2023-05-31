import 'dart:convert';

import 'package:get/get.dart';
import 'package:pemesanan_service_mobil/app/utils/base_url.dart';

class RegisterUserProvider extends GetConnect {
  final url = "$baseUrl/register/";

  Future<Response> postData(String nama, String no_hp, String email,
      String password, String role_id) {
    final body = json.encode({
      'nama': nama,
      'no_hp': no_hp,
      'email': email,
      'password': password,
      'role_id': role_id,
    });
    return post(url, body);
  }
}
