import 'package:pemesanan_service_mobil/app/Providers/loginUserProvider.dart';
import 'package:pemesanan_service_mobil/app/models/loginModel.dart';
import 'package:get/get.dart';
import 'package:pemesanan_service_mobil/app/pages/main/HomePage.dart';
import 'package:pemesanan_service_mobil/app/pages/main/HomeServiceAdvisor.dart';
import 'package:pemesanan_service_mobil/app/pages/widgets/snackBar/SnackbarWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginUserController {
  var login_model = List<LoginModel>.empty().obs;
  static bool isLoading = false;

  void loginUser(String email, String password) async {
    isLoading = true;
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
          // isLoading = false;
          if (value.statusCode == 200) {
            // simpan ke sharedPreferences
            prefs.setString('uuid', '${value.body['data']['user']['uuid']}');
            prefs.setString('nama', '${value.body['data']['user']['nama']}');
            prefs.setString('no_hp', '${value.body['data']['user']['no_hp']}');
            prefs.setString('email', '${value.body['data']['user']['email']}');
            prefs.setString(
                'role_id', '${value.body['data']['user']['role_id']}');
            prefs.setString('token', '${value.body['data']['token']}');
            // cek role user apakah customer atau Service Advisor
            SnackBarWidget().snackBarSuccess("${value.body['message']}");
            if (value.body['data']['user']['role_id'] == 1) {
              isLoading = true;
              Get.offAll(const HomePage());
              SnackBarWidget().snackBarSuccess("CUSTOMER");
            } else {
              Get.offAll(const HomeServiceAdvisor());
              SnackBarWidget().snackBarSuccess("SERVICE ADVISOR");
            }
            isLoading = false;
          } else {
            // print(value.body['message']);
            SnackBarWidget().snackBarError("${value.body['message']}");
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
