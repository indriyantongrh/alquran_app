import 'dart:convert';

List<Detailsuratmodel> detailsuratmodelFromJson(String str) => List<Detailsuratmodel>.from(json.decode(str).map((x) => Detailsuratmodel.fromJson(x)));

String detailsuratmodelToJson(List<Detailsuratmodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Detailsuratmodel {
  Detailsuratmodel({
    this.ar,
    this.id,
    this.tr,
    this.nomor,
  });

  String ar;
  String id;
  String tr;
  String nomor;

  factory Detailsuratmodel.fromJson(Map<String, dynamic> json) => Detailsuratmodel(
    ar: json["ar"],
    id: json["id"],
    tr: json["tr"],
    nomor: json["nomor"],
  );

  Map<String, dynamic> toJson() => {
    "ar": ar,
    "id": id,
    "tr": tr,
    "nomor": nomor,
  };
}
