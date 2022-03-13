class FavoriteProduct {
  bool? resp;
  String? msj;
  List<Favorites>? favorites;

  FavoriteProduct({this.resp, this.msj, this.favorites});

  FavoriteProduct.fromJson(Map<String, dynamic> json) {
    resp = json['resp'];
    msj = json['msj'];
    if (json['favorites'] != null) {
      favorites = <Favorites>[];
      json['favorites'].forEach((v) {
        favorites!.add(Favorites.fromJson(v));
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

class Favorites {
  int? idProduct;
  String? nameProduct;
  String? description;
  double? price;
  String? status;
  int? discount;
  List<String>? picture;
  int? quantily;
  int? sold;
  List<String>? colors;
  int? subcategoryId;
  int? brandsId;
  int? favoriteId;

  Favorites(
      {this.idProduct,
      this.nameProduct,
      this.description,
      this.price,
      this.status,
      this.discount,
      this.picture,
      this.quantily,
      this.sold,
      this.colors,
      this.subcategoryId,
      this.brandsId,
      this.favoriteId});

  Favorites.fromJson(Map<String, dynamic> json) {
    idProduct = json['idProduct'];
    nameProduct = json['nameProduct'];
    description = json['description'];
    price = json['price'];
    status = json['status'];
    discount = json['discount'];
    picture = json['picture'].cast<String>();
    quantily = json['quantily'];
    sold = json['sold'];
    colors = json['colors'].cast<String>();
    subcategoryId = json['subcategory_id'];
    brandsId = json['brands_id'];
    favoriteId = json['favorite_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idProduct'] = idProduct;
    data['nameProduct'] = nameProduct;
    data['description'] = description;
    data['price'] = price;
    data['status'] = status;
    data['discount'] = discount;
    data['picture'] = picture;
    data['quantily'] = quantily;
    data['sold'] = sold;
    data['colors'] = colors;
    data['subcategory_id'] = subcategoryId;
    data['brands_id'] = brandsId;
    data['favorite_id'] = favoriteId;
    return data;
  }
}
