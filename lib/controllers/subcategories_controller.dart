import 'dart:developer';
import 'package:ecommerce_app/models/subcategory/saubcategories.dart';
import 'package:ecommerce_app/services/subcategories_service.dart';
import 'package:get/get.dart';

class SubCategoriesController extends GetxController {
  var isloading = true.obs;
  var subcategories = <Subcategories>[].obs;
  var allSubcategories = <Subcategories>[].obs;
  var search = <Subcategories>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchAllSubcategories();
  }

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

  void fetchAllSubcategories() async {
    var listSubcategory = await SubcategoriesService.getAllCategories();

    if(listSubcategory != null){
      allSubcategories.value = listSubcategory;
    }else{
      allSubcategories.value = [];
    }
  }

  void searching(String searchString){
    if(searchString != ''){
      search.value = allSubcategories
          .where((subcategory) =>
          '${subcategory.name}'
              .toLowerCase()
              .contains(searchString.toLowerCase())
      ).toList();
    }else{
      search.value = allSubcategories;
    }
  }

  void searchList(){
    search.value = allSubcategories;
  }

  void clearSearch(){
    search.value = [];
  }
}
