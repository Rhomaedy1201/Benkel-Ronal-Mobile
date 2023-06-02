import 'package:get/get.dart';
import 'package:pemesanan_service_mobil/app/models/modelMobil.dart';

class ModelMobilController extends GetxController {
  var isLoading = false.obs;
  MobilModel? mobilModel;

  getData() async {
    try {
      isLoading(true);
    } catch (e) {}
  }
}
