class RatingResponse {
  bool? resp;
  String? msj;
  List<Rating>? ratings;

  RatingResponse({this.resp, this.msj, this.ratings});

  RatingResponse.fromJson(Map<String, dynamic> json) {
    resp = json['resp'];
    msj = json['msj'];
    if (json['ratings'] != null) {
      ratings = <Rating>[];
      json['ratings'].forEach((v) {
        ratings!.add(Rating.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resp'] = resp;
    data['msj'] = msj;
    if (ratings != null) {
      data['ratings'] =
          ratings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rating {
  int? id;
  int? productId;
  String? personId;
  int? rating;
  String? comment;
  String? image;
  String? date;

  Rating(
      {this.id,
        this.productId,
        this.personId,
        this.rating,
        this.comment,
        this.image,
        this.date});

  Rating.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'] ?? '';
    personId = json['person_id'] ?? '';
    rating = json['rating'] ?? '';
    comment = json['comment'] ?? '';
    image = json['image'] ?? '';
    date = json['date'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['person_id'] = personId;
    data['rating'] = rating;
    data['comment'] = comment;
    data['image'] = image;
    data['date'] = date;
    return data;
  }
}