import 'dart:convert';

import 'package:ecommerce_app/components/login_dialog.dart';
import 'package:ecommerce_app/models/rating/avg_rating.dart';
import 'package:ecommerce_app/models/rating/rating.dart';
import 'package:ecommerce_app/models/response.dart';
import 'package:ecommerce_app/screens/details/details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'auth_services.dart';

class RattingService {
  static String server = 'http://192.168.2.101:3000/api';
  static var client = http.Client();

  static Future<List<Rating>> getRating({required int? id}) async {
    Uri uri = Uri.parse('$server/get-commet/$id');

    var response =
        await client.get(uri, headers: {'Accept': 'application/json'});

    if (response.statusCode == 200) {
      return RatingResponse.fromJson(jsonDecode(response.body)).ratings ?? [];
    }
    return [];
  }

  static Future<double> getAVGRating({required int? id}) async {
    Uri uri = Uri.parse('$server/get-avg-rating/$id');

    var response = await client.get(uri);

    if (response.statusCode == 200) {
      return AVGRating.fromJson(jsonDecode(response.body)).rating ?? 0.0;
    }
    return 0.0;
  }

  static Future<Response?> addNewRating(
      {String? productId,
      String? personId,
      String? rating,
      String? comment,
      String? date,
      required BuildContext context}) async {
    final token = await AuthServices().readToken();
    Uri uri = Uri.parse('$server/new-comment');

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
    if(resp.statusCode == 200) {
      return Response.fromJson(jsonDecode(resp.body));
    }
    if(resp.statusCode == 401) {
      LoginDialog.showLoginDialog(context, DetailsScreen.routeName);
      return null;
    }

    return null;
  }
}
