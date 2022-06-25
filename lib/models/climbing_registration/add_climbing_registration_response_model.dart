import 'dart:convert';

AddClimbingRegistrationResponseModel addClimbingRegistrationResponseJson(
        String str) =>
    AddClimbingRegistrationResponseModel.fromJson(json.decode(str));

class AddClimbingRegistrationResponseModel {
  AddClimbingRegistrationResponseModel({
    required this.success,
    required this.data,
    required this.message,
  });
  late final bool success;
  late final Data data;
  late final String message;

  AddClimbingRegistrationResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = Data.fromJson(json['data']);
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data.toJson();
    _data['message'] = message;
    return _data;
  }
}

class Data {
  Data({
    required this.mountainId,
    required this.identityCard,
    required this.healthyLetter,
    required this.schedule,
    required this.userId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });
  late final String mountainId;
  late final String identityCard;
  late final String healthyLetter;
  late final String schedule;
  late final int userId;
  late final String updatedAt;
  late final String createdAt;
  late final int id;

  Data.fromJson(Map<String, dynamic> json) {
    mountainId = json['mountain_id'].toString();
    schedule = json['schedule'];
    userId = json['user_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['mountain_id'] = mountainId;
    _data['schedule'] = schedule;
    _data['user_id'] = userId;
    _data['updated_at'] = updatedAt;
    _data['created_at'] = createdAt;
    _data['id'] = id;
    return _data;
  }
}
