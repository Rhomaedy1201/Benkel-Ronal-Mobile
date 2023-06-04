import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pemesanan_service_mobil/app/pages/main/service_advisor/DataReservasi.dart';
import 'package:pemesanan_service_mobil/app/pages/main/service_advisor/detailService.dart';
import 'package:pemesanan_service_mobil/app/pages/widgets/dialog/dialogWidget.dart';
import 'package:pemesanan_service_mobil/app/utils/base_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeServiceAdvisor extends StatefulWidget {
  const HomeServiceAdvisor({super.key});

  @override
  State<HomeServiceAdvisor> createState() => _HomeServiceAdvisorState();
}

class _HomeServiceAdvisorState extends State<HomeServiceAdvisor>
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
          "Service Advisor",
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
        actions: [
          IconButton(
              onPressed: () {
                DialogWidget().dialogLogout(context);
              },
              icon: const Icon(Icons.logout))
        ],
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
