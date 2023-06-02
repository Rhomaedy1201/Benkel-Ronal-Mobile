import 'dart:convert';

import 'package:get/get.dart';
import 'package:pemesanan_service_mobil/app/utils/base_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TambahKendaraanProvider extends GetConnect {
  String url = "$baseUrl/kendaraan/insert";

  // void getToken(){
  //   httpClient.addAuthenticator((request) async {
  //     SharedPreferences spref = await SharedPreferences.getInstance();
  //     String? token = spref.getString('token');
  //     request.headers['Authorization'] = '$token';
  //     return request;
  //   });
  // }

  Future<Response> postData(
    String merk,
    int model_id,
    String nomor_rangka,
    String user_id,
    String tipe_mobil,
    int tahun_produksi,
    String warna,
    String nopol,
    String nomor_stnk,
    String masa_stnk,
  ) async {
    final body = json.encode({
      'merk': merk,
      'model_id': model_id,
      'nomor_rangka': nomor_rangka,
      'user_id': user_id,
      'tipe_mobil': tipe_mobil,
      'tahun_produksi': tahun_produksi,
      'warna': warna,
      'nopol': nopol,
      'nomor_stnk': nomor_stnk,
      'masa_stnk': masa_stnk,
    });
    SharedPreferences spref = await SharedPreferences.getInstance();
    String? token = await spref.getString('token');
    print(token);
    return post(url, body, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
  }
}
