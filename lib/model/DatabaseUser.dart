// To parse this JSON data, do
//
//     final databaseProfile = databaseProfileFromJson(jsonString);

import 'dart:convert';

DatabaseProfile databaseProfileFromJson(String str) => DatabaseProfile.fromJson(json.decode(str));

String databaseProfileToJson(DatabaseProfile data) => json.encode(data.toJson());

class DatabaseProfile {
  String info;
  CreatedUser createdUser;

  DatabaseProfile({
    this.info,
    this.createdUser,
  });

  factory DatabaseProfile.fromJson(Map<String, dynamic> json) => DatabaseProfile(
    info: json["info"],
    createdUser: CreatedUser.fromJson(json["createdUser"]),
  );

  Map<String, dynamic> toJson() => {
    "info": info,
    "createdUser": createdUser.toJson(),
  };
}

class CreatedUser {
  String email;
  int issueCount;
  bool admin;
  bool superUser;
  List<dynamic> toRead;
  String mode;
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  String createdUserId;

  CreatedUser({
    this.email,
    this.issueCount,
    this.admin,
    this.superUser,
    this.toRead,
    this.mode,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.createdUserId,
  });

  factory CreatedUser.fromJson(Map<String, dynamic> json) => CreatedUser(
    email: json["email"],
    issueCount: json["issueCount"],
    admin: json["admin"],
    superUser: json["superUser"],
    toRead: List<dynamic>.from(json["toRead"].map((x) => x)),
    mode: json["mode"],
    id: json["_id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    createdUserId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "issueCount": issueCount,
    "admin": admin,
    "superUser": superUser,
    "toRead": List<dynamic>.from(toRead.map((x) => x)),
    "mode": mode,
    "_id": id,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "id": createdUserId,
  };
}
