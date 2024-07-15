// To parse this JSON data, do
//
//     final userListModel = userListModelFromJson(jsonString);

import 'dart:convert';

UserListModel userListModelFromJson(String str) => UserListModel.fromJson(json.decode(str));

String userListModelToJson(UserListModel data) => json.encode(data.toJson());

class UserListModel {
    List<UserList> data;

    UserListModel({
        required this.data,
    });

    UserListModel copyWith({
        List<UserList>? data,
    }) => 
        UserListModel(
            data: data ?? this.data,
        );

    factory UserListModel.fromJson(Map<String, dynamic> json) => UserListModel(
        data: List<UserList>.from(json["data"].map((x) => UserList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class UserList {
    int id;
    String userId;
    String name;
    String whatsapp;
    String address;
    String requirement;
    DateTime createdOn;

    UserList({
        required this.id,
        required this.userId,
        required this.name,
        required this.whatsapp,
        required this.address,
        required this.requirement,
        required this.createdOn,
    });

    UserList copyWith({
        int? id,
        String? userId,
        String? name,
        String? whatsapp,
        String? address,
        String? requirement,
        DateTime? createdOn,
    }) => 
        UserList(
            id: id ?? this.id,
            userId: userId ?? this.userId,
            name: name ?? this.name,
            whatsapp: whatsapp ?? this.whatsapp,
            address: address ?? this.address,
            requirement: requirement ?? this.requirement,
            createdOn: createdOn ?? this.createdOn,
        );

    factory UserList.fromJson(Map<String, dynamic> json) => UserList(
        id: json["id"],
        userId: json["userId"],
        name: json["name"],
        whatsapp: json["whatsapp"],
        address: json["address"],
        requirement: json["requirement"],
        createdOn: DateTime.parse(json["createdOn"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "name": name,
        "whatsapp": whatsapp,
        "address": address,
        "requirement": requirement,
        "createdOn": createdOn.toIso8601String(),
    };
}
