import 'package:flutter/material.dart';

class MerkMobilPage extends StatelessWidget {
  const MerkMobilPage({super.key});

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: ListView(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: null,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Merk Mobil',
                      labelText: "Masukkan Merk Mobil",
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {},
                      child: Text(
                        'Tamabah Merk Mobil',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(Colors.red),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.redAccent),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Text(
                    "List Merek Mobil :",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${index + 1}. Merk Mobilnya"),
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
