class PuchasedProductsResponse {
  bool? resp;
  String? msj;
  List<OrderBuy>? orderBuy;

  PuchasedProductsResponse({this.resp, this.msj, this.orderBuy});

  PuchasedProductsResponse.fromJson(Map<String, dynamic> json) {
    resp = json['resp'];
    msj = json['msj'];
    if (json['orderBuy'] != null) {
      orderBuy = <OrderBuy>[];
      json['orderBuy'].forEach((v) {
        orderBuy!.add(OrderBuy.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resp'] = resp;
    data['msj'] = msj;
    if (orderBuy != null) {
      data['orderBuy'] = orderBuy!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderBuy {
  int? uidOrderBuy;
  String? userId;
  int? status;
  String? datee;
  int? amount;
  String? address;
  String? note;
  String? payment;

  OrderBuy(
      {this.uidOrderBuy,
        this.userId,
        this.status,
        this.datee,
        this.amount,
        this.address,
        this.note,
        this.payment});

  OrderBuy.fromJson(Map<String, dynamic> json) {
    uidOrderBuy = json['uidOrderBuy'];
    userId = json['user_id'];
    status = json['status'];
    datee = json['datee'];
    amount = json['amount'];
    address = json['address'];
    note = json['note'];
    payment = json['payment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uidOrderBuy'] = uidOrderBuy;
    data['user_id'] = userId;
    data['status'] = status;
    data['datee'] = datee;
    data['amount'] = amount;
    data['address'] = address;
    data['note'] = note;
    data['payment'] = payment;
    return data;
  }
}