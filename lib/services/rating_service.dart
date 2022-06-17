import 'dart:convert';

import 'package:ecommerce_app/components/login_dialog.dart';
import 'package:ecommerce_app/models/rating/avg_rating.dart';
import 'package:ecommerce_app/models/rating/rating.dart';
import 'package:ecommerce_app/models/response.dart';
import 'package:ecommerce_app/screens/details/details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'auth_services.dart';

class RattingService {
  static String server = 'http://10.50.10.135:3000/api';
  static var client = http.Client();
  static FlutterSecureStorage secureStorage = const FlutterSecureStorage();

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
      {int? productId,
      double? rating,
      String? comment,
      required BuildContext context}) async {
    final token = await AuthServices().readToken();
    Uri uri = Uri.parse('$server/new-comment');

    final resp = await client.post(
      uri,
      headers: {'Accept': 'application/json', 'xx-token': '$token'},
      body: {
        'in_productId': productId.toString(),
        'in_personId': '${await secureStorage.read(key: 'uid')}',
        'in_rating': rating.toString(),
        'in_comment': comment,
        'in_date': DateFormat('yyyy-MM-dd').format(DateTime.now()),
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
