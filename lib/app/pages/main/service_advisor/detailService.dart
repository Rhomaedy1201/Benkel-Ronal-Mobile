import 'package:flutter/material.dart';

class DetailService extends StatelessWidget {
  const DetailService({super.key});

  @override
  Widget build(BuildContext context) {
    Widget detail() {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: 1,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext ctx, index) {
            return Column(
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
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 90,
                              // color: Colors.amberAccent,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Nama"),
                                  const SizedBox(height: 2),
                                  Text("Tanggal"),
                                  const SizedBox(height: 2),
                                  Text("Nomor Hp"),
                                  const SizedBox(height: 2),
                                  Text("Email"),
                                  const SizedBox(height: 2),
                                  Text("Jam Antri"),
                                  const SizedBox(height: 2),
                                  Text("Status"),
                                ],
                              ),
                            ),
                            Container(
                              width: 190,
                              // color: Colors.amberAccent,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Muhammad Rhomaedi",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 2),
                                  Text("22-01-2023"),
                                  const SizedBox(height: 2),
                                  Text("+628723677838"),
                                  const SizedBox(height: 2),
                                  Text("rhomaedi@gmail.com "),
                                  const SizedBox(height: 2),
                                  Text("10:30:00"),
                                  const SizedBox(height: 2),
                                  Text("on proses"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 5,
                        color: Colors.black26,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Xpander Model"),
                            const SizedBox(height: 2),
                            Text("Xpander TIPE"),
                            SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 110,
                                  // color: Colors.amberAccent,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Nomor Polisi"),
                                      const SizedBox(height: 2),
                                      Text("Warna"),
                                      const SizedBox(height: 2),
                                      Text("No Rangka"),
                                      const SizedBox(height: 2),
                                      Text("Thn Produksi"),
                                      const SizedBox(height: 2),
                                      Text("Kendala"),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 200,
                                  // color: Colors.amberAccent,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("P 0928 UP"),
                                      const SizedBox(height: 2),
                                      Text("GOLD"),
                                      const SizedBox(height: 2),
                                      Text("ASJAS6AS864G"),
                                      const SizedBox(height: 2),
                                      Text("2022"),
                                      const SizedBox(height: 2),
                                      Text(
                                        "Lorem ipsum, atau ringkasnya lipsum, adalah teks standar yang ditempatkan untuk mendemostrasikan",
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            //OnProses
                            const SizedBox(height: 20),
                            Text(
                                "#### detail jika ditampilan OnProgress muncul btn ini, inputan dan btn yg bawah hilang ####"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Terima',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  style: ButtonStyle(
                                    overlayColor: MaterialStateProperty.all(
                                        Colors.greenAccent),
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.green),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Batal/Tolak',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  style: ButtonStyle(
                                    overlayColor:
                                        MaterialStateProperty.all(Colors.red),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.redAccent),
                                  ),
                                ),
                              ],
                            ),
                            //waiting
                            Text(
                                "#### detail jika ditampilan Waiting muncul inputan dan btn ini, untuk btn yg atas hilang ####"),
                            Column(
                              children: [
                                SizedBox(height: 20),
                                Text("Inputkan Sparepart yang Di Ganti :"),
                                TextField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText:
                                        'Masukkan List Sparepart yg di ganti',
                                  ),
                                  autocorrect: false,
                                  maxLines: 9,
                                  controller: null,
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Selesai',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  style: ButtonStyle(
                                    overlayColor: MaterialStateProperty.all(
                                        Colors.greenAccent),
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.green),
                                  ),
                                ),
                              ],
                            )
                            //Done
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10)
              ],
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(
          color: Color(0xFF5D5D5D),
        ),
        title: const Text(
          "Detail Service Customer",
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            detail(),
          ],
        ),
      ),
    );
  }
}
