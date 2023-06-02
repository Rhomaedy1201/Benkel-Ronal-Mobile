import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pemesanan_service_mobil/app/models/informasiDataMobilModel.dart';
import 'package:pemesanan_service_mobil/app/utils/base_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InformasiDataMobilController extends GetxController {
  var isLoading = false.obs;
  InformasiDataMobilModel? informasiDataMobilModel;

  Future<List<InformasiDataMobilModel>> getInformasi() async {
    List<InformasiDataMobilModel> result = [];
    try {
      isLoading(true);
      SharedPreferences spref = await SharedPreferences.getInstance();
      String? token = await spref.getString('token');
      http.Response response = await http.get(
        Uri.parse("$baseUrl/kendaraan"),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        List data = jsonDecode(response.body)['data'];
        data.forEach((element) {
          result.add(InformasiDataMobilModel.fromJson(element));
        });
        return result;
      }
      return result;
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading(false);
    }
    return result;
  }

  getData() async {
    try {
      isLoading(true);
      SharedPreferences spref = await SharedPreferences.getInstance();
      String? token = await spref.getString('token');
      http.Response response = await http.get(
        Uri.parse("$baseUrl/kendaraan"),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        informasiDataMobilModel = InformasiDataMobilModel.fromJson(result);
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
