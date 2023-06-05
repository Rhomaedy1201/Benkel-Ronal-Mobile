import 'package:get/get.dart';
import 'package:pemesanan_service_mobil/app/controllers/network_controller.dart';

class DepedencyInjection {
  static void init() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}
