import 'dart:convert';

MenuVoucher menuVoucherFromJson(String str) =>
    MenuVoucher.fromJson(json.decode(str));

String menuVoucherToJson(MenuVoucher data) => json.encode(data.toJson());

class MenuVoucher {
  int? statusCode;
  Datas? datas;

  MenuVoucher({
    this.statusCode,
    this.datas,
  });

  factory MenuVoucher.fromJson(Map<String, dynamic> json) => MenuVoucher(
        statusCode: json["status_code"],
        datas: json["datas"] == null ? null : Datas.fromJson(json["datas"]),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "datas": datas?.toJson(),
      };
}

class Datas {
  int? id;
  String? kode;
  int? nominal;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datas({
    this.id,
    this.kode,
    this.nominal,
    this.createdAt,
    this.updatedAt,
  });

  factory Datas.fromJson(Map<String, dynamic> json) => Datas(
        id: json["id"],
        kode: json["kode"],
        nominal: json["nominal"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kode": kode,
        "nominal": nominal,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
