import 'dart:convert';

LoginResponseModel loginResponseJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  LoginResponseModel({
    required this.success,
    required this.data,
    required this.message,
  });
  late final bool success;
  late final Data? data;
  late final String message;

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data!.toJson();
    _data['message'] = message;
    return _data;
  }
}

class Data {
  Data({
    required this.name,
    required this.id,
    required this.accessToken,
  });
  late final String name;
  late final int id;
  late final String accessToken;

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['id'] = id;
    _data['access_token'] = accessToken;
    return _data;
  }
}
