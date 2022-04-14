import 'dart:developer';
import 'package:ecommerce_app/models/home/product_%20home.dart';
import 'package:ecommerce_app/services/auth_services.dart';
import 'package:ecommerce_app/services/favorites_service.dart';
import 'package:get/get.dart';

class FavoritesController extends GetxController {
  var isLoading = true.obs;

  var favoritesProduct = <Products>[].obs;

  var favorite = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getFavoritesProduct();
  }

  void getFavoritesProduct() async {
    var hasToken = await AuthServices().hasToken();
    if(hasToken){
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
  }

  void addOrDeleteFavorites(Products product) async {
   var login = await AuthServices().hasToken();
   if (login){
     if(favorite.value){
       try {
         final resp = await FavoritesService.addOrDeleteProductFavorite(id: '${product.idProduct}');
         if (resp.resp!) {
           log(resp.msj!);
           favorite(false);
           favorite.refresh();
           for(int i=0; i<favoritesProduct.length; i++){
             if(favoritesProduct[i].idProduct == product.idProduct) {
               favoritesProduct.removeAt(i);
             }
           }
         } else {
           log(resp.msj!);
         }
       } catch (e) {
         log(e.toString());
       }
     }else{
       try {
         final resp = await FavoritesService.addOrDeleteProductFavorite(id: '${product.idProduct}');
         if (resp.resp!) {
           log(resp.msj!);
           favorite(true);
           favorite.refresh();
           favoritesProduct.add(product);
         } else {
           log(resp.msj!);
         }
       } catch (e) {
         log(e.toString());
       }
     }
   }else{

   }
  }

  void checkFavorite(int? id){
    for(int i=0; i<favoritesProduct.length; i++){
      if(favoritesProduct[i].idProduct == id){
        favorite(true);
        break;
      }else{
        favorite(false);
      }
    }
  }



}
