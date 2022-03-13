class PuchasedProductsResponse {
  bool? resp;
  String? msg;
  List<OrderBuy>? orderBuy;
  List<OrderDetails>? orderDetails;

  PuchasedProductsResponse(
      {this.resp, this.msg, this.orderBuy, this.orderDetails});

  PuchasedProductsResponse.fromJson(Map<String, dynamic> json) {
    resp = json['resp'];
    msg = json['msg'];
    if (json['orderBuy'] != null) {
      orderBuy = <OrderBuy>[];
      json['orderBuy'].forEach((v) {
        orderBuy!.add(OrderBuy.fromJson(v));
      });
    }
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
    data['msg'] = msg;
    if (orderBuy != null) {
      data['orderBuy'] = orderBuy!.map((v) => v.toJson()).toList();
    }
    if (orderDetails != null) {
      data['orderDetails'] = orderDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderBuy {
  int? uidOrderBuy;
  int? status;
  String? datee;
  int? amount;

  OrderBuy({this.uidOrderBuy, this.status, this.datee, this.amount});

  OrderBuy.fromJson(Map<String, dynamic> json) {
    uidOrderBuy = json['uidOrderBuy'];
    status = json['status'];
    datee = json['datee'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uidOrderBuy'] = uidOrderBuy;
    data['status'] = status;
    data['datee'] = datee;
    data['amount'] = amount;
    return data;
  }
}

class OrderDetails {
  int? uidOrderDetails;
  int? productId;
  String? nameProduct;
  List<String>? picture;
  int? quantity;
  int? price;

  OrderDetails(
      {this.uidOrderDetails,
      this.productId,
      this.nameProduct,
      this.picture,
      this.quantity,
      this.price});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    uidOrderDetails = json['uidOrderDetails'];
    productId = json['product_id'];
    nameProduct = json['nameProduct'];
    picture = json['picture'].cast<String>();
    quantity = json['quantity'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uidOrderDetails'] = uidOrderDetails;
    data['product_id'] = productId;
    data['nameProduct'] = nameProduct;
    data['picture'] = picture;
    data['quantity'] = quantity;
    data['price'] = price;
    return data;
  }
}
