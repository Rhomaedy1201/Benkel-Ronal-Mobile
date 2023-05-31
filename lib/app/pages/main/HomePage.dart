import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:pemesanan_service_mobil/app/auth/loginPage.dart';
import 'package:pemesanan_service_mobil/app/pages/widgets/car_service_home/carService.dart';
import 'package:pemesanan_service_mobil/app/pages/widgets/snackBar/SnackbarWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final bodyWidth = MediaQuery.of(context).size.width;
    SharedPreferences prefs;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          const SizedBox(height: 15),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 120,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFCACACA),
                        blurRadius: 7,
                        offset: Offset(0, 0), // Shadow position
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello,",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              width: 200,
                              child: Text(
                                "Muhammad Rhomaedi",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 78,
                          height: 78,
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
                      ],
                    ),
                  ),
                ),
                // const SizedBox(height: 20),
                // Container(
                //   width: double.infinity,
                //   height: 210,
                //   decoration: const BoxDecoration(
                //     borderRadius: BorderRadius.all(Radius.circular(10)),
                //     image: DecorationImage(
                //       image: AssetImage("assets/images/bg_home.jpeg"),
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // ),
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
                SizedBox(
                  width: 100,
                  height: 40,
                  child: InkWell(
                    onTap: () {
                      Dialogs.materialDialog(
                          msg: 'Apakah kamu ingin logout / keluar ?',
                          title: "Logout",
                          color: Colors.white,
                          context: context,
                          actions: [
                            IconsOutlineButton(
                              onPressed: () {
                                Get.back();
                              },
                              text: 'Cancel',
                              iconData: Icons.cancel,
                              textStyle: TextStyle(color: Colors.grey),
                              iconColor: Colors.grey,
                            ),
                            IconsButton(
                              onPressed: () async {
                                prefs = await SharedPreferences.getInstance();
                                await prefs.remove('uuid');
                                await prefs.remove('token');
                                SnackBarWidget()
                                    .snackBarSuccess("Berhasil Logout");
                                Get.offAll(LoginPage());
                              },
                              text: 'Keluar',
                              iconData: Icons.logout,
                              color: Colors.red,
                              textStyle: TextStyle(color: Colors.white),
                              iconColor: Colors.white,
                            ),
                          ]);
                    },
                    child: Text("Logout"),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
