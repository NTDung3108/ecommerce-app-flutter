import 'dart:developer';

import 'package:ecommerce_app/components/product_card.dart';
import 'package:ecommerce_app/models/product/favorite_product.dart';
import 'package:ecommerce_app/services/favorites_service.dart';
import 'package:get/get.dart';

class FavoritesController extends GetxController {
  var isLoading = true.obs;

  var favoritesProduct = <Favorites>[].obs;

  var productCars = <ProductCard>[].obs;

  void getFavoritesProduct() async {
    try {
      isLoading(true);

      var favorites = await FavoritesService.getFavorites();

      if (favorites != null) {
        favoritesProduct.value = favorites;
      }
    } finally {
      isLoading(false);
    }
  }

  void addOrDeleteFavorites(String idProduct) async {
    try {
      final resp =
          await FavoritesService.addOrDeleteProductFavorite(id: idProduct);
      if (resp.resp!) {
        log(resp.msj!);
      } else {
        log(resp.msj!);
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
