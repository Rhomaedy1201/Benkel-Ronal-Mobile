import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pemesanan_service_mobil/app/pages/serviceAdvisor/service_advisor/detailServiceAdvisor.dart';
import 'package:pemesanan_service_mobil/app/utils/base_url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ServiceAdvisorPage extends StatefulWidget {
  const ServiceAdvisorPage({super.key});

  @override
  State<ServiceAdvisorPage> createState() => _ServiceAdvisorPageState();
}

class _ServiceAdvisorPageState extends State<ServiceAdvisorPage> {
  List<dynamic> list_kendaraan = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMobil();
    print("hello");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  var isLoading;
  void getMobil() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences spref = await SharedPreferences.getInstance();
    String? token = spref.getString('token');
    var response =
        await http.get(Uri.parse("$baseUrl/service/show/all"), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    try {
      if (response.statusCode == 200) {
        var data = json.decode(response.body)['data'];
        setState(() {
          list_kendaraan = data;
        });
        print(data);
      } else {
        print(response.statusCode.toString() + " Cek");
      }
    } catch (e) {
      print(e.toString());
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(
          color: Color(0xFF5D5D5D),
        ),
        title: const Text(
          "History Service Advisor",
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
      ),
      body: isLoading
          ? Center(
              child: Container(
                width: 110,
                height: 110,
                child: Lottie.asset("assets/lottie/loading.json"),
              ),
            )
          : list_kendaraan.isEmpty
              ? Center(child: Text("Data History Service Kosong!"))
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: ListView(
                    children: [
                      const SizedBox(height: 5),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: list_kendaraan.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return InkWell(
                            onTap: () async {
                              final connectivityResult =
                                  await (Connectivity().checkConnectivity());
                              if (connectivityResult ==
                                  ConnectivityResult.none) {
                                print("NO INTERNET");
                              } else {
                                Get.to(DetailServiceAdvisor(
                                  kendaran_merk: list_kendaraan[index]
                                      ['kendaraan']['merk'],
                                  kendaran_model: list_kendaraan[index]
                                      ['kendaraan']['model'],
                                  kendaran_tipe: list_kendaraan[index]
                                      ['kendaraan']['tipe_mobil'],
                                  nama_cus: list_kendaraan[index]['kendaraan']
                                      ['user']['nama'],
                                  nopol: list_kendaraan[index]['kendaraan']
                                      ['nopol'],
                                  tanggal: list_kendaraan[index]['tanggal'],
                                  service_advisor: list_kendaraan[index]
                                      ['service_advisor'],
                                  service_type: list_kendaraan[index]
                                      ['tipe_service'],
                                  warna: list_kendaraan[index]['kendaraan']
                                      ['warna'],
                                ));
                              }
                            },
                            child: Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    list_kendaraan[index]
                                                            ['kendaraan']
                                                        ['tipe_mobil'],
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Text(
                                                    list_kendaraan[index]
                                                        ['kendaraan']['model'],
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              // daftar_service[index].tanggal!.toUpperCase(),
                                              list_kendaraan[index]['tanggal']
                                                  .toUpperCase(),
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Container(
                                          width: double.infinity,
                                          height: 3,
                                          color: Color(0xFFD7E2E6),
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 110,
                                              // color: Colors.amber,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const SizedBox(height: 3),
                                                  Text(
                                                    "Warna",
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Text(
                                                    "Serivce Type",
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 140,
                                              // color: Colors.amber,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const SizedBox(height: 3),
                                                  Text(
                                                    list_kendaraan[index]
                                                        ['kendaraan']['warna'],
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Text(
                                                    list_kendaraan[index]
                                                        ['tipe_service'],
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20)
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
    );
  }
}
