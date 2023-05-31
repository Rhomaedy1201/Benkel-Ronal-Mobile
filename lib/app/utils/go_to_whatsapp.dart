import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

class GoToWhatsApp {
  String phoneNumber = '+6285259822974';

  Future<void> launchWhatsApp(
    String message,
  ) async {
    String url;
    if (Platform.isAndroid) {
      url = "https://api.whatsapp.com/send/?phone=$phoneNumber&text=Hello";
    } else if (Platform.isIOS) {
      url = "whatsapp://wa.me/$phoneNumber/?text=Hello";
    } else {
      url = "https://api.whatsapp.com/send/?phone=$phoneNumber&text=Hello";
    }

    print(url);

    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalNonBrowserApplication)) {
      // throw "Could not launch $url";
      await launchUrl(Uri.parse(url));
    } else {
      print("Salah");
    }
  }
}
