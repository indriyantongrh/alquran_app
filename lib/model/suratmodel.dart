// To parse this JSON data, do
//
//     final suratmodel = suratmodelFromJson(jsonString);

import 'dart:convert';

List<Suratmodel> suratmodelFromJson(String str) => List<Suratmodel>.from(json.decode(str).map((x) => Suratmodel.fromJson(x)));

String suratmodelToJson(List<Suratmodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Suratmodel {
  Suratmodel({
    this.arti,
    this.asma,
    this.ayat,
    this.nama,
    this.type,
    this.urut,
    this.audio,
    this.nomor,
    this.rukuk,
    this.keterangan,
  });

  String arti;
  String asma;
  int ayat;
  String nama;
  String type;
  String urut;
  String audio;
  String nomor;
  String rukuk;
  String keterangan;

  factory Suratmodel.fromJson(Map<String, dynamic> json) => Suratmodel(
    arti: json["arti"],
    asma: json["asma"],
    ayat: json["ayat"],
    nama: json["nama"],
    type: json["type"],
    urut: json["urut"],
    audio: json["audio"],
    nomor: json["nomor"],
    rukuk: json["rukuk"],
    keterangan: json["keterangan"],
  );

  Map<String, dynamic> toJson() => {
    "arti": arti,
    "asma": asma,
    "ayat": ayat,
    "nama": nama,
    "type": type,
    "urut": urut,
    "audio": audio,
    "nomor": nomor,
    "rukuk": rukuk,
    "keterangan": keterangan,
  };
}

