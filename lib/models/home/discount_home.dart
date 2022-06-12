class DiscountsHome {
  bool? resp;
  String? msj;
  List<Discounts>? discounts;

  DiscountsHome({this.resp, this.msj, this.discounts});

  DiscountsHome.fromJson(Map<String, dynamic> json) {
    resp = json['resp'];
    msj = json['msj'];
    if (json['discounts'] != null) {
      discounts = <Discounts>[];
      json['discounts'].forEach((v) {
        discounts!.add(Discounts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resp'] = resp;
    data['msj'] = msj;
    if (discounts != null) {
      data['discounts'] = discounts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Discounts {
  int? idDiscount;
  String? title;
  String? content;
  String? picture;
  int? discount;
  int? startTime;
  int? endTime;

  Discounts(
      {this.idDiscount,
        this.title,
        this.content,
        this.picture,
        this.discount,
        this.startTime,
        this.endTime});

  Discounts.fromJson(Map<String, dynamic> json) {
    idDiscount = json['idDiscount'];
    title = json['title'];
    content = json['content'];
    picture = json['picture'];
    discount = json['discount'];
    startTime = json['startTime'];
    endTime = json['endTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idDiscount'] = idDiscount;
    data['title'] = title;
    data['content'] = content;
    data['picture'] = picture;
    data['discount'] = discount;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    return data;
  }
}