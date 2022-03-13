import 'package:ecommerce_app/models/home/product_%20home.dart';

class Cart {
  final Products products;
  final int numOfItem;

  Cart({required this.products, required this.numOfItem});
}

// Demo data for our cart

// List<Cart> demoCarts = [
//   Cart(product: demoProducts[0], numOfItem: 2),
//   Cart(product: demoProducts[1], numOfItem: 1),
//   Cart(product: demoProducts[3], numOfItem: 1),
// ];
