import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemesanan_service_mobil/app/controllers/RegisterUserController.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                  regisUserC.addUser(
                    "${namaC.text}",
                    "${no_hpC.text}",
                    "${emailC.text}",
                    "${passwordC.text}",
                  );
                },
                child: Text(
                  'Register',
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
