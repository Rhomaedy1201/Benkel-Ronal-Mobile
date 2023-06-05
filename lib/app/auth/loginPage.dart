import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemesanan_service_mobil/app/auth/registerPage.dart';
import 'package:pemesanan_service_mobil/app/controllers/LoginUserController.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _emailControll = TextEditingController(text: '');
    TextEditingController _passControll = TextEditingController(text: '');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 180,
                  height: 190,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage('assets/icons/logo.jpg'),
                      fit: BoxFit.fill,
                    ),
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Masuk Sekarang",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: _emailControll,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Email',
                    labelText: "Masukkan Email",
                  ),
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: _passControll,
                  obscureText: true,
                  obscuringCharacter: "*",
                  autocorrect: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                    labelText: "Masukkan Password",
                  ),
                ),
                const SizedBox(height: 25),
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
                        LoginUserController().loginUser(
                          '${_emailControll.text}',
                          '${_passControll.text}',
                        );
                      }
                    },
                    child: (LoginUserController.isLoading == true)
                        ? Text("Loading...")
                        : Text(
                            'Masuk',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.red),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.redAccent),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Belum punya akun? ',
                      style: TextStyle(
                        color: Color(0xFF6E6E6E),
                        fontSize: 15,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        final connectivityResult =
                            await (Connectivity().checkConnectivity());
                        if (connectivityResult == ConnectivityResult.none) {
                          print("NO INTERNET");
                        } else {
                          Get.to(RegisterPage());
                        }
                      },
                      child: const Text(
                        'Buat Akun Sekarang',
                        style: TextStyle(
                          color: Color(0xFF3F74BF),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
