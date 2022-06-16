import 'package:ecommerce_app/models/rating/rating.dart';
import 'package:ecommerce_app/services/rating_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RatingController extends GetxController {
  var rating = 0.0.obs;
  var comments = <Rating>[].obs;

  void getAVGRating(int idProduct) async {
    try {
      rating.value = await RattingService.getAVGRating(id: idProduct);
    } catch (e) {
      throw Exception(e);
    }
  }

  void getComment(int idProduct) async {
    try {
      var res = await RattingService.getRating(id: idProduct);
      if (res.isNotEmpty == true) comments.value = res;
    } catch (e) {
      throw Exception(e);
    }
  }

  void newComment(
      {String? productId,
      String? personId,
      String? rating,
      String? comment,
      String? date,
      required BuildContext context}) async {
    try {
      var resp = await RattingService.addNewRating(
          productId: productId,
          personId: personId,
          rating: rating,
          comment: comment,
          date: date,
          context: context);
      if(resp!.resp!){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${resp.msj}'),
        ));
        Navigator.pop(context);
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${resp.msj}'),
        ));
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
