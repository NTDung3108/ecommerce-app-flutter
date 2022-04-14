import 'dart:convert';
import 'package:ecommerce_app/models/category.dart';
import 'package:ecommerce_app/models/home/categories_home.dart';
import 'package:ecommerce_app/models/home/discount_home.dart';
import 'package:ecommerce_app/models/home/product_%20home.dart';
import 'package:ecommerce_app/models/subcategory/saubcategories.dart';
import 'package:http/http.dart' as http;

class HomeService {
  static String server = 'http://10.50.10.90:3000/api';
  static var client = http.Client();

  static Future<List<Products>?> getHomeProduct() async {
    Uri uri = Uri.parse('$server/list-products-home');

    var respose = await client.get(uri);

    if (respose.statusCode == 200) {
      var jsonString = respose.body;
      return ProductHome.fromJson(jsonDecode(jsonString)).products;
    }
    return null;
  }

  static Future<List<Category>?> getCategoriesHome() async {
    Uri uri = Uri.parse('$server/list-categories-home');

    var respose = await client.get(uri);

    if (respose.statusCode == 200) {
      var jsonString = respose.body;
      return Categories.fromJson(jsonDecode(jsonString)).categories;
    }
    return null;
  }

  static Future<List<Discounts>?> getDiscountBanner() async {
    Uri uri = Uri.parse('$server/discount-banners-home');

    var respose = await client.get(uri);

    if (respose.statusCode == 200) {
      var jsonString = respose.body;
      return DiscountsHome.fromJson(jsonDecode(jsonString)).discounts;
    }
    return null;
  }

  static Future<List<Subcategories>?> listSubCategoryHome() async {
    Uri uri = Uri.parse('$server/list-subcategory-home');

    var res = await client.get(uri);

    if (res.statusCode == 200) {
      var jsonString = res.body;
      return SubCategoriesResponse.fromJson(jsonDecode(jsonString))
          .subcategories;
    }
    return null;
  }
}
