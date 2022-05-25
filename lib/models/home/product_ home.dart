// ignore_for_file: file_names
class ProductHome {
  bool? resp;
  String? msj;
  List<Products>? products;

  ProductHome({this.resp, this.msj, this.products});

  ProductHome.fromJson(Map<String, dynamic> json) {
    resp = json['resp'];
    msj = json['msj'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resp'] = resp;
    data['msj'] = msj;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? idProduct;
  String? nameProduct;
  String? description;
  int? price;
  int? status;
  int? discount;
  List<String>? picture;
  int? quantily;
  int? sold;
  List<String>? colors;
  int? brandsId;
  int? subcategoryId;
  String? brand;
  int? addDay;
  int? updateday;

  Products(
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
        this.brandsId,
        this.subcategoryId,
        this.brand,
        this.addDay,
        this.updateday});

  Products.fromJson(Map<String, dynamic> json) {
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
    brandsId = json['brands_id'];
    subcategoryId = json['subcategory_id'];
    brand = json['brand'];
    addDay = json['addDay'];
    updateday = json['updateday'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idProduct'] = this.idProduct;
    data['nameProduct'] = this.nameProduct;
    data['description'] = this.description;
    data['price'] = this.price;
    data['status'] = this.status;
    data['discount'] = this.discount;
    data['picture'] = this.picture;
    data['quantily'] = this.quantily;
    data['sold'] = this.sold;
    data['colors'] = this.colors;
    data['brands_id'] = this.brandsId;
    data['subcategory_id'] = this.subcategoryId;
    data['brand'] = this.brand;
    data['addDay'] = this.addDay;
    data['updateday'] = this.updateday;
    return data;
  }
}