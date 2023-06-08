import 'dart:io';

import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class GoToWhatsApp {
  String phoneNumber = '+6282154885221';

  Future<void> launchWhatsApp(
    String message,
  ) async {
    String url;
    if (Platform.isAndroid) {
      launchUrl(Uri.parse("https://wa.me/$phoneNumber"),
          mode: LaunchMode.externalApplication);
    } else {
      url = "https://api.whatsapp.com/send?phone=$phoneNumber=HelloIphone";
    }

    // print(url);

    // if (await canLaunchUrlString(url)) {
    //   await launchUrlString(url);
    // } else {
    //   print("Tidak bisa buka Whatsapp");
    // }
  }
}
