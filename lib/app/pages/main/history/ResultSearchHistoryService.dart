import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pemesanan_service_mobil/app/controllers/ServiceController.dart';
import 'package:pemesanan_service_mobil/app/models/Service.dart';

class ResultSearchHistoryService extends StatefulWidget {
  const ResultSearchHistoryService(
      {super.key,
      required String this.id_kendaraan,
      required String this.no_rangka,
      required String this.date,
      required String this.tipe_mobil,
      required String this.warna});

  @override
  State<ResultSearchHistoryService> createState() =>
      _ResultSearchHistoryServiceState();
  final String no_rangka;
  final String id_kendaraan;
  final String date;
  final String tipe_mobil;
  final String warna;
}

class _ResultSearchHistoryServiceState
    extends State<ResultSearchHistoryService> {
  ServiceController serviceController = Get.put(ServiceController());
  @override
  bool isLoad = true;
  void initState() {
    // TODO: implement initState
    super.initState();
    getService();
    print("Daftar Service " + daftar_service.toString());
  }

  List<Service> daftar_service = [];
  Future<void> getService() async {
    setState(() {
      isLoad = true;
    });
    daftar_service =
        await serviceController.getServiceData(widget.id_kendaraan);
    setState(() {
      isLoad = false;
    });
  }

  Widget build(BuildContext context) {
    ScrollController _controller = new ScrollController();
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
          "History Service",
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
      ),
      body: isLoad
          ? Center(
              child: Container(
                width: 110,
                height: 110,
                child: Lottie.asset("assets/lottie/loading.json"),
              ),
            )
          : daftar_service.isEmpty
              ? Center(
                  child: Text("History Kosong"),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: ListView(
                    children: [
                      Text(
                        widget.tipe_mobil,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.date,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        widget.no_rangka,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.warna.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 15),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: daftar_service.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return Column(
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
                                      Text(
                                        daftar_service[index]
                                            .tanggal!
                                            .toUpperCase(),
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                17,
                                            child: GridView(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2),
                                              children: [
                                                Text(
                                                  "Service Type: "
                                                      .toUpperCase(),
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  daftar_service[index]
                                                      .tipe_service!
                                                      .toUpperCase(),
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                33,
                                            child: GridView(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2),
                                              children: [
                                                Text(
                                                  "Odometer ".toUpperCase(),
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  daftar_service[index]
                                                      .odometer!
                                                      .toUpperCase(),
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                33,
                                            child: GridView(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2),
                                              children: [
                                                Text(
                                                  "Service advisor "
                                                      .toUpperCase(),
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  daftar_service[index]
                                                      .service_advisor!
                                                      .toUpperCase(),
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            "Sparepart Pengganti \n${daftar_service[index].part_pengganti!}"
                                                .toUpperCase(),
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          const SizedBox(height: 10),
                                          Container(
                                            width: double.infinity,
                                            padding: const EdgeInsets.all(10),
                                            color: const Color(0xFFB9B9B9),
                                            child: Text(
                                              "Detail : \n${daftar_service[index].detail!}",
                                              style: const TextStyle(
                                                fontSize: 13,
                                                color: Color(0xFFE61F11),
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20)
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
    );
  }
}
