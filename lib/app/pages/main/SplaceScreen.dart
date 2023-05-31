import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemesanan_service_mobil/app/auth/loginPage.dart';
import 'package:pemesanan_service_mobil/app/pages/main/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({super.key});

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
  @override
  void initState() {
    super.initState();
    _cekDataUser();
  }

  void _cekDataUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Timer(Duration(seconds: 3), () {
      if (prefs.getString('uuid') != null) {
        Get.offAll(HomePage());
      } else {
        Get.offAll(LoginPage());
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 185,
                height: 195,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('assets/icons/logo.jpg'),
                    fit: BoxFit.fill,
                  ),
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
