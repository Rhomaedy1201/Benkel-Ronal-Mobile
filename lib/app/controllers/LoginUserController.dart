import 'package:pemesanan_service_mobil/app/Providers/loginUserProvider.dart';
import 'package:pemesanan_service_mobil/app/models/loginModel.dart';
import 'package:get/get.dart';
import 'package:pemesanan_service_mobil/app/pages/main/HomePage.dart';
import 'package:pemesanan_service_mobil/app/pages/widgets/snackBar/SnackbarWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginUserController {
  var login_model = List<LoginModel>.empty().obs;

  void loginUser(String email, String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // cek inputan kosong apa tidak
    if (email != '' && password != '') {
      if (email.contains("@")) {
        login_model.add(
          LoginModel(
            email: email,
            password: password,
          ),
        );
        LoginUserProvider().loginUser(email, password).then((value) {
          // validasi response berhasil apa tidak
          if (value.body['success'] == true) {
            // simpan ke sharedPreferences
            prefs.setString('uuid', '${value.body['data']['user']['uuid']}');
            prefs.setString('token', '${value.body['data']['token']}');
            // cek role user apakah customer atau Service Advisor
            SnackBarWidget().snackBarSuccess("${value.body['message']}");
            if (value.body['data']['user']['role_id'] == 1) {
              Get.offAll(HomePage());
              SnackBarWidget().snackBarSuccess("CUSTOMER");
            } else {
              SnackBarWidget().snackBarSuccess("SERVICE ADVISOR");
            }
          } else {
            SnackBarWidget().snackBarSuccess("${value.body['message']}");
          }
          print(value.body);
        });
      } else {
        SnackBarWidget().snackBarError("Masukkan Email yang valid!");
      }
    } else {
      SnackBarWidget().snackBarError("Semua data harus di isi!");
    }
  }
}
