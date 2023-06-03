class BookingServiceModel {
  String kendaraan_id;
  String user_id;
  String detail_service;
  String tanggal;
  String jam;
  String keluhan;

  BookingServiceModel({
    required this.kendaraan_id,
    required this.user_id,
    required this.detail_service,
    required this.tanggal,
    required this.jam,
    required this.keluhan,
  });
}
