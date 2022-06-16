import 'dart:convert';

import 'package:ecommerce_app/models/rating/avg_rating.dart';
import 'package:ecommerce_app/models/rating/rating.dart';
import 'package:ecommerce_app/models/response.dart';
import 'package:http/http.dart' as http;

import 'auth_services.dart';

class RattingServer {
  static String server = 'http://10.50.10.135:3000/api';
  static var client = http.Client();

  static Future<List<Rating>?> getRating({required int? id}) async {
    final token = await AuthServices().readToken();
    Uri uri = Uri.parse('$server/get-rating/$id');

    var response = await client.get(uri,
        headers: {'Accept': 'application/json', 'xx-token': '$token'});

    if (response.statusCode == 200) {
      return RatingResponse.fromJson(jsonDecode(response.body)).ratings;
    }
    return null;
  }

  static Future<double?> getAVGRating({required int? id}) async {
    Uri uri = Uri.parse('$server/get-avg-rating/$id');

    var response = await client.get(uri);

    if (response.statusCode == 200) {
      return AVGRating.fromJson(jsonDecode(response.body)).rating;
    }
    return null;
  }

  static Future<Response> addNewRating(
      {String? productId,
        String? personId,
        String? rating,
        String? comment,
        String? image,
        String? date}) async {

    final token = await AuthServices().readToken();
    Uri uri = Uri.parse('$server/api/new-rating');

    final resp = await client.put(
      uri,
      headers: {'Accept': 'application/json', 'xx-token': '$token'},
      body: {
        'in_productId': productId,
        'in_personId': personId,
        'in_rating': rating,
        'in_comment': comment,
        'in_date': date
      },
    );
    return Response.fromJson(jsonDecode(resp.body));
  }
}
