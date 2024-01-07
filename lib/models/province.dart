// To parse this JSON data, do
//
//     final province = provinceFromJson(jsonString);

import 'dart:convert';

ProvinceResponse provinceFromJson(String str) =>
    ProvinceResponse.fromJson(json.decode(str));

String provinceToJson(ProvinceResponse data) => json.encode(data.toJson());

class ProvinceResponse {
  bool valid;
  List<Province> data;

  ProvinceResponse({
    required this.valid,
    required this.data,
  });

  factory ProvinceResponse.fromJson(Map<String, dynamic> json) =>
      ProvinceResponse(
        valid: json["valid"],
        data:
            List<Province>.from(json["data"].map((x) => Province.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "valid": valid,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Province {
  String name;
  String code;
  String identifier;
  String regionCode;

  Province({
    required this.name,
    required this.code,
    required this.identifier,
    required this.regionCode,
  });

  factory Province.fromJson(Map<String, dynamic> json) => Province(
        name: json["name"],
        code: json["code"],
        identifier: json["identifier"],
        regionCode: json["regionCode"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "identifier": identifier,
        "regionCode": regionCode,
      };
}
