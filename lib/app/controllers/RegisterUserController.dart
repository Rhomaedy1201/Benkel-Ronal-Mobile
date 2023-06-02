import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemesanan_service_mobil/app/Providers/registerUserProvider.dart';
import 'package:pemesanan_service_mobil/app/auth/loginPage.dart';
import 'package:pemesanan_service_mobil/app/models/user.dart';

class RegisterUserController {
  var users = List<User>.empty().obs;

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
            Get.offAll(LoginPage());
          }
          print(value.body);
        });
      } else {
        snackBarError("Masukkan email yg valid");
      }
    } else {
      snackBarError("Semua data harus di isi");
    }
  }
}
