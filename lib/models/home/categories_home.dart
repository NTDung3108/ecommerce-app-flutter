import 'package:ecommerce_app/models/category.dart';

class Categories {
  bool? resp;
  String? msj;
  List<Category>? categories;

  Categories({this.resp, this.msj, this.categories});

  Categories.fromJson(Map<String, dynamic> json) {
    resp = json['resp'];
    msj = json['msj'];
    if (json['categories'] != null) {
      categories = <Category>[];
      json['categories'].forEach((v) {
        categories!.add(Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resp'] = resp;
    data['msj'] = msj;
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
