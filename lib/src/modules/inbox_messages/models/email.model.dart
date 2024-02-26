// To parse this JSON data, do
//
//     final email = emailFromJson(jsonString);

import 'dart:convert';

Email emailFromJson(String str) => Email.fromJson(json.decode(str));

String emailToJson(Email data) => json.encode(data.toJson());

class Email {
  String? id;
  String? msgid;
  From? from;
  List<From>? to;
  String? subject;
  String? intro;
  bool? seen;
  bool? isDeleted;
  bool? hasAttachments;
  int? size;
  String? downloadUrl;
  String? sourceUrl;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? accountId;

  Email({
    this.id,
    this.msgid,
    this.from,
    this.to,
    this.subject,
    this.intro,
    this.seen,
    this.isDeleted,
    this.hasAttachments,
    this.size,
    this.downloadUrl,
    this.sourceUrl,
    this.createdAt,
    this.updatedAt,
    this.accountId,
  });

  factory Email.fromJson(Map<String, dynamic> json) => Email(
        id: json["id"],
        msgid: json["msgid"],
        from: json["from"] == null ? null : From.fromJson(json["from"]),
        to: json["to"] == null
            ? []
            : List<From>.from(json["to"]!.map((x) => From.fromJson(x))),
        subject: json["subject"],
        intro: json["intro"],
        seen: json["seen"],
        isDeleted: json["isDeleted"],
        hasAttachments: json["hasAttachments"],
        size: json["size"],
        downloadUrl: json["downloadUrl"],
        sourceUrl: json["sourceUrl"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        accountId: json["accountId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "msgid": msgid,
        "from": from?.toJson(),
        "to": to == null ? [] : List<dynamic>.from(to!.map((x) => x.toJson())),
        "subject": subject,
        "intro": intro,
        "seen": seen,
        "isDeleted": isDeleted,
        "hasAttachments": hasAttachments,
        "size": size,
        "downloadUrl": downloadUrl,
        "sourceUrl": sourceUrl,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "accountId": accountId,
      };
}

class From {
  String? address;
  String? name;

  From({
    this.address,
    this.name,
  });

  factory From.fromJson(Map<String, dynamic> json) => From(
        address: json["address"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "name": name,
      };
}
