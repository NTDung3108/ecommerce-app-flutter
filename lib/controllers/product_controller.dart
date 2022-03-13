import 'dart:developer';

import 'package:ecommerce_app/models/brands_response.dart';
import 'package:ecommerce_app/models/home/product_%20home.dart';
import 'package:ecommerce_app/models/product_card.dart';
import 'package:ecommerce_app/services/product_service.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProductController extends GetxController {
  var isloading = true.obs;
  var products = <Products>[].obs;
  var brands = <Brands>[].obs;

  var tags = <String>[].obs;

  var productCarts = <ProductCart>[].obs;
  double get totalPrice =>
      productCarts.fold(0, (sum, item) => sum + (item.amount * item.price));

  void fetchProducts(int? id) async {
    try {
      isloading(true);

      var productList = await ProductService.getProductsForCategories(id: id);

      if (productList != null) {
        products.value = productList;
      }
    } finally {
      isloading(false);
    }
  }

  void addProductToCart(ProductCart productCard) {
    final hasProduct = productCarts.contains(productCard);

    if (!hasProduct) {
      productCarts.add(productCard);
    }
  }

  void deleteProductToCart(int index) {
    productCarts.removeAt(index);
  }

  void plusQuatityProduct(int index) {
    productCarts[index].amount++;
  }

  void suntractQuantityProduct(int index) {
    productCarts[index].amount--;
  }

  void clearProductCart() {
    products.clear();
  }

  void addTag(String tag){
    tags.add(tag);
  }

  void deleteTag(String tag){
    tags.remove(tag);
  }

  void saveOrderBuyProduct(String address) async {
    try {
      var resp = await ProductService.saveOrderBuyProduct(
          status: '0',
          date: DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now()),
          amount: '$totalPrice',
          address: address,
          products: productCarts);

      if (resp.resp!) {
        log(resp.msj!);
      } else {
        log(resp.msj!);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void fetchBrands(int? id) async {
      var brandList = await ProductService.getBrandsForSubcategory(id: id);
      if (brandList != null) {
        brands.value = brandList;
      }
  }
}
