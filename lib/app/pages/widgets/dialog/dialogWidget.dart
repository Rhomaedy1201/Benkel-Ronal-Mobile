import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:pemesanan_service_mobil/app/auth/loginPage.dart';
import 'package:pemesanan_service_mobil/app/pages/widgets/snackBar/SnackbarWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DialogWidget {
  // Dilog logout and remove SharedPreferences
  void dialogLogout(BuildContext context) {
    SharedPreferences prefs;
    Dialogs.materialDialog(
        msg: 'Apakah kamu ingin logout / keluar ?',
        title: "Logout",
        color: Colors.white,
        context: context,
        actions: [
          IconsOutlineButton(
            onPressed: () {
              Get.back();
            },
            text: 'Cancel',
            iconData: Icons.cancel,
            textStyle: TextStyle(color: Colors.grey),
            iconColor: Colors.grey,
          ),
          IconsButton(
            onPressed: () async {
              prefs = await SharedPreferences.getInstance();
              await prefs.remove('uuid');
              await prefs.remove('nama');
              await prefs.remove('no_hp');
              await prefs.remove('email');
              await prefs.remove('role_id');
              await prefs.remove('token');
              SnackBarWidget().snackBarSuccess("Berhasil Logout");
              Get.offAll(LoginPage());
            },
            text: 'Keluar',
            iconData: Icons.logout,
            color: Colors.red,
            textStyle: TextStyle(color: Colors.white),
            iconColor: Colors.white,
          ),
        ]);
  }
}
