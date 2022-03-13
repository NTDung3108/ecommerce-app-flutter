import 'dart:convert';
import 'package:ecommerce_app/models/product/favorite_product.dart';
import 'package:ecommerce_app/models/response.dart';
import 'package:ecommerce_app/services/auth_services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FavoritesService {
  static String server = 'http://10.50.10.90:3000/api';
  static var client = http.Client();
  static FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  static Future<List<Favorites>?> getFavorites() async {
    final token = AuthServices().readToken();

    Uri uri = Uri.parse('$server/product-favorite-for-user');

    var respose = await client.get(uri,
        headers: {'Accept': 'application/json', 'xx-token': '$token'});

    if (respose.statusCode == 200) {
      var jsonString = respose.body;
      return FavoriteProduct.fromJson(jsonDecode(jsonString)).favorites;
    }
  }

  static Future<Response> addOrDeleteProductFavorite(
      {required String id}) async {
    final token = AuthServices().readToken();

    Uri uri = Uri.parse('$server/add-Favorite-Product');

    var response = await client.post(uri, headers: {
      'Accept': 'application/json',
      'xx-token': '$token'
    }, body: {
      'idProduct': id,
      'idUser': await secureStorage.read(key: 'uid')
    });

    return Response.fromJson(jsonDecode(response.body));
  }
}