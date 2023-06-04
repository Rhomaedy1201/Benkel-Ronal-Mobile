import 'package:flutter/material.dart';
import 'package:pemesanan_service_mobil/app/pages/serviceAdvisor/reservasi_advisor/DataReservasi.dart';

class ReservasiAdvisorPage extends StatefulWidget {
  const ReservasiAdvisorPage({super.key});

  @override
  State<ReservasiAdvisorPage> createState() => _ReservasiAdvisorPageState();
}

class _ReservasiAdvisorPageState extends State<ReservasiAdvisorPage>
    with TickerProviderStateMixin {
  List reservasi = [];

  @override
  Widget build(BuildContext context) {
    final bodyWidth = MediaQuery.of(context).size.width;
    late TabController _tabController = TabController(length: 4, vsync: this);

    @override
    void initState() {
      super.initState();
      _tabController = TabController(length: 4, vsync: this);
    }

    @override
    void dispose() {
      _tabController.dispose();
      super.dispose();
    }

    // void setReservasi) {}

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
          "Reservasi",
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
        bottom: TabBar(
          onTap: (value) {
            var status = "";
            if (_tabController.index == 0) status = "waiting";
            if (_tabController.index == 1) status = "onprocess";
            if (_tabController.index == 2) status = "done";
            if (_tabController.index == 3) status = "cancelled";
            // getData(status);
            // print("$status");
          },
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              child: Text(
                "Waiting",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
            Tab(
              child: Text(
                "On Proses",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
            Tab(
              child: Text(
                "Done",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
            Tab(
              child: Text(
                "Cancelled",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          DataReservasi(status: "waiting"),
          DataReservasi(status: "onprocess"),
          DataReservasi(status: "done"),
          DataReservasi(status: "cancelled"),
        ],
      ),
    );
  }
}
