import 'dart:convert';
import 'package:ecommerce_app/models/person.dart';
import 'package:ecommerce_app/models/response.dart';
import 'package:ecommerce_app/models/userInfomation/user_information.dart';
import 'package:ecommerce_app/services/auth_services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class UserServices {
  static String server = 'http://10.50.10.90:3000/api';
  static var client = http.Client();
  static FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  static Future<Person?> getPersonInformation() async {
    const token = '';

    Uri uri = Uri.parse('$server/get-personal-information');

    final response = await client
        .get(uri, headers: {'Accept': 'application/json', 'xx-token': token});

    return UserInformation.fromJson(jsonDecode(response.body)).person;
  }

  static Future<Response> registerUserInfo(
      {String? firstName,
      String? lastName,
      String? phone,
      String? address,
      String? reference}) async {
    final token = AuthServices().readToken();

    Uri uri = Uri.parse('$server/api/personal/register');

    final resp = await client.put(uri, headers: {
      'Accept': 'application/json',
      'xx-token': '$token'
    }, body: {
      'firstname': firstName,
      'lastname': lastName,
      'phone': phone,
      'address': address,
      'reference': reference,
    });

    return Response.fromJson(jsonDecode(resp.body));
  }
}
