// To parse this JSON data, do
//
//     final allNotices = allNoticesFromJson(jsonString);

import 'dart:convert';

AllNotices allNoticesFromJson(String str) => AllNotices.fromJson(json.decode(str));

String allNoticesToJson(AllNotices data) => json.encode(data.toJson());

class AllNotices {
    AllNotices({
        this.count,
        this.notices,
    });

    int count;
    List<Notice> notices;

    factory AllNotices.fromJson(Map<String, dynamic> json) => AllNotices(
        count: json["count"],
        notices: List<Notice>.from(json["notices"].map((x) => Notice.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "notices": List<dynamic>.from(notices.map((x) => x.toJson())),
    };
}

class Notice {
    Notice({
        this.id,
        this.title,
        this.body,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.createdBy,
    });

    String id;
    String title;
    String body;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    String createdBy;

    factory Notice.fromJson(Map<String, dynamic> json) => Notice(
        id: json["_id"],
        title: json["title"],
        body: json["body"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "body": body,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "createdBy": createdBy == null ? null : createdBy,
    };
}
