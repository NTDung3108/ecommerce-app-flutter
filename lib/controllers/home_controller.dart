import 'dart:developer';

import 'package:ecommerce_app/models/category.dart';
import 'package:ecommerce_app/models/home/discount_home.dart';
import 'package:ecommerce_app/models/home/product_%20home.dart';
import 'package:ecommerce_app/models/subcategory/saubcategories.dart';
import 'package:ecommerce_app/services/home_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var loading = true.obs;
  var loadDiscounts = true.obs;
  var loadSubCategory = true.obs;

  var homeProducts = <Products>[].obs;
  var categoriesHome = <Category>[].obs;
  var discountsHome = <Discounts>[].obs;
  var subcategoriesHome = <Subcategories>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProductHome();
    fetchCategoriesHome();
    fetchDiscountsHome();
    fetchSubCategoryHome();
  }

  void fetchProductHome() async {
    try {
      isLoading(true);

      var homProductList = await HomeService.getHomeProduct();

      if (homProductList != null) {
        homeProducts.value = homProductList;

        log(homeProducts.toString());
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchCategoriesHome() async {
    try {
      loading(true);

      var categoryList = await HomeService.getCategoriesHome();
      categoryList!.add(Category(id: -1, category: 'more', picture: '', status: 1));

      if (categoryList != null) {
        categoriesHome.value = categoryList;

        log(categoriesHome.toString());
      }
    } finally {
      loading(false);
    }
  }

  void fetchDiscountsHome() async{
    try{
      loadDiscounts(true);

      var discountList = await HomeService.getDiscountBanner();

      if(discountList != null){
        discountsHome.value = discountList;

        log(discountsHome.toString());
      }
    }finally{
      loading(true);
    }
  }

  void fetchSubCategoryHome() async {
    try{
      loadSubCategory(true);

      var listSubCategory = await HomeService.listSubCategoryHome();

      if(listSubCategory != null){
        subcategoriesHome.value = listSubCategory;

        log(subcategoriesHome.toString());
      }
    }finally{
      loadSubCategory(true);
    }
  }

}
