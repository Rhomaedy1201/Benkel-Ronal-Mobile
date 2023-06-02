class InformasiDataMobilModel {
  String? uuid;
  String? merk;
  int? modelId;
  String? nomorRangka;
  String? userId;
  String? tipeMobil;
  String? tahunProduksi;
  String? warna;
  String? nopol;
  String? nomorStnk;
  String? masaStnk;
  String? createdAt;
  String? updatedAt;

  InformasiDataMobilModel(
      {this.uuid,
      this.merk,
      this.modelId,
      this.nomorRangka,
      this.userId,
      this.tipeMobil,
      this.tahunProduksi,
      this.warna,
      this.nopol,
      this.nomorStnk,
      this.masaStnk,
      this.createdAt,
      this.updatedAt});

  InformasiDataMobilModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    merk = json['merk'];
    modelId = json['model_id'];
    nomorRangka = json['nomor_rangka'];
    userId = json['user_id'];
    tipeMobil = json['tipe_mobil'];
    tahunProduksi = json['tahun_produksi'];
    warna = json['warna'];
    nopol = json['nopol'];
    nomorStnk = json['nomor_stnk'];
    masaStnk = json['masa_stnk'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['merk'] = this.merk;
    data['model_id'] = this.modelId;
    data['nomor_rangka'] = this.nomorRangka;
    data['user_id'] = this.userId;
    data['tipe_mobil'] = this.tipeMobil;
    data['tahun_produksi'] = this.tahunProduksi;
    data['warna'] = this.warna;
    data['nopol'] = this.nopol;
    data['nomor_stnk'] = this.nomorStnk;
    data['masa_stnk'] = this.masaStnk;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
