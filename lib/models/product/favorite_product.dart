import 'package:ecommerce_app/models/home/product_%20home.dart';

class FavoritesProduct {
  bool? resp;
  String? msj;
  List<Products>? favorites;

  FavoritesProduct({this.resp, this.msj, this.favorites});

  FavoritesProduct.fromJson(Map<String, dynamic> json) {
    resp = json['resp'];
    msj = json['msj'];
    if (json['favorites'] != null) {
      favorites = <Products>[];
      json['favorites'].forEach((v) {
        favorites!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resp'] = resp;
    data['msj'] = msj;
    if (favorites != null) {
      data['favorites'] = favorites!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

