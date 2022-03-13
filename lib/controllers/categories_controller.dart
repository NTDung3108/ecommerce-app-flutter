import 'package:ecommerce_app/models/category.dart';
import 'package:ecommerce_app/services/categories_service.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  var isloading = true.obs;
  var categories = <Category>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  void fetchCategories() async {
    try {
      isloading(true);

      var categoryList = await CategoriesService.getCategories();

      if (categoryList != null) {
        categories.value = categoryList;
      }else{
        categories.value = [];
      }
    } finally {
      isloading(false);
    }
  }
}
