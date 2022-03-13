import 'dart:convert';

import 'package:ecommerce_app/models/brands_response.dart';
import 'package:ecommerce_app/models/home/product_%20home.dart';
import 'package:ecommerce_app/models/product_card.dart';
import 'package:ecommerce_app/models/puchased_products_response.dart';
import 'package:ecommerce_app/models/response.dart';
import 'package:ecommerce_app/services/auth_services.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static String server = 'http://10.50.10.90:3000/api';
  static var client = http.Client();

  static Future<List<Products>?> getProductsForCategories(
      {required int? id}) async {
    Uri uri = Uri.parse('$server/get-products-for-subcategories/$id');

    var response = await client.get(uri);

    if (response.statusCode == 200) {
      return ProductHome.fromJson(jsonDecode(response.body)).products;
    }
  }

  static Future<Response> saveOrderBuyProduct(
      {required String status,
      required String date,
      required String amount,
      required String address,
      required List<ProductCart> products}) async {
    var token = await AuthServices().readToken();

    Map<String, dynamic> data = {
      'status': status,
      'date': date,
      'amount': amount,
      'address': address,
      'products': products
    };

    var body = jsonEncode(data);

    Uri uri = Uri.parse('$server/save-order-products');

    var resp = await client.post(uri,
        headers: {'Content-type': 'application/json', 'xx-token': token},
        body: body);

    return Response.fromJson(jsonDecode(resp.body));
  }

  Future<PuchasedProductsResponse> getPuchasedProducts(
      {required String id}) async {
    var token = await AuthServices().readToken();

    Uri uri = Uri.parse('$server/get-purchased-products');

    var response = await client.get(
      uri,
      headers: {'Content-type': 'application/json', 'xx-token': token},
    );
    return PuchasedProductsResponse.fromJson(jsonDecode(response.body));
  }
  
  static Future<List<Brands>?> getBrandsForSubcategory({int? id}) async {
    Uri uri = Uri.parse('$server/get-brands-list/$id');

    var response = await client.get(uri);

    if(response.statusCode == 200){
      return BrandsResponse.fromJson(jsonDecode(response.body)).brands;
    }
  }
}
