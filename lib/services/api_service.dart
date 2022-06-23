import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mountdaki_flutter/config.dart';
import 'package:mountdaki_flutter/models/account/login_request_model.dart';
import 'package:mountdaki_flutter/models/account/login_response_model.dart';
import 'package:mountdaki_flutter/models/account/register_request_model.dart';
import 'package:mountdaki_flutter/models/account/register_response_model.dart';
import 'package:mountdaki_flutter/models/mountain/mountain.dart';
import 'package:mountdaki_flutter/services/shared_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static var client = http.Client();

  static Future<bool> login(LoginRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiUrl, Config.loginApi);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: model.toJson(),
    );

    if (response.statusCode == 200) {
      await SharedService.setLoginDetails(loginResponseJson(response.body));

      return true;
    } else {
      return false;
    }
  }

  static Future<RegisterResponseModel> register(
      RegisterRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiUrl, Config.registerApi);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: model.toJson(),
    );

    return registerResponseModel(response.body);
  }

  Future<List<Mountain>> getMountains() async {
    var response = await http.get(Uri.http(Config.apiUrl, Config.mountainApi));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body)['data'];

      List<Mountain> mountains = body
          .map(
            (dynamic item) => Mountain.fromJson(item),
          )
          .toList();

      return mountains;
    } else {
      throw 'Data gunung tidak ditemukan';
    }
  }
}
