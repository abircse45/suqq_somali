import 'package:get/get.dart';
import 'category_all_search_service.dart';
import 'category_search_model.dart';

class CategoryAllSearchController extends GetxController {
  var getAllSearch = CategorySearch().obs;
  var allSearchLoading = true.obs;

  CategoryAllSearchService categoryAllSearchService =
      CategoryAllSearchService();

  @override
  void onInit() {
    super.onInit();
    getDataCalling();
  }

  void getDataCalling() async {
    try {
      allSearchLoading(true);
      var allAdsServices = await categoryAllSearchService.fetchDataChange();
      if (allAdsServices != null) {
        getAllSearch.value = allAdsServices;

      }
    } finally {
      allSearchLoading(false);
    }
  }
}
