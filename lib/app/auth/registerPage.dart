import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/shared/types.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:pemesanan_service_mobil/app/Providers/registerUserProvider.dart';
import 'package:pemesanan_service_mobil/app/auth/loginPage.dart';
import 'package:pemesanan_service_mobil/app/controllers/RegisterUserController.dart';
import 'package:pemesanan_service_mobil/app/models/user.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var isLoading = false;
  var users = List<User>.empty().obs;

  void dialog() {
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
      duration: const Duration(seconds: 5),
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
            dialog();
          } else {
            setState(() {
              isLoading = false;
            });
            snackBarError(value.body['message']);
          }

          print(value.body);
          // print(value.statusCode);
        });
      } else {
        snackBarError("Masukkan email yg valid");
      }
    } else {
      snackBarError("Semua data harus di isi");
    }
  }

  @override
  Widget build(BuildContext context) {
    // Editing Controller
    TextEditingController namaC = TextEditingController(text: '');
    TextEditingController no_hpC = TextEditingController(text: '');
    TextEditingController emailC = TextEditingController(text: '');
    TextEditingController passwordC = TextEditingController(text: '');
    // Calling RegisterUserController
    RegisterUserController regisUserC = RegisterUserController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(
          color: Color(0xFF5D5D5D),
        ),
        title: const Text(
          "Register",
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            TextField(
              controller: namaC,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Nama Anda',
                labelText: "Masukkan Nama Anda",
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: no_hpC,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Nomor Telepon',
                  labelText: "Masukkan Nomor Telepon",
                  prefixText: "+62  "),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: emailC,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Email',
                labelText: "Masukkan Email",
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordC,
              obscureText: true,
              obscuringCharacter: "*",
              autocorrect: false,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Password',
                labelText: "Masukkan Password",
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  final connectivityResult =
                      await (Connectivity().checkConnectivity());
                  if (connectivityResult == ConnectivityResult.none) {
                    print("NO INTERNET");
                  } else {
                    setState(() {
                      isLoading = true;
                    });

                    addUser(
                      "${namaC.text}",
                      "${no_hpC.text}",
                      "${emailC.text}",
                      "${passwordC.text}",
                    );

                    print(namaC.text);
                    print(no_hpC.text);
                    print(emailC.text);
                    print(passwordC.text);
                  }
                },
                child: Text(
                  isLoading ? 'Loading...' : 'Register',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.red),
                  backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
