import 'package:get/get.dart';
import 'package:suuq_somali/models/all_ads_model.dart';
import 'package:suuq_somali/models/all_category_list.dart';
import 'package:suuq_somali/models/anything_model.dart';

import 'package:suuq_somali/services/all_category_service.dart';


class AllCategoryController extends GetxController {
  var getallCategory = AllCategoryList().obs;
  var allCategoryLoading = true.obs;
  ALLCategoryService service = ALLCategoryService();
  var cat = Cat();
  var stateValue = StateValue();
  // int from;
  // var stateValue = StateValue();
  //
  AllCategoryController(this.cat,this.stateValue);
  @override
  void onInit() {
    super.onInit();
    getCategoryDetails();
  }


  void getCategoryDetails() async {
    try {
      allCategoryLoading(true);

      var allCategoryListSata = await service.fetchCatDetailsData(cat,stateValue);
      if (allCategoryListSata != null) {
        getallCategory.value = allCategoryListSata;


      }
    } finally {
      allCategoryLoading(false);
    }
  }
}
