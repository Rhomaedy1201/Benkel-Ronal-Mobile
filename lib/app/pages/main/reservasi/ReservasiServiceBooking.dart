import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/shared/types.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:pemesanan_service_mobil/app/controllers/bookingServiceController.dart';
import 'package:pemesanan_service_mobil/app/pages/main/HomePage.dart';
import 'package:pemesanan_service_mobil/app/pages/widgets/snackBar/SnackbarWidget.dart';
import 'package:pemesanan_service_mobil/app/utils/base_url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ReservasiServiceBooking extends StatefulWidget {
  const ReservasiServiceBooking({super.key});

  @override
  State<ReservasiServiceBooking> createState() =>
      _ReservasiServiceBookingState();
}

class _ReservasiServiceBookingState extends State<ReservasiServiceBooking> {
  // variable
  String? nama;
  String? nomorHp;
  var namaC = TextEditingController();
  var no_hpC = TextEditingController();
  String id_kendaraan = '';
  String? value_service_berkala = null;
  var keluhanC = TextEditingController(text: '');
  DateTime dtNow = DateTime.now();
  DateTime dateTime = DateTime(DateTime.now().year, DateTime.now().month,
      DateTime.now().day, DateTime.now().hour, DateTime.now().minute);
  var isLoading2 = false;

  // data dummy
  List<String> service_berkala = [
    "Service Berkala 10000 Km",
    "Service Berkala 60000 Km",
    "Service Berkala 70000 Km",
    "Service Berkala 80000 Km",
    "Service Berkala 90000 Km",
    "Service Berkala 100000 Km",
    "Service Berkala 120000 Km",
    "Service Berkala 130000 Km",
    "Service Berkala 140000 Km",
    "Service Berkala 150000 Km",
    "Service Berkala 160000 Km",
    "Service Berkala 170000 Km",
    "Service Berkala 180000 Km",
    "Service Berkala 190000 Km",
    "Service Berkala 200000 Km",
  ];

  @override
  void initState() {
    super.initState();
    getPref();
    getMobil();
  }

  Future getPref() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    setState(() {
      nama = spref.getString('nama');
      nomorHp = spref.getString('no_hp');
      namaC.text = nama!;
      no_hpC.text = nomorHp!;
    });
  }

  var isLoading = false;
  List<dynamic> list_kendaraan = [];
  void getMobil() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences spref = await SharedPreferences.getInstance();
    String? token = await spref.getString('token');
    var response = await http.get(Uri.parse("$baseUrl/kendaraan"), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    try {
      if (response.statusCode == 200) {
        var data = json.decode(response.body)['data'];
        setState(() {
          list_kendaraan = data;
          id_kendaraan = data[0]['uuid'];
        });
        print(data);
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
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(
          color: Color(0xFF5D5D5D),
        ),
        title: const Text(
          "Booking Now",
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: isLoading == true
            ? Center(
                child: Container(
                  width: 110,
                  height: 110,
                  child: Lottie.asset("assets/lottie/loading.json"),
                ),
              )
            : ListView(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Nama Lengkap',
                    ),
                    controller: namaC,
                    enabled: false,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Nomor Telepon',
                    ),
                    controller: no_hpC,
                    enabled: false,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 58,
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
                      value: id_kendaraan,
                      // hint: Text("$id_kendaraan - $_noRangka"),
                      onChanged: ((value) {
                        setState(() {
                          id_kendaraan = value as String;
                        });
                      }),
                      items: list_kendaraan.map((item) {
                        return DropdownMenuItem(
                          child: Text(
                            item['model'] + " - " + item['nomor_rangka'],
                            style: TextStyle(
                              fontSize: 13.5,
                            ),
                          ),
                          value: item['uuid'],
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 58,
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
                      value: value_service_berkala,
                      hint: const Text("Service Berkala"),
                      onChanged: ((value) {
                        setState(() {
                          value_service_berkala = value as String;
                        });
                      }),
                      items: service_berkala.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text("Pilih Tanggal/Select Date"),
                  const SizedBox(height: 5),
                  InkWell(
                    onTap: () async {
                      final date = await pickerDate();
                      if (date == null) return;
                      final newDateTime = DateTime(
                        date.year,
                        date.month,
                        date.day,
                        dateTime.hour,
                        dateTime.minute,
                      );
                      setState(() {
                        dateTime = date;
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      height: 57,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 13),
                            child: Text(
                              '${dateTime.year}-${dateTime.month}-${dateTime.day}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text("Pilih Waktu/Select Time"),
                  const SizedBox(height: 5),
                  InkWell(
                    onTap: () async {
                      final time = await pickerTime();
                      if (time == null) return;

                      final newDateTime = DateTime(
                        dateTime.year,
                        dateTime.month,
                        dateTime.day,
                        time.hour,
                        time.minute,
                      );
                      setState(() {
                        dateTime = newDateTime;
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      height: 57,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 13),
                            child: Text(
                              '$hours:$minutes',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Keluhan/Complaint',
                    ),
                    autocorrect: false,
                    maxLines: 9,
                    controller: keluhanC,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          isLoading2 = true;
                        });
                        var spref = await SharedPreferences.getInstance();
                        var userID = spref.getString("uuid");

                        //Validasi jika kosong
                        if (id_kendaraan != '' &&
                            userID != null &&
                            value_service_berkala != null &&
                            "${dateTime.year}-${dateTime.month}-${dateTime.day}" !=
                                "2022-12-29" &&
                            "$hours:$minutes:00" != "00:00:00" &&
                            keluhanC.text != '') {
                          // POST KE API
                          BookingServiceController().postData(
                            "$id_kendaraan",
                            "$userID",
                            "$value_service_berkala",
                            "${dateTime.year}-${dateTime.month}-${dateTime.day}",
                            "$hours:$minutes:00",
                            keluhanC.text,
                            context,
                          );
                          setState(() {
                            isLoading2 = false;
                          });
                        } else {
                          SnackBarWidget()
                              .snackBarError("Semua Data Wajib Di Isi");
                          setState(() {
                            isLoading2 = false;
                          });
                        }
                      },
                      child: isLoading2 ? Text("Loading...") : Text('Kirim'),
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(Colors.red),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.redAccent),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Future<DateTime?> pickerDate() => showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
      );

  Future<TimeOfDay?> pickerTime() => showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
      );
}
