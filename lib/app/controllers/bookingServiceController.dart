import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:pemesanan_service_mobil/app/Providers/bookingServiceProvider.dart';
import 'package:pemesanan_service_mobil/app/models/bookingServiceModel.dart';
import 'package:pemesanan_service_mobil/app/pages/main/HomePage.dart';
import 'package:pemesanan_service_mobil/app/pages/widgets/snackBar/SnackbarWidget.dart';

class BookingServiceController {
  var booking_service = List<BookingServiceModel>.empty().obs;
  static bool isLoading = false;

  void postData(
    String kendaraan_id,
    String user_id,
    String detail_service,
    String tanggal,
    String jam,
    String keluhan,
    BuildContext context,
  ) {
    if (kendaraan_id != '' &&
        user_id != '' &&
        detail_service != null &&
        tanggal != '2022-12-29' &&
        jam != '00:00' &&
        keluhan != '') {
      booking_service.add(BookingServiceModel(
        kendaraan_id: kendaraan_id,
        user_id: user_id,
        detail_service: detail_service,
        tanggal: tanggal,
        jam: jam,
        keluhan: keluhan,
      ));
      isLoading = true;
      BookingServiceProvicer()
          .postData(
              kendaraan_id, user_id, detail_service, tanggal, jam, keluhan)
          .then((value) {
        if (value.statusCode == 200) {
          SnackBarWidget()
              .snackBarSuccess("Berhasil Booking Service Kendaraan..");
          Get.back();
          showDialog(
            context: context,
            barrierColor: Colors.transparent,
            builder: (context) {
              Future.delayed(
                const Duration(seconds: 2),
                () {
                  Get.back();
                  Dialogs.materialDialog(
                      title: "Apakah Anda Ingin Menambahkan Booking Lagi ?",
                      titleAlign: TextAlign.center,
                      color: Colors.white,
                      context: context,
                      actions: [
                        IconsOutlineButton(
                          onPressed: () {
                            Get.offAll(HomePage());
                            isLoading = false;
                          },
                          text: 'Tidak',
                          iconData: Icons.cancel,
                          textStyle: TextStyle(color: Colors.grey),
                          iconColor: Colors.grey,
                        ),
                        IconsButton(
                          onPressed: () async {
                            Get.back();
                            isLoading = false;
                            // value_service_berkala = null;
                          },
                          text: 'Iya',
                          iconData: Icons.done,
                          color: Colors.green,
                          textStyle: TextStyle(color: Colors.white),
                          iconColor: Colors.white,
                        ),
                      ]);
                },
              );
              return AlertDialog(
                backgroundColor: Color(0x890F0F0F),
                actions: [
                  Column(
                    children: [
                      Container(
                        width: 270,
                        height: 50,
                        child: Lottie.asset("assets/lottie/success.json"),
                      ),
                      const SizedBox(height: 7),
                      const Text(
                        "Berhasil Booking Reservasi Kendaraan",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFDEDEDE),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  )
                ],
              );
            },
          );
        } else {
          SnackBarWidget().snackBarError(
              "Reservasi hanya dibatasi 3 kali untuk setiap user");
          isLoading = false;
        }
        print(value.body);
      });
    } else {
      SnackBarWidget().snackBarError("Semua Data Wajib Di Isi");
      isLoading = false;
    }
  }
}
