import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:pemesanan_service_mobil/app/controllers/bookingServiceController.dart';
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
  DateTime dateTime = DateTime(2022, 05, 10, 0, 00);

  // data dummy
  List<String> service_berkala = [
    "Service Berkala 10000 Km",
    "Service Berkala 60000 Km",
    "Service Berkala 70000 Km",
    "Service Berkala 80000 Km",
    "Service Berkala 90000 Km",
    "Service Berkala 100000 Km",
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

  List<dynamic> list_kendaraan = [];
  void getMobil() async {
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
            fontSize: 19,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: ListView(
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
                        (dateTime.year < 2023)
                            ? "Pilih Tanggal/Select Date"
                            : '${dateTime.year}-${dateTime.month}-${dateTime.day}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
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
                        (dateTime.hour >= 20 || dateTime.hour <= 6)
                            ? "Pilih Waktu/Select Time"
                            : '$hours:$minutes',
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
                  var spref = await SharedPreferences.getInstance();
                  var userID = spref.getString("uuid");
                  print("kendaraan id : $id_kendaraan");
                  print("user id : $userID");
                  print("detail service : $value_service_berkala");
                  print(
                      "tanggal : ${dateTime.year}-${dateTime.month}-${dateTime.day}");
                  print("jam : $hours:$minutes:00");
                  print("keluhan : ${keluhanC.text}");

                  BookingServiceController().postData(
                    "$id_kendaraan",
                    "$userID",
                    "$value_service_berkala",
                    "${dateTime.year}-${dateTime.month}-${dateTime.day}",
                    "$hours:$minutes:00",
                    keluhanC.text,
                  );

                  // Dialogs.materialDialog(
                  //     color: Colors.white,
                  //     msg: 'Reservasi Anda Berhasil',
                  //     // title: 'Reservasi Terkirim',
                  //     lottieBuilder: Lottie.asset(
                  //       'assets/lottie/success.json',
                  //       fit: BoxFit.contain,
                  //     ),
                  //     // customView: MySuperWidget(),
                  //     customViewPosition: CustomViewPosition.BEFORE_ACTION,
                  //     context: context,
                  //     actions: [
                  //       IconsButton(
                  //         onPressed: () {
                  //           Get.offAll(HomePage());
                  //         },
                  //         text: 'Oke',
                  //         iconData: Icons.done_sharp,
                  //         color: Colors.green,
                  //         textStyle: TextStyle(color: Colors.white),
                  //         iconColor: Colors.white,
                  //       ),
                  //     ]);
                },
                child: Text('Kirim'),
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.red),
                  backgroundColor: MaterialStateProperty.all(Colors.redAccent),
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
