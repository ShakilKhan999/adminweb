import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String status;
  String message;
  List<Datum> data;

  UserModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  List<String> subjectCategory;
  String id;
  String? fullName;
  String? appKey;
  DateTime? dateOfBirth;
  String? gender;
  bool? agreeToMarketing;
  double? latitude;
  double? longitude;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String? email;
  String? password;

  Datum({
    required this.subjectCategory,
    required this.id,
    this.fullName,
    this.appKey,
    this.dateOfBirth,
    this.gender,
    this.agreeToMarketing,
    this.latitude,
    this.longitude,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    this.email,
    this.password,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        subjectCategory:
            List<String>.from(json["SubjectCategory"].map((x) => x)),
        id: json["_id"],
        fullName: json["fullName"],
        appKey: json["AppKey"],
        dateOfBirth: json["dateOfBirth"] == null
            ? null
            : DateTime.parse(json["dateOfBirth"]),
        gender: json["Gender"],
        agreeToMarketing: json["agreeToMarketing"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "SubjectCategory": List<dynamic>.from(subjectCategory.map((x) => x)),
        "_id": id,
        "fullName": fullName,
        "AppKey": appKey,
        "dateOfBirth": dateOfBirth?.toIso8601String(),
        "Gender": gender,
        "agreeToMarketing": agreeToMarketing,
        "latitude": latitude,
        "longitude": longitude,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "email": email,
        "password": password,
      };
}
