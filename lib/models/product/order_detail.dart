class OrderDetail {
  bool? resp;
  String? msj;
  List<OrderDetails>? orderDetails;

  OrderDetail({this.resp, this.msj, this.orderDetails});

  OrderDetail.fromJson(Map<String, dynamic> json) {
    resp = json['resp'];
    msj = json['msj'];
    if (json['orderDetails'] != null) {
      orderDetails = <OrderDetails>[];
      json['orderDetails'].forEach((v) {
        orderDetails!.add(OrderDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resp'] = resp;
    data['msj'] = msj;
    if (orderDetails != null) {
      data['orderDetails'] = orderDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderDetails {
  int? uidOrderDetails;
  int? orderBuyId;
  int? idProduct;
  String? nameProduct;
  List<String>? picture;
  int? quantity;
  int? price;

  OrderDetails(
      {this.uidOrderDetails,
        this.orderBuyId,
        this.idProduct,
        this.nameProduct,
        this.picture,
        this.quantity,
        this.price});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    uidOrderDetails = json['uidOrderDetails'];
    orderBuyId = json['orderBuy_id'];
    idProduct = json['idProduct'];
    nameProduct = json['nameProduct'];
    picture = json['picture'].cast<String>();
    quantity = json['quantity'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uidOrderDetails'] = uidOrderDetails;
    data['orderBuy_id'] = orderBuyId;
    data['idProduct'] = idProduct;
    data['nameProduct'] = nameProduct;
    data['picture'] = picture;
    data['quantity'] = quantity;
    data['price'] = price;
    return data;
  }
}