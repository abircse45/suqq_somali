import 'package:get/get.dart';
import 'package:suuq_somali/All_Search/all_search_model.dart';
import 'package:suuq_somali/All_Search/all_search_services.dart';


class ChangeAllSearchController extends GetxController {
  var getAllSearch = AllSearch().obs;
  var allSearchLoading = false.obs;

  ChangeAllSearchService allSearchService = ChangeAllSearchService();




  void getDataCalling(String text) async {
    try {
      allSearchLoading(false);
    //
      var allAdsServices = await allSearchService.fetchBottomSearch(text);
      if (allAdsServices != null) {
        getAllSearch.value = allAdsServices;
      }
    } finally {
      allSearchLoading (false);  //
    }
  }
}
