import 'dart:convert';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:pemesanan_service_mobil/app/pages/widgets/snackBar/SnackbarWidget.dart';
import 'package:pemesanan_service_mobil/app/utils/base_url.dart';

class MerkMobilPage extends StatefulWidget {
  const MerkMobilPage({super.key});

  @override
  State<MerkMobilPage> createState() => _MerkMobilPageState();
}

class _MerkMobilPageState extends State<MerkMobilPage> {
  var controllerMerk = TextEditingController(text: '');
  @override
  void initState() {
    super.initState();
    getMerkMobil();
  }

  var isLoading = false;
  List<dynamic> list_merk = [];
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
          list_merk = data;
        });
        print(list_merk);
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

  void postMerk() async {
    setState(() {
      isLoading = true;
    });
    var response = await http.post(
      Uri.parse("$baseUrl/merk/insert"),
      body: {
        "nama": controllerMerk.text,
      },
      headers: {'Accept': 'application/json'},
    );
    try {
      if (response.statusCode == 200) {
        print(response.body);
        SnackBarWidget().snackBarSuccess("Berhasil Menambahkan Merk Mobil");
      } else {
        log(response.statusCode.toString() + " Cek");
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
          "Tambah Merk Mobil",
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
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: ListView(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: controllerMerk,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Merk Mobil',
                            labelText: "Masukkan Merk Mobil",
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 45,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              final connectivityResult =
                                  await (Connectivity().checkConnectivity());
                              if (connectivityResult ==
                                  ConnectivityResult.none) {
                                print("NO INTERNET");
                              } else {
                                if (controllerMerk.text != '') {
                                  postMerk();
                                  controllerMerk.text = '';
                                  getMerkMobil();
                                } else {
                                  SnackBarWidget().snackBarError(
                                      "Input/Tambah Merk Mobil Terlebih dahulu!");
                                }
                              }
                            },
                            child: const Text(
                              'Tambah Merk Mobil',
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
                        ),
                        const SizedBox(height: 50),
                        const Text(
                          "List Merek Mobil :",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: list_merk.length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    "${index + 1}. ${list_merk[index]['nama']}"),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
