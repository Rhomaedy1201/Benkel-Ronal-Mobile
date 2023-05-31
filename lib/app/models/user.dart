class User {
  String uuid;
  String? nama;
  String? no_hp;
  String? email;
  String? password;
  String? role_id;

  User(
      {required this.uuid,
      this.nama,
      this.no_hp,
      this.email,
      this.password,
      this.role_id});
}
