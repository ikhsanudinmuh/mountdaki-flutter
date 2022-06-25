import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mountdaki_flutter/config.dart';
import 'package:mountdaki_flutter/models/account/login_request_model.dart';
import 'package:mountdaki_flutter/models/account/login_response_model.dart';
import 'package:mountdaki_flutter/models/account/register_request_model.dart';
import 'package:mountdaki_flutter/models/account/register_response_model.dart';
import 'package:mountdaki_flutter/models/account/user_response_model.dart';
import 'package:mountdaki_flutter/models/climbing_registration/add_climbing_registration_request_model.dart';
import 'package:mountdaki_flutter/models/climbing_registration/add_climbing_registration_response_model.dart';
import 'package:mountdaki_flutter/models/climbing_registration/climbing_registration_response_model.dart';
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
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 200) {
      await SharedService.setLoginDetails(loginResponseJson(response.body));

      return true;
    } else {
      return false;
    }
  }

  static Future<bool> isLoggedIn() async {
    var login = await SharedService.isLoggedIn();
    if (login) {
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
      body: jsonEncode(model.toJson()),
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

  static Future<UserResponseModel> getUserProfile() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.data!.accessToken}',
    };

    var url = Uri.http(Config.apiUrl, '/api/users/${loginDetails.data!.id}');

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    return userResponseJson(response.body);
  }

  static Future<AddClimbingRegistrationResponseModel> addClimbingRegistration(
      AddClimbingRegistrationRequestModel model) async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.data!.accessToken}',
    };

    var url = Uri.http(Config.apiUrl, Config.climbingRegistrationApi);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    return addClimbingRegistrationResponseJson(response.body);
  }

  static Future<ClimbingRegistrationResponseModel>
      getClimbingRegistration() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.data!.accessToken}',
    };

    var url = Uri.http(
      Config.apiUrl,
      '/api/climbing_registrations/users/${loginDetails.data!.id}',
    );

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    return climbingRegistrationResponseJson(response.body);
  }
}
