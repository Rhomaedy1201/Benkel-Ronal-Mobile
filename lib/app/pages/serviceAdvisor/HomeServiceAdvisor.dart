import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:pemesanan_service_mobil/app/pages/widgets/dialog/dialogWidget.dart';
import 'package:pemesanan_service_mobil/app/pages/widgets/menu_home_advisor/menuHomeAdvisor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeServiceAdvisor extends StatefulWidget {
  const HomeServiceAdvisor({super.key});

  @override
  State<HomeServiceAdvisor> createState() => _HomeServiceAdvisorState();
}

class _HomeServiceAdvisorState extends State<HomeServiceAdvisor> {
  String nama = '';
  late SharedPreferences spref;
  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    spref = await SharedPreferences.getInstance();
    String? nama = spref.getString('nama');
    if (nama == null) return;
    setState(() {
      this.nama = nama;
      print(this.nama);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Colors.red,
          ),
          elevation: 1,
          title: const Text(
            "HOME ADVISOR",
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  final connectivityResult =
                      await (Connectivity().checkConnectivity());
                  if (connectivityResult == ConnectivityResult.none) {
                    print("NO INTERNET");
                  } else {
                    DialogWidget().dialogLogout(context);
                  }
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: ListView(children: [
            const SizedBox(height: 5),
            const Text(
              "Selamat Datang",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Color(0xFF6D6D6D),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 7),
            Text(
              nama,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 25),
            Container(
              width: double.infinity,
              height: 500,
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(30),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                crossAxisCount: 2,
                children: <Widget>[
                  MenuHomeAdvisor().merk_mobil,
                  MenuHomeAdvisor().reservasi,
                  MenuHomeAdvisor().history_service,
                ],
              ),
            ),
          ]),
        ));
  }
}
