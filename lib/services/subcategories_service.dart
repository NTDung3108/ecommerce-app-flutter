import 'dart:convert';
import 'package:ecommerce_app/models/subcategory/saubcategories.dart';
import 'package:http/http.dart' as http;

class SubcategoriesService {
  static String server = 'http://10.50.10.90:3000/api';
  static var client = http.Client();

  static Future<List<Subcategories>?> getCategories(int id) async {
    Uri uri = Uri.parse('$server/list-subcategories-all/$id');

    var respose = await client.get(uri);

    if (respose.statusCode == 200) {
      var jsonString = respose.body;
      return SubCategoriesResponse.fromJson(jsonDecode(jsonString))
          .subcategories;
    }
    return null;
  }

  static Future<List<Subcategories>?> getAllCategories() async {
    Uri uri = Uri.parse('$server/get-all-subcategories');

    var response = await client.get(uri);

    if(response.statusCode == 200) {
      var jsonString = response.body;
      return SubCategoriesResponse.fromJson(jsonDecode(jsonString))
          .subcategories;
    }
    return null;
  }
}
