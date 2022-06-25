class AddClimbingRegistrationRequestModel {
  AddClimbingRegistrationRequestModel({
    required this.mountainId,
    required this.schedule,
  });
  late final int mountainId;
  late final String schedule;

  AddClimbingRegistrationRequestModel.fromJson(Map<String, dynamic> json) {
    mountainId = json['mountain_id'];
    schedule = json['schedule'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['mountain_id'] = mountainId;
    _data['schedule'] = schedule;
    return _data;
  }
}
