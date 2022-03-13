import 'dart:developer';
import 'package:ecommerce_app/models/subcategory/saubcategories.dart';
import 'package:ecommerce_app/services/subcategories_service.dart';
import 'package:get/get.dart';

class SubCategoriesController extends GetxController {
  var isloading = true.obs;
  var subcategories = <Subcategories>[].obs;

  void fetchCategories(int id) async {
    try {
      isloading(true);

      var subcategoryList = await SubcategoriesService.getCategories(id);
      log(subcategoryList.toString());

      if (subcategoryList != null) {
        subcategories.value = subcategoryList;

        log(subcategories.toString());
      }else{
        subcategories.value = [];
      }
    } finally {
      isloading(false);
    }
  }
}
