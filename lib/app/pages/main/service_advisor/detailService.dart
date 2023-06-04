import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:pemesanan_service_mobil/app/pages/main/HomeServiceAdvisor.dart';
import 'package:pemesanan_service_mobil/app/utils/base_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailService extends StatefulWidget {
  const DetailService({super.key, required this.uuid});
  final String uuid;
  @override
  State<DetailService> createState() => _DetailServiceState();
}

class _DetailServiceState extends State<DetailService> {
  Map reservasi = {};
  bool isloading = false;
  TextEditingController _odometer = TextEditingController(text: '');
  TextEditingController _part_pengganti = TextEditingController(text: '-');
  TextEditingController _detail = TextEditingController(text: '-');
  @override
  void initState() {
    super.initState();
    print(widget.uuid);
    getData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void changeOnProcess() async {
    var id = widget.uuid;
    try {
      http.Response response = await http.get(
        Uri.parse("$baseUrl/reservasi/status/$id"),
        headers: {"Accept": "application/json"},
      );
      if (response.statusCode == 200) {
        print(response.body);
        // Navigator.pop(context);
        Get.to(const HomeServiceAdvisor());
      }
      // print(response.body);
    } catch (e) {
      print(e.toString());
    }
  }

  void changeCancelled() async {
    var id = widget.uuid;
    try {
      http.Response response = await http.get(
        Uri.parse("$baseUrl/reservasi/cancel/$id"),
        headers: {"Accept": "application/json"},
      );
      if (response.statusCode == 200) {
        print(response.body);
        // Navigator.pop(context);
        Get.to(const HomeServiceAdvisor());
      }
      // print(response.body);
    } catch (e) {
      print(e.toString());
    }
  }

  void getData() async {
    setState(() {
      isloading = true;
    });
    var id = widget.uuid;
    try {
      http.Response response = await http.get(
        Uri.parse("$baseUrl/reservasi/detail/$id"),
        headers: {"Accept": "application/json"},
      );
      if (response.statusCode == 200) {
        setState(() {
          reservasi = jsonDecode(response.body)['data'];
        });
        print(reservasi['user']['nama']);
      }
      // print(response.body);
    } catch (e) {
      print(e.toString());
    }
    setState(() {
      isloading = false;
    });
  }

  void insertService(
      String detail, String odometer, String part_pengganti) async {
    var id = widget.uuid;
    try {
      SharedPreferences spref = await SharedPreferences.getInstance();
      String? token = await spref.getString('token');
      http.Response response = await http
          .post(Uri.parse("$baseUrl/reservasi/complete/service/$id"), headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      }, body: {
        'odometer': odometer,
        'detail': detail,
        'part_pengganti': part_pengganti,
      });
      if (response.statusCode == 200) {
        Navigator.pop(context);
        print(response.body);
      }
      print(response.body);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget detail() {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 90,
                    // color: Colors.amberAccent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Nama"),
                        const SizedBox(height: 2),
                        Text("Tanggal"),
                        const SizedBox(height: 2),
                        Text("Nomor Hp"),
                        const SizedBox(height: 2),
                        Text("Email"),
                        const SizedBox(height: 2),
                        Text("Jam Antri"),
                        const SizedBox(height: 2),
                        Text("Status"),
                      ],
                    ),
                  ),
                  Container(
                    width: 190,
                    // color: Colors.amberAccent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          reservasi['user']['nama'] ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(reservasi['tanggal']),
                        const SizedBox(height: 2),
                        Text(
                          reservasi['user']['no_hp'],
                        ),
                        const SizedBox(height: 2),
                        Text(
                          reservasi['user']['email'],
                        ),
                        const SizedBox(height: 2),
                        Text(
                          reservasi['jam'],
                        ),
                        const SizedBox(height: 2),
                        Text(
                          reservasi['status'],
                          style: TextStyle(
                            color: reservasi['status'] != "cancelled"
                                ? Colors.black
                                : Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 5,
              color: Colors.black26,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    reservasi['kendaraan']['model'],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    reservasi['kendaraan']['tipe_mobil'],
                  ),
                  SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 110,
                        // color: Colors.amberAccent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Nomor Polisi"),
                            const SizedBox(height: 2),
                            Text("Warna"),
                            const SizedBox(height: 2),
                            Text("No Rangka"),
                            const SizedBox(height: 2),
                            Text("Thn Produksi"),
                            const SizedBox(height: 2),
                            Text("Kendala"),
                          ],
                        ),
                      ),
                      Container(
                        width: 200,
                        // color: Colors.amberAccent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              reservasi['kendaraan']['nopol'],
                            ),
                            const SizedBox(height: 2),
                            Text(reservasi['kendaraan']['warna']),
                            const SizedBox(height: 2),
                            Text(
                              reservasi['kendaraan']['nomor_rangka'],
                            ),
                            const SizedBox(height: 2),
                            Text(
                              reservasi['kendaraan']['tahun_produksi'],
                            ),
                            const SizedBox(height: 2),
                            Text(
                              reservasi['keluhan'],
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  //OnProses
                  const SizedBox(height: 20),
                  // Text(
                  //     "#### detail jika ditampilan OnProgress muncul btn ini, inputan dan btn yg bawah hilang ####"),
                  reservasi['status'] != 'onprocess' &&
                          reservasi['status'] != 'cancelled' &&
                          reservasi['status'] != 'done'
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                changeOnProcess();
                              },
                              child: Text(
                                'Terima',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(
                                    Colors.greenAccent),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.green),
                              ),
                            ),
                            const SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {
                                changeCancelled();
                              },
                              child: Text(
                                'Batal/Tolak',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              style: ButtonStyle(
                                overlayColor:
                                    MaterialStateProperty.all(Colors.red),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.redAccent),
                              ),
                            ),
                          ],
                        )
                      : SizedBox(),

                  //waiting
                  // Text(
                  //     "#### detail jika ditampilan Waiting muncul inputan dan btn ini, untuk btn yg atas hilang ####"),

                  reservasi['status'] != 'waiting' &&
                          reservasi['status'] != 'cancelled' &&
                          reservasi['status'] != 'done'
                      ? Column(
                          children: [
                            SizedBox(height: 20),
                            Text("Inputkan Sparepart yang Di Ganti :"),
                            TextField(
                              keyboardType: TextInputType.multiline,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Masukkan List Sparepart yg di ganti',
                              ),
                              autocorrect: false,
                              maxLines: null,
                              controller: _part_pengganti,
                            ),
                          ],
                        )
                      : SizedBox(),

                  SizedBox(
                    height: MediaQuery.of(context).size.height / 40,
                  ),
                  reservasi['status'] != 'waiting' &&
                          reservasi['status'] != 'cancelled' &&
                          reservasi['status'] != 'done'
                      ? Column(
                          children: [
                            TextField(
                              keyboardType: TextInputType.multiline,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Odometer',
                              ),
                              autocorrect: false,
                              maxLines: null,
                              controller: _odometer,
                            ),
                          ],
                        )
                      : SizedBox(),

                  SizedBox(
                    height: MediaQuery.of(context).size.height / 40,
                  ),
                  reservasi['status'] != 'waiting' &&
                          reservasi['status'] != 'cancelled' &&
                          reservasi['status'] != 'done'
                      ? Column(
                          children: [
                            TextField(
                              keyboardType: TextInputType.multiline,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Detail',
                              ),
                              autocorrect: false,
                              maxLines: null,
                              controller: _detail,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                insertService(_detail.text, _odometer.text,
                                    _part_pengganti.text);
                              },
                              child: Text(
                                'Selesai',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(
                                    Colors.greenAccent),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.green),
                              ),
                            ),
                          ],
                        )
                      : SizedBox(),

                  //Done
                ],
              ),
            ),
          ],
        ),
      );
      const SizedBox(height: 10);
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(
          color: Color(0xFF5D5D5D),
        ),
        title: const Text(
          "Detail Service Customer",
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            isloading
                ? Center(
                    child: Container(
                      width: 110,
                      height: 110,
                      child: Lottie.asset("assets/lottie/loading.json"),
                    ),
                  )
                : detail(),
          ],
        ),
      ),
    );
  }
}
