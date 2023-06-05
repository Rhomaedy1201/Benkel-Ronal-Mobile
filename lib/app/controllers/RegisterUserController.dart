import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/shared/types.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:pemesanan_service_mobil/app/Providers/registerUserProvider.dart';
import 'package:pemesanan_service_mobil/app/auth/loginPage.dart';
import 'package:pemesanan_service_mobil/app/models/user.dart';

class RegisterUserController extends GetxController {
  var users = List<User>.empty().obs;
  var status = 422;

  void dialog(BuildContext context) {
    Dialogs.materialDialog(
        color: Colors.white,
        msg: 'Silahkan Cek Verifikasi Ke Email',
        title: 'Register Berhasil',
        lottieBuilder: Lottie.asset(
          'assets/lottie/success.json',
          fit: BoxFit.contain,
        ),
        customViewPosition: CustomViewPosition.BEFORE_ACTION,
        context: context,
        onClose: (value) {
          Get.offAll(LoginPage());
        },
        actions: [
          IconsButton(
            onPressed: () {
              Get.offAll(LoginPage());
            },
            text: 'Oke',
            iconData: Icons.done,
            color: Colors.green,
            textStyle: TextStyle(color: Colors.white),
            iconColor: Colors.white,
          ),
        ]);
  }

  void snackBarError(String msg) {
    Get.snackbar(
      "Error",
      msg,
      duration: const Duration(seconds: 2),
    );
  }

  void snackBarSuccess(String msg) {
    Get.snackbar(
      "Success",
      msg,
      duration: const Duration(seconds: 2),
    );
  }

  void addUser(String nama, String no_hp, String email, String password) {
    if (nama != '' && no_hp != '' && email != '' && password != '') {
      if (email.contains("@")) {
        users.add(
          User(
            uuid: '',
            nama: nama,
            no_hp: no_hp,
            email: email,
            password: password,
          ),
        );
        RegisterUserProvider()
            .postData(nama, "+62$no_hp", email, password, "1")
            .then((value) {
          if (value.statusCode == 200) {
            snackBarSuccess(
                "Berhasil Membuat akun. Verifikasi akun anda sekarang");
            Get.offAll(const LoginPage());
          }
          print("Status $getStatus()");
          // print(value.body);
          // print(value.statusCode);
        });
      } else {
        snackBarError("Masukkan email yg valid");
      }
    } else {
      snackBarError("Semua data harus di isi");
    }
  }

  // int register(String nama, String no_hp, String email, String password) {
  //       users.add(
  //         User(
  //           uuid: '',
  //           nama: nama,
  //           no_hp: no_hp,
  //           email: email,
  //           password: password,
  //         ),
  //       );
  //       RegisterUserProvider()
  //           .postData(nama, "+62$no_hp", email, password, "1")
  //           .then((value) {
  //         if (value.statusCode == 200) {
  //           setStatus(value.statusCode!);
  //           // snackBarSuccess(
  //           //     "Berhasil Membuast akun. Verifikasi akun anda sekarang");
  //           Get.offAll(LoginPage());
  //           return 1;
  //         }
  //         print(value.body);
  //         print(value.statusCode);
  //       }).whenComplete(() => {
  //         print(value.);
  //       });
  // }

  int setStatus(int status) {
    status = status;
    return status;
  }

  int getStatus() {
    return status;
  }
}
