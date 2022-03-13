class Category {
  int? id;
  String? category;
  String? picture;
  int? status;

  Category({this.id, this.category, this.picture, this.status});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    picture = json['picture'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category'] = category;
    data['picture'] = picture;
    data['status'] = status;
    return data;
  }
}
