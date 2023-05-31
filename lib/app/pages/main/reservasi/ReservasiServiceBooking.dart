import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/shared/types.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:pemesanan_service_mobil/app/pages/main/HomePage.dart';
import 'package:time_interval_picker/time_interval_picker.dart';

class ReservasiServiceBooking extends StatefulWidget {
  const ReservasiServiceBooking({super.key});

  @override
  State<ReservasiServiceBooking> createState() =>
      _ReservasiServiceBookingState();
}

class _ReservasiServiceBookingState extends State<ReservasiServiceBooking> {
  DateTime dateTime = DateTime(2022, 05, 10, 0, 00);
  @override
  Widget build(BuildContext context) {
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');
    List<String> model_mobil = [
      "XPander - MK2HHD87SNJAAAS",
      "Toyota - MK2HHD87SNJAAAS",
      "DAIHATSU - MK2HHD87SNJAAAS",
    ];
    String? value_model_mobil = null;
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
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Nama Lengkap',
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Nomor Telepon',
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
                value: value_model_mobil,
                hint: const Text("XPander - MK2HHD87SNJAAAS"),
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
                value: value_model_mobil,
                hint: const Text("Service Berkala"),
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
                        (dateTime.year == 2022)
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
                        (dateTime.hour == 0)
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
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Keluhan/Complaint',
              ),
              maxLines: 9,
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Dialogs.materialDialog(
                      color: Colors.white,
                      msg: 'Reservasi Anda Berhasil',
                      // title: 'Reservasi Terkirim',
                      lottieBuilder: Lottie.asset(
                        'assets/lottie/success.json',
                        fit: BoxFit.contain,
                      ),
                      // customView: MySuperWidget(),
                      customViewPosition: CustomViewPosition.BEFORE_ACTION,
                      context: context,
                      actions: [
                        IconsButton(
                          onPressed: () {
                            Get.offAll(HomePage());
                          },
                          text: 'Oke',
                          iconData: Icons.done_sharp,
                          color: Colors.green,
                          textStyle: TextStyle(color: Colors.white),
                          iconColor: Colors.white,
                        ),
                      ]);
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
