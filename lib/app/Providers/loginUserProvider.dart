import 'dart:convert';

import 'package:get/get.dart';
import 'package:pemesanan_service_mobil/app/utils/base_url.dart';

class LoginUserProvider extends GetConnect {
  final url = "$baseUrl/login";

  Future<Response> loginUser(String email, String password) {
    final body = json.encode({
      'email': email,
      'password': password,
    });
    final header = {"Accept": "application/json"};
    return post(url, body, headers: header);
  }
}
