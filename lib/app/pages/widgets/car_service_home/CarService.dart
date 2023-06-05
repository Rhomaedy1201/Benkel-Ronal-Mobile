import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pemesanan_service_mobil/app/pages/main/about/AboutPage.dart';
import 'package:pemesanan_service_mobil/app/pages/main/history/HistoryServicePage.dart';
import 'package:pemesanan_service_mobil/app/pages/main/reservasi/InformasiDataMobilPage.dart';
import 'package:pemesanan_service_mobil/app/utils/go_to_whatsapp.dart';

class CarService extends StatelessWidget {
  CarService({super.key});

  final about = InkWell(
      onTap: () async {
        final connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.none) {
          print("NO INTERNET");
        } else {
          Get.to(const AboutPage(), transition: Transition.circularReveal);
        }
      },
      child: Container(
        child: Column(
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Color(0xFFE4E4E4),
              ),
              padding: EdgeInsets.all(5),
              child: Lottie.asset("assets/lottie/about.json"),
            ),
            const SizedBox(height: 1),
            const Text(
              "About",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ));

  final reservasi = InkWell(
    onTap: () async {
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        print("NO INTERNET");
      } else {
        Get.to(
          const InformasiDataMobilPage(),
          transition: Transition.circularReveal,
        );
      }
    },
    child: Column(
      children: [
        Container(
          width: 90,
          height: 90,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Color(0xFFE4E4E4),
          ),
          padding: EdgeInsets.all(0),
          child: Lottie.asset("assets/lottie/reservasi.json"),
        ),
        const SizedBox(height: 5),
        const Text(
          "Reservasi",
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );

  final history_service = InkWell(
    onTap: () async {
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        print("NO INTERNET");
      } else {
        Get.to(
          const HistoryServicePage(),
          transition: Transition.circularReveal,
        );
      }
    },
    child: Column(
      children: [
        Container(
          width: 90,
          height: 90,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Color(0xFFE4E4E4),
          ),
          padding: EdgeInsets.all(0),
          child: Lottie.asset("assets/lottie/history_service.json"),
        ),
        const SizedBox(height: 5),
        const Text(
          "Histori Service",
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
  final whatsapp = InkWell(
    onTap: () async {
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        print("NO INTERNET");
      } else {
        GoToWhatsApp().launchWhatsApp("message");
      }
    },
    child: Column(
      children: [
        Container(
          width: 90,
          height: 90,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Color(0xFFE4E4E4),
          ),
          padding: EdgeInsets.all(0),
          child: Lottie.asset("assets/lottie/whatsapp.json"),
        ),
        const SizedBox(height: 5),
        const Text(
          "WhatsApp",
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
