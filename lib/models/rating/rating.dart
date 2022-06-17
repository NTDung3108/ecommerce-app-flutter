class RatingResponse {
  RatingResponse({
    this.resp,
    this.msj,
    this.ratings,
  });

  bool? resp;
  String? msj;
  List<Rating>? ratings;

  factory RatingResponse.fromJson(Map<String, dynamic> json) => RatingResponse(
    resp: json["resp"],
    msj: json["msj"],
    ratings:json["ratings"] == null ? [] : List<Rating>.from(json["ratings"].map((x) => Rating.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "resp": resp,
    "msj": msj,
    "ratings": List<dynamic>.from(ratings!.map((x) => x.toJson())),
  };
}

class Rating {
  Rating({
    this.personId,
    this.firstName,
    this.lastName,
    this.image,
    this.comment,
    this.rating,
    this.date,
  });

  String? personId;
  String? firstName;
  String? lastName;
  String? image;
  String? comment;
  int? rating;
  String? date;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    personId: json["person_id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    image: json["image"],
    comment: json["comment"],
    rating: json["rating"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "person_id": personId,
    "firstName": firstName,
    "lastName": lastName,
    "image": image,
    "comment": comment,
    "rating": rating,
    "date": date,
  };
}
