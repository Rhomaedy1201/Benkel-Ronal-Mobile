import 'package:flutter/material.dart';
import 'package:pemesanan_service_mobil/app/pages/widgets/dialog/dialogWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String nama = '';
  String email = '';
  String no_hp = '';
  late SharedPreferences spref;
  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    spref = await SharedPreferences.getInstance();
    String? nama = spref.getString('nama');
    String? email = spref.getString('email');
    String? no_hp = spref.getString('no_hp');
    if (nama == null && email == null && no_hp == null) return;
    setState(() {
      this.nama = nama!;
      this.email = email!;
      this.no_hp = no_hp!;
      print(this.nama);
      print(this.email);
      print(this.no_hp);
    });
  }

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
          "Profile",
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage('assets/icons/user.png'),
                      fit: BoxFit.cover,
                    ),
                    color: Color(0xFFEDEDED),
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  nama,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 10),
                Text(
                  email,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 10),
                Text(
                  no_hp,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      DialogWidget().dialogLogout(context);
                    },
                    child: Text('Keluar'),
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.red),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.redAccent),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
