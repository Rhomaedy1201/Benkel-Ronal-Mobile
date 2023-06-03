import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:pemesanan_service_mobil/app/pages/main/service_advisor/detailService.dart';

class HomeServiceAdvisor extends StatefulWidget {
  const HomeServiceAdvisor({super.key});

  @override
  State<HomeServiceAdvisor> createState() => _HomeServiceAdvisorState();
}

class _HomeServiceAdvisorState extends State<HomeServiceAdvisor> {
  List<String> listCat = [
    'on proses',
    'waiting',
    'done',
    "cancelled",
  ];
  int isActive = 0;
  @override
  Widget build(BuildContext context) {
    final bodyWidth = MediaQuery.of(context).size.width;
    Widget menu() {
      return Container(
        height: 55,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listCat.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isActive = index;
                      print(isActive);
                    });
                  },
                  child: Container(
                    width: 100,
                    height: 55,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(""),
                        Text(
                          listCat[index],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10),
                        (isActive == index)
                            ? Container(
                                width: 100,
                                height: 4,
                                color: Color(0xFFFF837B),
                              )
                            : Container(
                                width: 100,
                                height: 4,
                                color: Colors.white,
                              ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 1,
                  height: 20,
                  color: Colors.grey,
                ),
              ],
            );
          },
        ),
      );
    }

    Widget items() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext ctx, index) {
              return InkWell(
                onTap: () {
                  Get.to(DetailService());
                },
                child: Column(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Nama"),
                                      const SizedBox(height: 2),
                                      Text("Tanggal"),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Muhammad Rhomaedi",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 2),
                                      Text("22-01-2023"),
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10)
                  ],
                ),
              );
            }),
      );
    }

    return Scaffold(
        backgroundColor: Color(0xFFECECEC),
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Colors.white,
          elevation: 1,
          iconTheme: const IconThemeData(
            color: Color(0xFF5D5D5D),
          ),
          title: const Text(
            "Service Advisor",
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              menu(),
              items(),
            ],
          ),
        ));
  }
}
