import 'dart:convert';

import 'package:ecommerce_app/models/brands_response.dart';
import 'package:ecommerce_app/models/home/product_%20home.dart';
import 'package:ecommerce_app/models/product/order_detail.dart';
import 'package:ecommerce_app/models/product/product_card.dart';
import 'package:ecommerce_app/models/product/puchased_products_response.dart';
import 'package:ecommerce_app/models/response.dart';
import 'package:ecommerce_app/services/auth_services.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static String server = 'http://192.168.20.106:3000/api';
  static var client = http.Client();

  static Future<List<Products>?> getProductsForCategories(
      {required int? id}) async {
    Uri uri = Uri.parse('$server/get-products-for-subcategories/$id');

    var response = await client.get(uri);

    if (response.statusCode == 200) {
      return ProductHome.fromJson(jsonDecode(response.body)).products;
    }
    return null;
  }

  static Future<Response> saveOrderBuyProduct(
      {required String status,
      required String date,
      required String amount,
      required String address,
      required String note,
      required String payment,
      required List<ProductCart> products}) async {
    var token = await AuthServices().readToken();

    Map<String, dynamic> data = {
      'status': status,
      'date': date,
      'amount': amount,
      'address': address,
      'note': note,
      'payment': payment,
      'products': products
    };

    var body = jsonEncode(data);

    Uri uri = Uri.parse('$server/save-order-products');

    var resp = await client.post(uri,
        headers: {'Content-type': 'application/json', 'xx-token': '$token'},
        body: body);

    return Response.fromJson(jsonDecode(resp.body));
  }

  static Future<Response> updateQuantityProduct(
      {required List<ProductCart> products}) async {
    var token = await AuthServices().readToken();

    Map<String, dynamic> data = {'products': products};

    var body = jsonEncode(data);

    Uri uri = Uri.parse('$server/update-quantity-product');

    var resp = await client.put(uri,
        headers: {'Content-type': 'application/json', 'xx-token': '$token'},
        body: body);

    return Response.fromJson(jsonDecode(resp.body));
  }

  static Future<PuchasedProductsResponse> getPuchasedProducts() async {
    var token = await AuthServices().readToken();

    Uri uri = Uri.parse('$server/get-purchased-products');

    var response = await client.get(
      uri,
      headers: {
        'Content-type': 'application/json',
        'xx-token': '$token',
      },
    );
    return PuchasedProductsResponse.fromJson(jsonDecode(response.body));
  }

  static Future<List<Brands>?> getBrandsForSubcategory({int? id}) async {
    Uri uri = Uri.parse('$server/get-brands-list/$id');

    var response = await client.get(uri);

    if (response.statusCode == 200) {
      return BrandsResponse.fromJson(jsonDecode(response.body)).brands;
    }
    return null;
  }

  static Future<List<Products>?> getAllProduct() async {
    Uri uri = Uri.parse('$server/get-all-product');

    var response = await client.get(uri);

    if (response.statusCode == 200) {
      return ProductHome.fromJson(jsonDecode(response.body)).products;
    }
    return null;
  }

  static Future<OrderDetail> getOrderDetail({required String id}) async {
    var token = await AuthServices().readToken();

    Uri uri = Uri.parse('$server/get-detail-by-id/$id');

    var response = await client.get(
      uri,
      headers: {
        'Content-type': 'application/json',
        'xx-token': '$token',
      },
    );
    return OrderDetail.fromJson(jsonDecode(response.body));
  }

  static Future<Response> updateOrderStatus(
      {required int status, required int orderId, required String reason}) async {
    var token = await AuthServices().readToken();

    Map<String, dynamic> data = {
      'status': status,
      'reason': reason,
      'orderId': orderId
    };

    var body = jsonEncode(data);

    Uri uri = Uri.parse('$server/update-order-status');

    var resp = await client.put(uri,
        headers: {'Content-type': 'application/json', 'xx-token': '$token'},
        body: body);

    return Response.fromJson(jsonDecode(resp.body));
  }
}
