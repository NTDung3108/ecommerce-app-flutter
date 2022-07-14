import 'dart:convert';

import 'package:ecommerce_app/models/category.dart';
import 'package:ecommerce_app/models/home/categories_home.dart';
import 'package:http/http.dart' as http;

class CategoriesService {
  static String server = 'http://192.168.78.19:3000/api';
  static var client = http.Client();

  static Future<List<Category>?> getCategories() async {
    Uri uri = Uri.parse('$server/list-categories-all');

    var respose = await client.get(uri);

    if (respose.statusCode == 200) {
      var jsonString = respose.body;
      return Categories.fromJson(jsonDecode(jsonString)).categories;
    }
    return null;
  }

}
