// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    required this.success,
    required this.message,
    required this.path,
    required this.data,
  });

  bool success;
  String message;
  String path;
  Data data;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        path: json["path"] == null ? null : json["path"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "message": message == null ? null : message,
        "path": path == null ? null : path,
        "data": data == null ? null : data.toJson(),
      };
}

class Data {
  Data({
    this.name,
    this.email,
    this.mobile,
    this.profile,
    this.address1,
    this.address2,
    this.stateName,
    this.cityName,
  });

  String? name;
  String? email;
  String? mobile;
  String? profile;
  String? address1;
  String? address2;
  String? stateName;
  String? cityName;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        mobile: json["mobile"] == null ? null : json["mobile"],
        profile: json["profile"] == null ? null : json["profile"],
        address1: json["address1"] == null ? null : json["address1"],
        address2: json["address2"] == null ? null : json["address2"],
        stateName: json["state_name"] == null ? null : json["state_name"],
        cityName: json["city_name"] == null ? null : json["city_name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "mobile": mobile == null ? null : mobile,
        "profile": profile == null ? null : profile,
        "address1": address1 == null ? null : address1,
        "address2": address2 == null ? null : address2,
        "state_name": stateName == null ? null : stateName,
        "city_name": cityName == null ? null : cityName,
      };
}
