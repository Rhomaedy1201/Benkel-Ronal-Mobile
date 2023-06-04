import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:pemesanan_service_mobil/app/pages/serviceAdvisor/reservasi_advisor/detailReservasiAdvisor.dart';
import 'package:pemesanan_service_mobil/app/utils/base_url.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DataReservasi extends StatefulWidget {
  const DataReservasi({super.key, required this.status});
  final String status;
  @override
  State<DataReservasi> createState() => _DataReservasiState();
}

class _DataReservasiState extends State<DataReservasi> {
  var isLoading = false;
  List reservasi = [];
  @override
  void initState() {
    super.initState();
    print(widget.status);
    getData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getData() async {
    setState(() {
      isLoading = true;
    });
    var status = widget.status;
    try {
      http.Response response = await http.get(
        Uri.parse("$baseUrl/reservasi/$status"),
        headers: {"Accept": "application/json"},
      );
      if (response.statusCode == 200) {
        setState(() {
          reservasi = jsonDecode(response.body)['data'];
        });
        print("Data " + reservasi.toString());
      }
      // print(response.body);
    } catch (e) {
      print(e.toString());
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: isLoading
              ? Center(
                  child: Container(
                    width: 110,
                    height: 110,
                    child: Lottie.asset("assets/lottie/loading.json"),
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: reservasi.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext ctx, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(DetailReservasiAdvisor(
                            uuid: reservasi[index]['id']!));
                      },
                      child: Column(
                        children: [
                          Container(
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
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.3,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                20,
                                        child: GridView(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2),
                                          children: [
                                            Text(
                                              "Nama ".toUpperCase(),
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              reservasi[index]['user']['nama']!
                                                  .toUpperCase(),
                                              maxLines: 10,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.3,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                33,
                                        child: GridView(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2),
                                          children: [
                                            Text(
                                              "tanggal".toUpperCase(),
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              reservasi[index]['tanggal']!
                                                  .toUpperCase(),
                                              maxLines: 10,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.3,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                33,
                                        child: GridView(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2),
                                          children: [
                                            Text(
                                              "Jam antri ".toUpperCase(),
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              reservasi[index]['jam']!
                                                  .toUpperCase(),
                                              maxLines: 10,
                                              style: const TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.3,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                33,
                                        child: GridView(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2),
                                          children: [
                                            Text(
                                              "Status ".toUpperCase(),
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              reservasi[index]['status']!
                                                  .toUpperCase(),
                                              maxLines: 10,
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: reservasi[index]
                                                            ['status'] !=
                                                        "cancelled"
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
                                // Padding(
                                //   padding: const EdgeInsets.all(8.0),
                                //   child: Row(
                                //     crossAxisAlignment: CrossAxisAlignment.start,
                                //     children: const [
                                //       // Container(
                                //       //   width: 90,
                                //       //   // color: Colors.amberAccent,
                                //       //   child: Column(
                                //       //     crossAxisAlignment: CrossAxisAlignment.start,
                                //       //     children: [
                                //       //       Text("Nama"),
                                //       //       const SizedBox(height: 2),
                                //       //       Text("Tanggal"),
                                //       //       const SizedBox(height: 2),
                                //       //       Text("Jam Antri"),
                                //       //       const SizedBox(height: 2),
                                //       //       Text("Status"),
                                //       //     ],
                                //       //   ),
                                //       // ),
                                //       // Container(
                                //       //   width: 190,
                                //       //   // color: Colors.amberAccent,
                                //       //   child: Column(
                                //       //     crossAxisAlignment: CrossAxisAlignment.start,
                                //       //     children: [
                                //       //       Text(
                                //       //         "Muhammad Rhomaedi",
                                //       //         maxLines: 1,
                                //       //         overflow: TextOverflow.ellipsis,
                                //       //       ),
                                //       //       const SizedBox(height: 2),
                                //       //       Text("22-01-2023"),
                                //       //       const SizedBox(height: 2),
                                //       //       Text("10:30:00"),
                                //       //       const SizedBox(height: 2),
                                //       //       Text("on proses"),
                                //       //     ],
                                //       //   ),
                                //       // ),
                                //     ],
                                //   ),
                                // ),
                                Container(
                                  width: double.infinity,
                                  height: 5,
                                  color: Colors.black26,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(reservasi[index]['kendaraan']
                                          ['model']!),
                                      const SizedBox(height: 2),
                                      Text(reservasi[index]['kendaraan']
                                          ['tipe_mobil']!),
                                      SizedBox(height: 10),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.3,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                33,
                                        child: GridView(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2),
                                          children: [
                                            Text(
                                              "Nomor Polisi ".toUpperCase(),
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              reservasi[index]['kendaraan']
                                                      ['nopol']!
                                                  .toUpperCase(),
                                              maxLines: 10,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.3,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                33,
                                        child: GridView(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2),
                                          children: [
                                            Text(
                                              "Warna".toUpperCase(),
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              reservasi[index]['kendaraan']
                                                      ['warna']!
                                                  .toUpperCase(),
                                              maxLines: 10,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.3,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                33,
                                        child: GridView(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2),
                                          children: [
                                            Text(
                                              "Keluhan ".toUpperCase(),
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              reservasi[index]['keluhan']!
                                                  .toUpperCase(),
                                              maxLines: 10,
                                              style: const TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10)
                        ],
                      ),
                    );
                  }),
        ),
      ],
    );
  }
}
