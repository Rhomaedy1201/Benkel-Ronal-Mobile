import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemesanan_service_mobil/app/pages/main/reservasi/InformasiDataMobilPage.dart';

class ReservasiServicePage extends StatefulWidget {
  const ReservasiServicePage({super.key});

  @override
  State<ReservasiServicePage> createState() => _ReservasiServicePageState();
}

class _ReservasiServicePageState extends State<ReservasiServicePage> {
  List<String> model_mobil = [
    "Mobil 1",
    "Mobil 2",
    "Mobil 3",
    "Mobil 4",
  ];
  List<String> type_mobil = [
    "Toyota",
    "Honda",
    "Mitsubiz",
  ];
  List<String> warna_mobil = [
    "Merah",
    "Hitam",
    "Silver",
    "Putih",
  ];
  String? value_model_mobil = null;
  String? value_type_mobil = null;
  String? value_warna_mobil = null;
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
      body: ListView(
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
                    const SizedBox(height: 20),
                    // Model Mobil
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
                        value: value_model_mobil,
                        hint: const Text("Pilih Model Mobil"),
                        onChanged: (String? newValue) {
                          setState(() {
                            value_model_mobil = newValue!;
                          });
                        },
                        items: model_mobil.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Tipe Mobil
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
                        value: value_model_mobil,
                        hint: const Text("Pilih Tipe Mobil"),
                        onChanged: (String? newValue) {
                          setState(() {
                            value_model_mobil = newValue!;
                          });
                        },
                        items: model_mobil.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Tahun Produksi
                    SizedBox(
                      height: 55,
                      child: DropdownDatePicker(
                        inputDecoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          border: OutlineInputBorder(),
                        ), // optional
                        isDropdownHideUnderline: true, // optional
                        isFormValidator: false, // optional
                        startYear: 1600, // optional
                        endYear: 2024, // optional
                        width: 10, // optional
                        showDay: false,
                        showMonth: false,
                        onChangedYear: (value) =>
                            print('onChangedYear: $value'),
                        hintYear: "Tahun Produksi",
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Warna
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
                        value: value_model_mobil,
                        hint: const Text("Warna"),
                        onChanged: (String? newValue) {
                          setState(() {
                            value_model_mobil = newValue!;
                          });
                        },
                        items: model_mobil.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Nomer Polisi',
                      ),
                    ),
                    const SizedBox(height: 10),
                    const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Nomer Polisi',
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Isi nomer kendaraan untuk ...",
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
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))), // optional
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
                  onChangedDay: (value) => print('onChangedDay: $value'),
                  onChangedMonth: (value) => print('onChangedMonth: $value'),
                  onChangedYear: (value) => print('onChangedYear: $value'),
                ),

                // Button
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: SizedBox(
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(InformasiDataMobilPage());
                },
                child: Text('Tambahkan Kendaraan'),
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.red),
                  backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
