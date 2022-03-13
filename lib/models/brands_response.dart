class BrandsResponse {
  bool? resp;
  String? msj;
  List<Brands>? brands;

  BrandsResponse({this.resp, this.msj, this.brands});

  BrandsResponse.fromJson(Map<String, dynamic> json) {
    resp = json['resp'];
    msj = json['msj'];
    if (json['brands'] != null) {
      brands = <Brands>[];
      json['brands'].forEach((v) {
        brands!.add(Brands.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resp'] = resp;
    data['msj'] = msj;
    if (brands != null) {
      data['brands'] = brands!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Brands {
  int? brandsId;
  String? brand;
  String? picture;

  Brands({this.brandsId, this.brand, this.picture});

  Brands.fromJson(Map<String, dynamic> json) {
    brandsId = json['brands_id'];
    brand = json['brand'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['brands_id'] = brandsId;
    data['brand'] = brand;
    data['picture'] = picture;
    return data;
  }
}