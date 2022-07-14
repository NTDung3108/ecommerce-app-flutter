import 'dart:convert';
import 'package:ecommerce_app/components/login_dialog.dart';
import 'package:ecommerce_app/models/home/product_%20home.dart';
import 'package:ecommerce_app/models/product/favorite_product.dart';
import 'package:ecommerce_app/models/response.dart';
import 'package:ecommerce_app/screens/sign_in/sign_in_screen.dart';
import 'package:ecommerce_app/services/auth_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FavoritesService {
  static String server = 'http://192.168.78.19:3000/api';
  static var client = http.Client();
  static FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  static Future<List<Products>> getFavorites(BuildContext context, String page) async {
    final token = await AuthServices().readToken();

    Uri uri = Uri.parse('$server/product-favorite-for-user');

    var respose = await client.get(uri,
        headers: {'Accept': 'application/json', 'xx-token': '$token'});

    if (respose.statusCode == 200) {
      var jsonString = respose.body;
      return FavoritesProduct.fromJson(jsonDecode(jsonString)).favorites ?? [];
    }
    if(respose.statusCode == 401){
      if(page != SignInScreen.routeName) {
        LoginDialog.showLoginDialog(context, page);
      }
      return[];
    }
    return [];
  }



  static Future<Response?> addOrDeleteProductFavorite(
      {required int id, required BuildContext context, required String page}) async {
    final token = await AuthServices().readToken();

    Uri uri = Uri.parse('$server/add-Favorite-Product');

    var response = await client.post(uri, headers: {
      'Accept': 'application/json',
      'xx-token': '$token'
    }, body: {
      'idProduct': id.toString(),
      'idUser': '${await secureStorage.read(key: 'uid')}'
    });
    if(response.statusCode == 200) {
      return Response.fromJson(jsonDecode(response.body));
    }
    if(response.statusCode == 401){
     LoginDialog.showLoginDialog(context, page);
     return null;
    }
    return null;
  }
}
