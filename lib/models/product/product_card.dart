class ProductCart {
  int? uidProduct;
  String? image;
  String? name;
  int? quantity;
  int? price;
  int? importPrice;

  ProductCart({
    required this.uidProduct,
    required this.image,
    required this.name,
    required this.quantity,
    required this.price,
    required this.importPrice,
  });

  Map<String, dynamic> toJson() {
    return {'uidProduct': uidProduct, 'price': price, 'quantity': quantity};
  }

  ProductCart.fromMap(Map<String, dynamic> cart){
    uidProduct = cart['uidProduct'];
    image = cart['image'];
    name = cart['name'];
    quantity = cart['quantity'];
    price = cart['price'];
    importPrice = cart['importPrice'];
  }
}
