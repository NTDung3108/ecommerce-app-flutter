class ProductCart {
  final String uidProduct;
  final String image;
  final String name;
  final int quantity;
  final int price;
  int amount;

  ProductCart({
    required this.uidProduct,
    required this.image,
    required this.name,
    required this.quantity,
    required this.price,
    required this.amount,
  });

  Map<String, dynamic> toJson() {
    return {'uidProduct': uidProduct, 'price': price, 'amount': amount};
  }
}
