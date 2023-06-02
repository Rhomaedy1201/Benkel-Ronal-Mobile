import 'package:get/get.dart';
import 'package:pemesanan_service_mobil/app/Providers/tambahKendaraanProvieder.dart';
import 'package:pemesanan_service_mobil/app/models/tambahKendaraanModel.dart';
import 'package:pemesanan_service_mobil/app/pages/main/reservasi/InformasiDataMobilPage.dart';
import 'package:pemesanan_service_mobil/app/pages/widgets/snackBar/SnackbarWidget.dart';

class TambahKendaraanController {
  var tambah_kendaraan = List<TambahKendaraanModel>.empty().obs;

  void addCar(
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
  ) {
    if (merk != '' &&
        model_id != null &&
        nomor_rangka != '' &&
        user_id != null &&
        tipe_mobil != '' &&
        tahun_produksi != 0 &&
        warna != '' &&
        nopol != '' &&
        nomor_stnk != '' &&
        masa_stnk != null) {
      tambah_kendaraan.add(
        TambahKendaraanModel(
          merk: merk,
          model_id: model_id,
          nomor_rangka: nomor_rangka,
          user_id: user_id,
          tipe_mobil: tipe_mobil,
          tahun_produksi: tahun_produksi,
          warna: warna,
          nopol: nopol,
          nomor_stnk: nomor_stnk,
          masa_stnk: masa_stnk,
        ),
      );
      TambahKendaraanProvider()
          .postData(merk, model_id, nomor_rangka, user_id, tipe_mobil,
              tahun_produksi, warna, nopol, nomor_stnk, masa_stnk)
          .then((response) {
        if (response.statusCode == 200) {
          SnackBarWidget().snackBarSuccess("Berhasil Menambahkan Kendaraan");
          Get.to(InformasiDataMobilPage());
        }
        print(response.body);
      });
    } else {
      SnackBarWidget()
          .snackBarError("Informasi Tambah Kendaraan harus lengkap");
    }
  }
}
