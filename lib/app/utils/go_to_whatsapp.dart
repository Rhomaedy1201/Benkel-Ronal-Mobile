import 'dart:io';

import 'package:url_launcher/url_launcher_string.dart';

class GoToWhatsApp {
  String phoneNumber = '+6285259822974';

  Future<void> launchWhatsApp(
    String message,
  ) async {
    String url;
    if (Platform.isAndroid) {
      url = "https://api.whatsapp.com/send/?phone=$phoneNumber&text=Hello";
    } else {
      url = "https://api.whatsapp.com/send?phone=$phoneNumber=HelloIphone";
    }

    print(url);

    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      print("Tidak bisa buka Whatsapp");
    }
  }
}
