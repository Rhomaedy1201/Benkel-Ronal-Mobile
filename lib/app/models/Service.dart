class Service {
  String? tipe_service;
  String? service_advisor;
  String? tanggal;
  String? odometer;
  String? part_pengganti;
  String? detail;

  Service({
    this.tipe_service,
    this.service_advisor,
    this.tanggal,
    this.odometer,
    this.part_pengganti,
    this.detail,
  });
  Service.fromJson(Map<String, dynamic> json) {
    tipe_service = json['tipe_service'];
    service_advisor = json['service_advisor'];
    tanggal = json['tanggal'];
    odometer = json['odometer'];
    part_pengganti = json['part_pengganti'];
    detail = json['detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tipe_service'] = tipe_service;
    data['service_advisor'] = service_advisor;
    data['tanggal'] = tanggal;
    data['odometer'] = odometer;
    data['part_pengganti'] = part_pengganti;
    data['detail'] = detail;
    return data;
  }
}
