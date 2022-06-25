import 'dart:convert';

ClimbingRegistrationResponseModel climbingRegistrationResponseJson(
        String str) =>
    ClimbingRegistrationResponseModel.fromJson(json.decode(str));

class ClimbingRegistrationResponseModel {
  ClimbingRegistrationResponseModel({
    required this.success,
    required this.data,
    required this.message,
  });
  late final bool success;
  late final List<Data> data;
  late final String message;

  ClimbingRegistrationResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data.map((e) => e.toJson()).toList();
    _data['message'] = message;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.mountainId,
    required this.userId,
    required this.schedule,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.mountainName,
    required this.userName,
  });
  late final int id;
  late final int mountainId;
  late final int userId;
  late final String schedule;
  late final String status;
  late final String createdAt;
  late final String updatedAt;
  late final String mountainName;
  late final String userName;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mountainId = json['mountain_id'];
    userId = json['user_id'];
    schedule = json['schedule'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    mountainName = json['mountain_name'];
    userName = json['user_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['mountain_id'] = mountainId;
    _data['user_id'] = userId;
    _data['schedule'] = schedule;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['mountain_name'] = mountainName;
    _data['user_name'] = userName;
    return _data;
  }
}
