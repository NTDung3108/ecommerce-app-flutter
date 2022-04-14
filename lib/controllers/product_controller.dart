import 'dart:developer';

import 'package:ecommerce_app/models/brands_response.dart';
import 'package:ecommerce_app/models/price_range_model.dart';
import 'package:ecommerce_app/models/product/order_detail.dart';
import 'package:ecommerce_app/models/product/product_card.dart';
import 'package:ecommerce_app/models/product/puchased_products_response.dart';
import 'package:ecommerce_app/services/auth_services.dart';
import 'package:ecommerce_app/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../models/home/product_ home.dart';

class ProductController extends GetxController {
  var isloading = true.obs;
  var searchFill = false.obs;

  var products = <Products>[];
  var brands = <Brands>[].obs;

  var allProducts = <Products>[];
  var searchProduct = <Products>[].obs;
  var fillterList = <Products>[];
  var rangeProduct = <Products>[];

  var tags = <String>[].obs;
  var filters = ['Hãng', 'Hàng mới', 'Bán chạy', 'Khoảng giá', 'Giá ↑'];
  var lastRange = '';

  var productCarts = <ProductCart>[].obs;

  /////////////////////////////////////////////////////////////////////////////

  var orders = <OrderBuy>[].obs;
  var orderDetails = <OrderDetails>[].obs;
  var isStatus = 0.obs;

  int get totalPrice =>
      productCarts.fold(0, (sum, item) => sum + (item.amount * item.price));

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchAllProduct();
    getOrderBuy();
  }

  void fetchProducts(int? id) async {
    try {
      isloading(true);

      var productList = await ProductService.getProductsForCategories(id: id);

      if (productList != null) {
        products = productList;
        searchProduct.value = productList;
      }
    } finally {
      isloading(false);
    }
  }

  void addProductToCart(ProductCart productCard, BuildContext context) async {
    final hasProduct = productCarts.contains(productCard);
    var value = await AuthServices().hasToken();
    if (value) {
      if (!hasProduct) {
        productCarts.add(productCard);
        const snackBar = SnackBar(
          content: Text('The product has been added to cart'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } else {
      const snackBar = SnackBar(
        content: Text('You need to login to use this function'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void saveOrderBuyProduct(
      String address, String note, String payment, BuildContext context) async {
    try {
      var resp = await ProductService.saveOrderBuyProduct(
          status: '0',
          date: DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now()),
          amount: '$totalPrice',
          address: address,
          note: note,
          payment: payment,
          products: productCarts);

      if (resp.resp!) {
        log(resp.msj!);
        productCarts.value = [];
        const snackBar = SnackBar(
          content: Text('The product has been order'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.pop(context);
      } else {
        log(resp.msj!);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void checkAndUpdateProducts(
      String address, String note, String payment, BuildContext context) async {
    try {
      var resp =
          await ProductService.updateQuantityProduct(products: productCarts);
      if (resp.resp!) {
        log(resp.msj!);
        saveOrderBuyProduct(address, note, payment, context);
      } else {
        log(resp.msj!);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void deleteProductToCart(int index) {
    productCarts.removeAt(index);
    productCarts.refresh();
  }

  void plusQuatityProduct(int index) {
    if (productCarts[index].quantity > productCarts[index].amount) {
      productCarts[index].amount++;
      productCarts.refresh();
    }
  }

  void suntractQuantityProduct(int index) {
    if (productCarts[index].amount > 1) {
      productCarts[index].amount--;
      productCarts.refresh();
    }
  }

  void getOrderBuy() async {
    var value = await AuthServices().hasToken();
    if (value) {
      var resp = await ProductService.getPuchasedProducts();
      if (resp.resp!) {
        log(resp.msj!);
        orders.value = resp.orderBuy!;
      } else {
        log(resp.msj!);
      }
    } else {
      log('You need to login to use this function');
    }
  }

  void getOrderDetails(String id) async {
    var resp = await ProductService.getOrderDetail(id: id);

    if (resp.resp!) {
      log(resp.msj!);
      orderDetails.value = resp.orderDetails!;
    } else {
      log(resp.msj!);
    }
  }

  void updateOrderStatus(
      {required int status,
      required int orderId,
      required int index,
      required String reason}) async {
    var resp = await ProductService.updateOrderStatus(
        status: status, orderId: orderId, reason: reason);

    if (resp.resp!) {
      log(resp.msj!);
      orders[index].status = status;
      isStatus.value = status;
    } else {
      log(resp.msj!);
    }
  }

  void fetchAllProduct() async {
    var listProduct = await ProductService.getAllProduct();

    if (listProduct != null) allProducts = listProduct;
  }

  //////////////////////////////////////////////////////////////////////////////

  void addTag(String tag) {
    bool b = false;
    if (tags.isEmpty) {
      tags.add(tag);
    } else {
      for (int i = 0; i < tags.length; i++) {
        if (tags[i] == tag) {
          b = true;
          break;
        } else {
          b = false;
        }
      }
      if (!b) {
        tags.add(tag);
      }
    }
    searchFill(true);
  }

  void deleteTag(String tag) {
    tags.remove(tag);
    if (tag == 'Hàng mới' ||
        tag == 'Bán chạy' ||
        tag == 'Giá ↓' ||
        tag == 'Giá ↑') {
      searchProduct.sort((item1, item2) => item1.idProduct! - item2.idProduct!);
    } else {
      brands.forEach((item) {
        if (item.brand == tag) {
          item.isChecked = false;
        }
      });
      priceRange.forEach((item) {
        if (item.range == tag) {
          item.isChecked = false;
        }
      });

      if(fillterList.isNotEmpty)
        searchProduct.value = fillterList;
      else searchProduct.value = products;
    }

    if (tags.isEmpty) {
      searchProduct.value = products;
      // fillterList.clear();
    }
  }

  void fetchBrands(int? id) async {
    try {
      var resp = await ProductService.getBrandsForSubcategory(id: id);

      brands.value = resp!;
    } catch (e) {
      rethrow;
    }
  }

  void checkPirce(bool b) {
    if (b) {}
  }

  void searchingProduct(String searchString, List<Products> list) {
    if (searchString != '') {
      searchProduct.value = list
          .where((product) => '${product.nameProduct}'
              .toLowerCase()
              .contains(searchString.toLowerCase()))
          .toList();
    } else {
      searchProduct.value = list;
    }
  }

  void fillterBrand(int? id) {
    searchProduct.value = [];
    for (int i = 0; i < products.length; i++) {
      if (products[i].brandsId == id) {
        fillterList.add(products[i]);
      }
    }
    searchProduct.value = fillterList.toSet().toList();
  }

  void removeFillterBrand(String? brand) {
    searchProduct.removeWhere((item) => item.brand == brand);
    fillterList.removeWhere((item) => item.brand == brand);
    if (tags.isEmpty) {
      searchProduct.value = products;
    }
  }

  void searching(String searchString) {
    if(rangeProduct.isEmpty){
      if (fillterList.isNotEmpty) {
        if (searchString != '') {
          searchProduct.value = fillterList
              .where(
                (item) => '${item.nameProduct}'
                .toLowerCase()
                .contains(searchString.toLowerCase()),
          )
              .toList();
        } else {
          searchProduct.value = fillterList.toSet().toList();
        }
      } else {
        if (searchString != '') {
          searchProduct.value = products
              .where(
                (item) => '${item.nameProduct}'
                .toLowerCase()
                .contains(searchString.toLowerCase()),
          )
              .toList();
        } else {
          searchProduct.value = products;
        }
      }
    }else{
      if (searchString != '') {
        searchProduct.value = rangeProduct
            .where(
              (item) => '${item.nameProduct}'
              .toLowerCase()
              .contains(searchString.toLowerCase()),
        )
            .toList();
      } else {
        searchProduct.value = rangeProduct.toSet().toList();
      }
    }
  }

  void fillterNewProduct() {
    searchProduct.sort((item1, item2) => item2.addDay! - item1.addDay!);
    //products.sort((item1, item2) => item2.addDay! - item1.addDay!);
  }

  void removeFillNewProduct() {
    searchProduct.sort((item1, item2) => item1.idProduct! - item2.idProduct!);
  }

  void fillterSale() {
    searchProduct.sort((item1, item2) => item2.sold! - item1.sold!);
  }

  void fillterPrice(String s) {
    if (s == 'Giá ↓') {
      searchProduct.sort((item1, item2) => item2.price! - item1.price!);
    } else if (s == 'Giá ↑') {
      searchProduct.sort((item1, item2) => item1.price! - item2.price!);
    }
  }

  void fillterRange(String s) {
    if (fillterList.isEmpty) {
      if (s == 'Dưới 1tr') {
        rangeProduct.clear();
        searchProduct.value =
            products.where((item) => item.price! < 1000000).toList();
        rangeProduct.addAll(searchProduct);
        //fillterList.addAll(products.where((item) => item.price! < 1000000).toList());
      } else if (s == 'Từ 1tr-5tr') {
        searchProduct.value = products
            .where((item) => item.price! < 5000000 && item.price! > 1000000)
            .toList();
      } else if (s == 'Từ 5tr-10tr') {
        searchProduct.value = products
            .where((item) => item.price! < 10000000 && item.price! > 5000000)
            .toList();
      } else if (s == 'Từ 10tr-15tr') {
        searchProduct.value = products
            .where((item) => item.price! < 15000000 && item.price! > 10000000)
            .toList();
      } else if (s == 'Từ 15tr-20tr') {
        searchProduct.value = products
            .where((item) => item.price! < 20000000 && item.price! > 15000000)
            .toList();
      } else if (s == 'Trên 20tr') {
        searchProduct.value =
            products.where((item) => item.price! > 20000000).toList();
      }
    } else {
      if (s == 'Dưới 1tr') {
        rangeProduct.clear();
        searchProduct.value =
            fillterList.where((item) => item.price! < 1000000).toList();
        rangeProduct.addAll(searchProduct);
      } else if (s == 'Từ 1tr-5tr') {
        searchProduct.value = fillterList
            .where((item) => item.price! < 5000000 && item.price! > 1000000)
            .toList();
      } else if (s == 'Từ 5tr-10tr') {
        searchProduct.value = fillterList
            .where((item) => item.price! < 10000000 && item.price! > 5000000)
            .toList();
      } else if (s == 'Từ 10tr-15tr') {
        searchProduct.value = fillterList
            .where((item) => item.price! < 15000000 && item.price! > 10000000)
            .toList();
      } else if (s == 'Từ 15tr-20tr') {
        searchProduct.value = fillterList
            .where((item) => item.price! < 20000000 && item.price! > 15000000)
            .toList();
      } else if (s == 'Trên 20tr') {
        searchProduct.value =
            fillterList.where((item) => item.price! > 20000000).toList();
      }
    }
  }
}
