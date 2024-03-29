// To parse this JSON data, do
//

import 'dart:convert';

List<KullanicilarModel> kullanicilarModelFromJson(String str) =>
    List<KullanicilarModel>.from(
        json.decode(str).map((x) => KullanicilarModel.fromJson(x)));
String kullanicilarModelToJson(List<KullanicilarModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

//  final kullanicilarModel = kullanicilarModelFromJson(jsonString);
class KullanicilarModel {
  KullanicilarModel({
    required this.kullaniciId,
    required this.kullaniciShortName,
    required this.kullaniciName,
    required this.kullaniciSirketId,
    required this.kullaniciProgramId,
    required this.kullaniciSirketAdi,
    required this.sirketIp,
    required this.sirketPort,
    required this.sirketDbName,
  });

  int kullaniciId;
  String kullaniciShortName;
  String kullaniciName;
  int kullaniciSirketId;
  int kullaniciProgramId;
  String kullaniciSirketAdi;
  String sirketIp;
  String sirketPort;
  String sirketDbName;

  factory KullanicilarModel.fromJson(Map<String, dynamic> json) =>
      KullanicilarModel(
        kullaniciId: json["kullanici_id"],
        kullaniciShortName: json["kullanici_short_name"],
        kullaniciName: json["kullanici_name"],
        kullaniciSirketId: json["kullanici_sirket_id"],
        kullaniciProgramId: json["kullanici_program_id"],
        kullaniciSirketAdi: json["kullanici_sirket_adi"],
        sirketIp: json["sirket_ip"],
        sirketPort: json["sirket_port"],
        sirketDbName: json["sirket_db_name"],
      );

  Map<String, dynamic> toJson() => {
        "kullanici_id": kullaniciId,
        "kullanici_short_name": kullaniciShortName,
        "kullanici_name": kullaniciName,
        "kullanici_sirket_id": kullaniciSirketId,
        "kullanici_program_id": kullaniciProgramId,
        "kullanici_sirket_adi": kullaniciSirketAdi,
        "sirket_ip": sirketIp,
        "sirket_port": sirketPort,
        "sirket_db_name": sirketDbName,
      };
}
