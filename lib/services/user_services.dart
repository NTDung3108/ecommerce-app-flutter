import 'dart:convert';
import 'package:ecommerce_app/components/login_dialog.dart';
import 'package:ecommerce_app/models/Information.dart';
import 'package:ecommerce_app/models/response.dart';
import 'package:ecommerce_app/models/update_profile.dart';
import 'package:ecommerce_app/models/userInfomation/user_information.dart';
import 'package:ecommerce_app/screens/profile/profile_screen.dart';
import 'package:ecommerce_app/services/auth_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class UserServices {
  static String server = 'http://192.168.78.19:3000/api';
  static var client = http.Client();
  static FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  static Future<Information?> getPersonInformation(BuildContext context) async {
    final token = await AuthServices().readToken();

    Uri uri = Uri.parse('$server/get-personal-information');

    final response = await client.get(uri,
        headers: {'Accept': 'application/json', 'xx-token': '$token'});

    if(response.statusCode == 200) {
      return UserInformation.fromJson(jsonDecode(response.body)).information;
    }
    if(response.statusCode == 401){
      LoginDialog.showLoginDialog(context, ProfileScreen.routeName);
      return null;
    }
    return null;
  }

  static Future<Response> registerUserInfo(
      {String? firstName,
      String? lastName,
      String? phone,
      String? address,
      String? gender,
      String? uid}) async {
    Uri uri = Uri.parse('$server/personal/register');

    final resp = await client.put(
      uri,
      headers: {
        'Accept': 'application/json',
      },
      body: {
        'firstname': firstName,
        'lastname': lastName,
        'phone': phone,
        'address': address,
        'gender': gender,
        'uid': uid
      },
    );

    return Response.fromJson(jsonDecode(resp.body));
  }

  static Future<UpdateProfile> updateImageProfile(String? image, String? uid) async {
    final token = await AuthServices().readToken();
    
    Uri uri = Uri.parse('$server/update-image-profile');
    
    var request = http.MultipartRequest('PUT', uri)
      ..headers['Accept'] = 'application/json'
      ..headers['xx-token'] = token!
      ..fields['uidPerson'] = uid!
      ..files.add(await http.MultipartFile.fromPath('image', image!));

    final resp = await request.send();

    var data = await http.Response.fromStream(resp);
    
    return UpdateProfile.fromJson(jsonDecode(data.body));
  }

  static Future<Response?> updateFirstName(String? firstName) async {
    final token = await AuthServices().readToken();

    Uri uri = Uri.parse('$server/personal/updateFirstName');

    final response = await client.put(
      uri,
      headers: {'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded',
        'xx-token': '$token'
      },
      body: {
        'firstName': firstName,
      },
    );

    return Response.fromJson(jsonDecode(response.body));
  }

  static Future<Response?> updateLastName(String? lastName) async {
    final token = await AuthServices().readToken();

    Uri uri = Uri.parse('$server/personal/updateLastName');

    final response = await client.put(
      uri,
      headers: {'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded',
        'xx-token': '$token'},
      body: {
        'lastName': lastName,
      },
    );

    return Response.fromJson(jsonDecode(response.body));
  }

  static Future<Response?> updatePhone(String? phone) async {
    final token = await AuthServices().readToken();

    Uri uri = Uri.parse('$server/personal/updatePhone');

    final response = await client.put(
      uri,
      headers: {'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded',
        'xx-token': '$token'},
      body: {
        'phone': phone,
      },
    );

    return Response.fromJson(jsonDecode(response.body));
  }

  static Future<Response?> updateAddress(String? address) async {
    final token = await AuthServices().readToken();

    Uri uri = Uri.parse('$server/personal/updateAddress');

    final response = await client.put(
      uri,
      headers: {'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded',
        'xx-token': '$token'},
      body: {
        'address': address,
      },
    );

    return Response.fromJson(jsonDecode(response.body));
  }

  static Future<Response?> checkPhoneNumber(String phone) async {
    Uri uri = Uri.parse('$server/check-phone/$phone');

    var respose = await client.get(uri);

    if (respose.statusCode == 200) {
      var jsonString = respose.body;
      return Response.fromJson(jsonDecode(jsonString));
    }
  }

  static Future<Response?> forgotPassword(
      {required String password, required String phone}) async {

    Uri uri = Uri.parse('$server/forgot-password');

    final response = await client.put(
      uri,
      headers: {'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'passwordd': password,
        'phone': phone
      },
    );

    return Response.fromJson(jsonDecode(response.body));
  }
}
