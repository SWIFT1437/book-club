// To parse this JSON data, do
//
//     final databaseUser = databaseUserFromJson(jsonString);

import 'dart:convert';

DatabaseUser databaseUserFromJson(String str) => DatabaseUser.fromJson(json.decode(str));

String databaseUserToJson(DatabaseUser data) => json.encode(data.toJson());

class DatabaseUser {
    List<Users> users;

    DatabaseUser({
        this.users,
    });

    factory DatabaseUser.fromJson(Map<String, dynamic> json) => DatabaseUser(
        users: List<Users>.from(json["users"].map((x) => Users.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
    };
}

class Users {
    String email;
    int issueCount;
    bool admin;
    bool superUser;
    List<String> toRead;
    String mode;
    String fid;
    String id;
    String password;
    String name;
    DateTime createdAt;
    DateTime updatedAt;
    String userId;

    Users({
        this.email,
        this.issueCount,
        this.admin,
        this.superUser,
        this.toRead,
        this.mode,
        this.fid,
        this.id,
        this.password,
        this.name,
        this.createdAt,
        this.updatedAt,
        this.userId,
    });

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        email: json["email"],
        issueCount: json["issueCount"],
        admin: json["admin"],
        superUser: json["superUser"],
        toRead: List<String>.from(json["toRead"].map((x) => x)),
        mode: json["mode"],
        fid: json["fid"],
        id: json["_id"],
        password: json["password"],
        name: json["name"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        userId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "issueCount": issueCount,
        "admin": admin,
        "superUser": superUser,
        "toRead": List<dynamic>.from(toRead.map((x) => x)),
        "mode": mode,
        "fid": fid,
        "_id": id,
        "password": password,
        "name": name,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "id": userId,
    };
}
