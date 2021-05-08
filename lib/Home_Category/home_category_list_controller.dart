import 'package:get/get.dart';
import 'package:suuq_somali/Home_Category/home_category_all_list_services.dart';

import 'package:suuq_somali/models/all_category_list.dart';
import 'package:suuq_somali/models/anything_model.dart';


class HomeCategoryListController extends GetxController {
  var homeAllcategory = AllCategoryList().obs;
  var homeLoading = true.obs;
  HomeCategoryListServices service = HomeCategoryListServices();
  var cat = Cat();
  // int from;
  // var stateValue = StateValue();
  //
  HomeCategoryListController(this.cat);
  @override
  void onInit() {
    super.onInit();
    getCategoryDetails();
  }


  void getCategoryDetails() async {
    try {
      homeLoading(true);

      var allCategoryListSata = await service.fetchCatDetailsData(cat);
      if (allCategoryListSata != null) {
        homeAllcategory.value = allCategoryListSata;


      }
    } finally {
      homeLoading(false);
    }
  }
}
