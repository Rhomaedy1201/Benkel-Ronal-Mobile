import 'package:get/get.dart';

class SnackBarWidget {
  void snackBarError(String msg) {
    Get.snackbar(
      "Error",
      msg,
      duration: const Duration(seconds: 3),
    );
  }

  void snackBarSuccess(String msg) {
    Get.snackbar(
      "Success",
      msg,
      duration: const Duration(seconds: 2),
    );
  }
}
