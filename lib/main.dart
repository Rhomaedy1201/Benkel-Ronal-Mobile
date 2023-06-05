import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:pemesanan_service_mobil/app/internet_injection/depedency_injection.dart';
import 'package:pemesanan_service_mobil/app/pages/main/SplaceScreen.dart';

void main() {
  runApp(const MyApp());
  DepedencyInjection.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      defaultTransition: Transition.size,
      debugShowCheckedModeBanner: false,
      title: "Service Mobil",
      home: SplaceScreen(),
    );
  }
}
