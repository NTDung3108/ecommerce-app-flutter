// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

ProductDetail productFromJson(String str) => ProductDetail.fromJson(json.decode(str));

String productToJson(ProductDetail data) => json.encode(data.toJson());

class ProductDetail {
  ProductDetail({
    this.resp,
    this.msj,
    this.detail,
  });

  bool? resp;
  String? msj;
  Detail? detail;

  factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
    resp: json["resp"],
    msj: json["msj"],
    detail: Detail.fromJson(json["detail"]),
  );

  Map<String, dynamic> toJson() => {
    "resp": resp,
    "msj": msj,
    "detail": detail!.toJson(),
  };
}

class Detail {
  Detail({
    this.idProduct,
    this.nameProduct,
    this.description,
    this.price,
    this.idDiscount,
    this.discount,
    this.picture,
    this.quantily,
    this.sold,
    this.colors,
    this.brand,
    this.name,
    this.addDay,
    this.updateday,
    this.importPrice,
  });

  int? idProduct;
  String? nameProduct;
  String? description;
  int? price;
  int? idDiscount;
  int? discount;
  List<String>? picture;
  int? quantily;
  int? sold;
  List<String>? colors;
  String? brand;
  String? name;
  int? addDay;
  int? updateday;
  int? importPrice;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    idProduct: json["idProduct"],
    nameProduct: json["nameProduct"],
    description: json["description"],
    price: json["price"],
    idDiscount: json["idDiscount"],
    discount: json["discount"],
    picture: List<String>.from(json["picture"].map((x) => x)),
    quantily: json["quantily"],
    sold: json["sold"],
    colors: List<String>.from(json["colors"].map((x) => x)),
    brand: json["brand"],
    name: json["name"],
    addDay: json["addDay"],
    updateday: json["updateday"],
    importPrice: json["importPrice"],
  );

  Map<String, dynamic> toJson() => {
    "idProduct": idProduct,
    "nameProduct": nameProduct,
    "description": description,
    "price": price,
    "idDiscount": idDiscount,
    "discount": discount,
    "picture": List<dynamic>.from(picture!.map((x) => x)),
    "quantily": quantily,
    "sold": sold,
    "colors": List<dynamic>.from(colors!.map((x) => x)),
    "brand": brand,
    "name": name,
    "addDay": addDay,
    "updateday": updateday,
    "importPrice": importPrice,
  };
}
