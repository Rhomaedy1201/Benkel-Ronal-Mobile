import 'dart:convert';

import 'package:get/get.dart';
import 'package:pemesanan_service_mobil/app/models/Service.dart';
import 'package:http/http.dart' as http;
import 'package:pemesanan_service_mobil/app/utils/base_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceController extends GetxController {
  Service? service;
  var isLoading = false.obs;
  Future<List<Service>> getServiceData(String id_kendaraan) async {
    List<Service> result = [];
    try {
      isLoading(true);
      SharedPreferences spref = await SharedPreferences.getInstance();
      String? token = await spref.getString('token');
      http.Response response = await http.get(
        Uri.parse("$baseUrl/service/$id_kendaraan"),
        headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/json"
        },
      );
      if (response.statusCode == 200) {
        List data = jsonDecode(response.body)['data'];
        print("Data " + data.toString());
        data.forEach((element) {
          result.add(Service.fromJson(element));
        });
        return result;
      }
      return result;
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
    return result;
  }

  getData(String id_kendaraan) async {
    try {
      // isLoading(true);
      SharedPreferences spref = await SharedPreferences.getInstance();
      String? token = await spref.getString('token');
      http.Response response = await http.get(
        Uri.parse("$baseUrl/service/$id_kendaraan"),
        headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/json"
        },
      );
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        print(result);
        service = Service.fromJson(result);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
