class MobilModel {
  bool success;
  String message;
  List<Datum> data;

  MobilModel({
    required this.success,
    required this.message,
    required this.data,
  });
}

class Datum {
  String id;
  String keterangan;

  Datum({
    required this.id,
    required this.keterangan,
  });
}
