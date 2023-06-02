import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemesanan_service_mobil/app/Providers/mobilProvider.dart';
import 'package:pemesanan_service_mobil/app/controllers/tambahKendaraanController.dart';
import 'package:pemesanan_service_mobil/app/pages/main/reservasi/InformasiDataMobilPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  TextEditingController merkMobil = TextEditingController(text: '');
  String? modelMobil = null;
  TextEditingController tipeMobil = TextEditingController(text: '');
  String? thnProduksi = null;
  TextEditingController warna = TextEditingController(text: '');
  TextEditingController nomorPolisi = TextEditingController(text: '');
  TextEditingController nomorIdentitas = TextEditingController(text: '');
  String? tglStnk = null;
  String? blnStnk = null;
  String? thnStnk = null;
  String? fullStnk = null;

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
                    const SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Merk Mobil',
                        labelText: 'Merk Mobil',
                      ),
                      controller: merkMobil,
                    ),
                    const SizedBox(height: 10),
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
                        value: modelMobil,
                        hint: const Text("Pilih Model Mobil"),
                        onChanged: (String? newValue) {
                          setState(() {
                            modelMobil = newValue!;
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
                    TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Tipe Mobil',
                        labelText: 'Tipe Mobil',
                      ),
                      controller: tipeMobil,
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
                        endYear: 2050, // optional
                        width: 10, // optional
                        showDay: false,
                        showMonth: false,
                        onChangedYear: (value) {
                          setState(() {
                            thnProduksi = value;
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
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Nomer Polisi',
                        labelText: 'Nomer Polisi',
                      ),
                      controller: nomorPolisi,
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Nomer Identitas Kendaraan',
                        labelText: 'Nomer Identitas Kendaraan',
                      ),
                      controller: nomorIdentitas,
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
          Padding(
            padding: const EdgeInsets.all(30),
            child: SizedBox(
              height: 45,
              child: ElevatedButton(
                onPressed: () async {
                  SharedPreferences spref =
                      await SharedPreferences.getInstance();
                  String? uuid = spref.getString("uuid");
                  print(merkMobil.text);
                  print(modelMobil);
                  print(tipeMobil.text);
                  print(thnProduksi);
                  print(warna.text);
                  print(nomorPolisi.text);
                  print(nomorIdentitas.text);

                  print("$thnStnk-$blnStnk-$tglStnk");
                  TambahKendaraanController().addCar(
                    merkMobil.text,
                    1,
                    nomorIdentitas.text,
                    uuid!,
                    tipeMobil.text,
                    int.parse(thnProduksi!),
                    warna.text,
                    nomorPolisi.text,
                    nomorIdentitas.text,
                    "$thnStnk-$blnStnk-$tglStnk",
                  );
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
