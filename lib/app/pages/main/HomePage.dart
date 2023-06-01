import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemesanan_service_mobil/app/pages/main/profile/profilePage.dart';
import 'package:pemesanan_service_mobil/app/pages/widgets/car_service_home/carService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final bodyWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  height: 70,
                  decoration: const BoxDecoration(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Hello,",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            width: 200,
                            child: Text(
                              nama,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(ProfilePage());
                        },
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: ExactAssetImage('assets/icons/user.png'),
                              fit: BoxFit.cover,
                            ),
                            color: Color(0xFFEDEDED),
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  height: 160,
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                      image: AssetImage("assets/images/bg_nav_home.png"),
                      fit: BoxFit.fill,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 235, 170, 170),
                        blurRadius: 7,
                        offset: Offset(0, 0), // Shadow position
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Bengkel Ronal".toUpperCase(),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Aplikasi Pemesanan Jasa\nPerbaikan Mobil",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 130,
                          height: 85,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: ExactAssetImage(
                                  'assets/icons/car_service.png'),
                              fit: BoxFit.cover,
                            ),
                            // color: Color(0xFFEDEDED),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  height: 10,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                    color: Color(0xFFD9D9D9),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Car Service",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 500,
                  child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(30),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 5,
                    crossAxisCount: 2,
                    children: <Widget>[
                      CarService().about,
                      CarService().reservasi,
                      CarService().history_service,
                      CarService().whatsapp,
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
