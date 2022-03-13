class SubCategoriesResponse {
  bool? resp;
  String? msj;
  List<Subcategories>? subcategories;

  SubCategoriesResponse({this.resp, this.msj, this.subcategories});

  SubCategoriesResponse.fromJson(Map<String, dynamic> json) {
    resp = json['resp'];
    msj = json['msj'];
    if (json['subcategories'] != null) {
      subcategories = <Subcategories>[];
      json['subcategories'].forEach((v) {
        subcategories!.add(Subcategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resp'] = this.resp;
    data['msj'] = this.msj;
    if (this.subcategories != null) {
      data['subcategories'] =
          this.subcategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subcategories {
  int? id;
  String? name;
  String? picture;
  int? categoryId;
  int? status;
  int? views;
  String? icon;

  Subcategories(
      {this.id,
        this.name,
        this.picture,
        this.categoryId,
        this.status,
        this.views,
        this.icon});

  Subcategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    picture = json['picture'];
    categoryId = json['category_id'];
    status = json['status'];
    views = json['views'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['picture'] = picture;
    data['category_id'] = categoryId;
    data['status'] = status;
    data['views'] = views;
    data['icon'] = icon;
    return data;
  }
}