import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pemesanan_service_mobil/app/pages/main/about/AboutPage.dart';
import 'package:pemesanan_service_mobil/app/pages/main/history/HistoryServicePage.dart';
import 'package:pemesanan_service_mobil/app/pages/main/reservasi/ReservasiServicePage.dart';
import 'package:pemesanan_service_mobil/app/utils/go_to_whatsapp.dart';

class CarService extends StatelessWidget {
  CarService({super.key});

  final about = InkWell(
    onTap: () => {
      Get.to(const AboutPage(), transition: Transition.circularReveal),
    },
    child: Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Color(0xFFE4E4E4),
          ),
          padding: EdgeInsets.all(7),
          child: Lottie.asset("assets/lottie/about.json"),
        ),
        const SizedBox(height: 5),
        const Text(
          "About",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );

  final reservasi = InkWell(
    onTap: () => {
      Get.to(
        const ReservasiServicePage(),
        transition: Transition.circularReveal,
      )
    },
    child: Column(
      children: [
        Container(
          width: 100,
          height: 100,
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
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );

  final history_service = InkWell(
    onTap: () => {
      Get.to(
        const HistoryServicePage(),
        transition: Transition.circularReveal,
      )
    },
    child: Column(
      children: [
        Container(
          width: 100,
          height: 100,
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
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
  final whatsapp = InkWell(
    onTap: () async {
      GoToWhatsApp().launchWhatsApp("message");
    },
    child: Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Color(0xFFE4E4E4),
          ),
          padding: EdgeInsets.all(0),
          child: Lottie.asset("assets/lottie/whatsapp.json"),
        ),
        const SizedBox(height: 5),
        const Text(
          "Whatshapp",
          style: TextStyle(
            fontSize: 17,
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
