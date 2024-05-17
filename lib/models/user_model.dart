// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    String? id;
    String? name;
    String? username;
    String? password;
    String? photo;
    String? userType;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    String? token;

    UserModel({
        this.id,
        this.name,
        this.username,
        this.password,
        this.photo,
        this.userType,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.token,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        name: json["name"],
        username: json["username"],
        password: json["password"],
        photo: json["photo"],
        userType: json["userType"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "username": username,
        "password": password,
        "photo": photo,
        "userType": userType,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "token": token,
    };
}
