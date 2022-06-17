import 'dart:developer';
import 'package:ecommerce_app/models/home/product_%20home.dart';
import 'package:ecommerce_app/screens/home/home_screen.dart';
import 'package:ecommerce_app/services/favorites_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../services/auth_services.dart';

class FavoritesController extends GetxController {
  var isLoading = false;
  var favoritesProduct = <Products>[];
  var favorite = false;
  int i = 0;

  void getFavoritesProduct(BuildContext context, String page) async {
    favoritesProduct.clear();
    try {
      if(page == HomeScreen.routeName){
        final token = await AuthServices().readToken();
        if(token != null && i == 0){
          favoritesProduct.clear();
          isLoading = true;
          var favorites = await FavoritesService.getFavorites(context, page);
          favoritesProduct.addAll(favorites);
          i = 1;
        }
      }else{
        isLoading = true;
        var favorites = await FavoritesService.getFavorites(context, page);
        favoritesProduct.clear();
        favoritesProduct.addAll(favorites);
      }
    } finally {
      isLoading = false;
    }
    update();
  }

  void addOrDeleteFavorites(
      int idProduct, BuildContext context, String page) async {
    if (favorite) {
      try {
        final resp = await FavoritesService.addOrDeleteProductFavorite(
            id: idProduct, context: context, page: page);
        if (resp!.resp!) {
          log(resp.msj!);
          favorite = false;
          for (int i = 0; i < favoritesProduct.length; i++) {
            if (favoritesProduct[i].idProduct == idProduct) {
              favoritesProduct.removeAt(i);
            }
          }
        } else {
          log(resp.msj!);
        }
      } catch (e) {
        log(e.toString());
      }
    } else {
      try {
        final resp = await FavoritesService.addOrDeleteProductFavorite(
            id: idProduct, context: context, page: page);
        if (resp!.resp!) {
          log(resp.msj!);
          favorite = true;
        } else {
          log(resp.msj!);
        }
      } catch (e) {
        log(e.toString());
      }
    }
    update();
  }

  void checkFavorite(int? id) {
    for (int i = 0; i < favoritesProduct.length; i++) {
      if (favoritesProduct[i].idProduct == id) {
        favorite = true;
        break;
      } else {
        favorite = false;
      }
    }
  }
}
