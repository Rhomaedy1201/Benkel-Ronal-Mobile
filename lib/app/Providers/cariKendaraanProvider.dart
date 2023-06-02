import 'dart:convert';

import 'package:get/get.dart';
import 'package:pemesanan_service_mobil/app/utils/base_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CariKendaraanProvider extends GetConnect {
  Future<Response> getKendaraan(String no_rangka) async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    String? token = await spref.getString('token');
    final url = "$baseUrl/kendaraan/$no_rangka";
    final header = {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    return get(url, headers: header);
  }
}
