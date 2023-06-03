import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:pemesanan_service_mobil/app/controllers/informasiDataMobilController.dart';
import 'package:pemesanan_service_mobil/app/models/informasiDataMobilModel.dart';
import 'package:pemesanan_service_mobil/app/pages/main/reservasi/ReservasiServiceBooking.dart';
import 'package:pemesanan_service_mobil/app/pages/main/reservasi/ReservasiServicePage.dart';

class InformasiDataMobilPage extends StatefulWidget {
  const InformasiDataMobilPage({super.key});

  @override
  State<InformasiDataMobilPage> createState() => _InformasiDataMobilPageState();
}

class _InformasiDataMobilPageState extends State<InformasiDataMobilPage> {
  InformasiDataMobilController informasiMobil =
      Get.put(InformasiDataMobilController());
  @override
  void initState() {
    super.initState();
    getDataInformasiKendaraan();
  }

  List<InformasiDataMobilModel> list_kendaraan = [];
  Future<void> getDataInformasiKendaraan() async {
    setState(() {});
    list_kendaraan = await informasiMobil.getInformasi();
    setState(() {});
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
          "Informasi Kendaraan",
          style: TextStyle(
            color: Colors.black,
            fontSize: 19,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: list_kendaraan.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Column(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      list_kendaraan[index].merk!,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      list_kendaraan[index].tipeMobil!,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 5,
                                color: Colors.grey,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Nomor Polisi",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFFAFAFAF),
                                          ),
                                        ),
                                        Text(
                                          list_kendaraan[index].nopol!,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Warna",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFFAFAFAF),
                                          ),
                                        ),
                                        Text(
                                          list_kendaraan[index].warna!,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 5,
                                color: Colors.grey,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Nomor Rangka",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFFAFAFAF),
                                          ),
                                        ),
                                        Text(
                                          list_kendaraan[index].nomorRangka!,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Tahun Produksi",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFFAFAFAF),
                                          ),
                                        ),
                                        Text(
                                          list_kendaraan[index].tahunProduksi!,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 5,
                                color: Colors.grey,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Berlaku Sampai",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFFAFAFAF),
                                          ),
                                        ),
                                        Text(
                                          (list_kendaraan[index].masaStnk ==
                                                      '' ||
                                                  list_kendaraan[index]
                                                          .masaStnk ==
                                                      null)
                                              ? "-"
                                              : list_kendaraan[index].masaStnk!,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20)
                      ],
                    );
                  }),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(ReservasiServicePage());
                    },
                    child: Text('Tambah Kendaraan'),
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.red),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.redAccent),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                SizedBox(
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(ReservasiServiceBooking());
                    },
                    child: Text('Reservasi Service'),
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.red),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.redAccent),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
