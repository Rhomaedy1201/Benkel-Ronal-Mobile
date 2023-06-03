import 'dart:convert';

import 'package:get/get.dart';
import 'package:pemesanan_service_mobil/app/utils/base_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookingServiceProvicer extends GetConnect {
  final url = "$baseUrl/reservasi/insert";

  Future<Response> postData(
    String kendaraan_id,
    String user_id,
    String detail_service,
    String tanggal,
    String jam,
    String keluhan,
  ) async {
    final body = json.encode({
      'kendaraan_id': kendaraan_id,
      'user_id': user_id,
      'detail_service': detail_service,
      'tanggal': tanggal,
      'jam': jam,
      'keluhan': keluhan,
    });
    SharedPreferences spref = await SharedPreferences.getInstance();
    String? token = await spref.getString('token');
    return post(url, body, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
  }
}
