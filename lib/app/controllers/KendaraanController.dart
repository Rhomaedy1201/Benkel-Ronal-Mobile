import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';
import 'package:pemesanan_service_mobil/app/Providers/cariKendaraanProvider.dart';
import 'package:pemesanan_service_mobil/app/pages/main/history/ResultSearchHistoryService.dart';
import 'package:pemesanan_service_mobil/app/pages/widgets/snackBar/SnackbarWidget.dart';

class KendaraanController extends GetxController {
  void getRangka(String no_rangka) async {
    CariKendaraanProvider().getKendaraan(no_rangka).then((value) {
      if (value.statusCode == 404) {
        SnackBarWidget().snackBarError("Nomor Rangka tidak ditemukan..");
      } else {
        Get.to(ResultSearchHistoryService(
          no_rangka: no_rangka,
          id_kendaraan: value.body['data']['uuid'],
          date: value.body['data']['tahun_produksi'],
          tipe_mobil: value.body['data']['tipe_mobil'],
          warna: value.body['data']['warna'],
        ));
      }
    });
  }
}
