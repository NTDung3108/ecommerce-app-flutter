class AVGRating{
  bool? resp;
  String? msj;
  double? rating;

  AVGRating({this.resp, this.msj, this.rating});

  AVGRating.fromJson(Map<String, dynamic> json) {
    resp = json['resp'] ?? false;
    msj = json['msj'] ?? '';
    rating = json['rating'] ?? 0.0;
  }
}