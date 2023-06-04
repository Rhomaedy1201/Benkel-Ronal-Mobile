import 'dart:convert';
import 'dart:developer';

import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pemesanan_service_mobil/app/controllers/tambahKendaraanController.dart';
import 'package:pemesanan_service_mobil/app/pages/widgets/snackBar/SnackbarWidget.dart';
import 'package:pemesanan_service_mobil/app/utils/base_url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ReservasiServicePage extends StatefulWidget {
  const ReservasiServicePage({super.key});

  @override
  State<ReservasiServicePage> createState() => _ReservasiServicePageState();
}

class _ReservasiServicePageState extends State<ReservasiServicePage> {
  List<String> merk_mobil = [
    "Toyota",
    "Daihatsu",
    "Honda",
    "Mitsubishi",
    "Suzuki",
    "Isuzu",
    "Isuzu",
  ];

  String? merkMobil = null;
  TextEditingController modelMobil = TextEditingController(text: '');
  TextEditingController tipeMobil = TextEditingController(text: '');
  String thnProduksi = "0";
  TextEditingController warna = TextEditingController(text: '');
  TextEditingController nomorPolisi = TextEditingController(text: '');
  TextEditingController nomorIdentitas = TextEditingController(text: '');
  String? tglStnk = null;
  String? blnStnk = null;
  String? thnStnk = null;

  @override
  void initState() {
    super.initState();
    getMerkMobil();
  }

  var isLoading = false;
  List<dynamic> result = [];
  void getMerkMobil() async {
    setState(() {
      isLoading = true;
    });
    var response = await http.get(
      Uri.parse("$baseUrl/merk"),
      headers: {'Accept': 'application/json'},
    );
    try {
      if (response.statusCode == 200) {
        var data = json.decode(response.body)['data'];
        setState(() {
          result = data;
        });
        print(result);
      } else {
        log(response.statusCode.toString() + "Cek");
      }
    } catch (e) {
      log(e.toString());
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
          "Reservasi",
          style: TextStyle(
            color: Colors.black,
            fontSize: 19,
          ),
        ),
      ),
      body: isLoading == true
          ? Center(
              child: Container(
                width: 110,
                height: 110,
                child: Lottie.asset("assets/lottie/loading.json"),
              ),
            )
          : ListView(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          SizedBox(height: 13),
                          Text(
                            "Tambah Kendaraan",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Informasi Mobil",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),

                      // Inpututan

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 55,
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xFFACACAC),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                border: OutlineInputBorder(),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              value: merkMobil,
                              hint: const Text("Pilih Merk Mobil"),
                              onChanged: (value) {
                                setState(() {
                                  merkMobil = value as String;
                                });
                              },
                              items: result.isEmpty
                                  ? merk_mobil.map((item) {
                                      return DropdownMenuItem(
                                        child: Text(item.toLowerCase()),
                                        value: item,
                                      );
                                    }).toList()
                                  : result.map((item) {
                                      return DropdownMenuItem(
                                        child: Text(item['nama']
                                            .toString()
                                            .toUpperCase()),
                                        value: item['nama'],
                                      );
                                    }).toList(),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Model Mobil',
                              labelText: 'Model Mobil',
                            ),
                            controller: modelMobil,
                            autocorrect: false,
                          ),
                          // Model Mobil
                          const SizedBox(height: 10),
                          TextField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Tipe Mobil',
                              labelText: 'Tipe Mobil',
                            ),
                            controller: tipeMobil,
                            autocorrect: false,
                          ),
                          const SizedBox(height: 10),
                          // Tahun Produksi
                          SizedBox(
                            height: 55,
                            child: DropdownDatePicker(
                              inputDecoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                ),
                                border: OutlineInputBorder(),
                              ), // optional
                              isDropdownHideUnderline: true, // optional
                              isFormValidator: false, // optional
                              startYear: 1600, // optional
                              endYear: 2050, // optional
                              width: 10, // optional
                              showDay: false,
                              showMonth: false,
                              onChangedYear: (value) {
                                setState(() {
                                  thnProduksi = value as String;
                                });
                              },
                              hintYear: "Tahun Produksi",
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Warna',
                              labelText: 'Warna',
                            ),
                            controller: warna,
                            autocorrect: false,
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Nomer Polisi',
                              labelText: 'Nomer Polisi',
                            ),
                            controller: nomorPolisi,
                            autocorrect: false,
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Nomer Identitas Kendaraan',
                              labelText: 'Nomer Identitas Kendaraan',
                            ),
                            controller: nomorIdentitas,
                            autocorrect: false,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Isi nomer vin/krangka kendaraan untuk cek riwayat service.",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "STNK Berlaku Sampai",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 15),
                      DropdownDatePicker(
                        inputDecoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                            ),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(10))), // optional
                        isDropdownHideUnderline: true, // optional
                        isFormValidator: true, // optional
                        startYear: 2010, // optional
                        endYear: 2050, // optional
                        width: 10, // optional
                        hintDay: "Tanggal",
                        hintMonth: "Bulan",
                        hintYear: "Tahun",
                        dayFlex: 2,
                        monthFlex: 2,
                        yearFlex: 2,
                        onChangedDay: (value) {
                          setState(() {
                            tglStnk = value;
                          });
                        },
                        onChangedMonth: (value) {
                          setState(() {
                            blnStnk = value;
                          });
                        },
                        onChangedYear: (value) {
                          setState(() {
                            thnStnk = value;
                          });
                        },
                      ),

                      // Button
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () async {
                        SharedPreferences spref =
                            await SharedPreferences.getInstance();
                        String? uuid = spref.getString("uuid");
                        if (merkMobil != null) {
                          TambahKendaraanController().addCar(
                            merkMobil!,
                            modelMobil.text,
                            nomorIdentitas.text,
                            uuid!,
                            tipeMobil.text,
                            int.parse(thnProduksi),
                            warna.text,
                            nomorPolisi.text,
                            nomorIdentitas.text,
                            "$thnStnk-$blnStnk-$tglStnk",
                          );
                        } else {
                          SnackBarWidget().snackBarError(
                              "Informasi Tambah Kendaraan harus lengkap");
                        }

                        print(merkMobil);
                      },
                      child: Text('Tambahkan Kendaraan'),
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(Colors.red),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.redAccent),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
