import 'package:get/get.dart';
import 'package:suuq_somali/models/search_model.dart';
import 'package:suuq_somali/services/filter_search_services_property.dart';

class SearchController extends GetxController {
  var getSearch = FilterPropertySearch().obs;
  var searchLoading = true.obs;
  SearchService searchService = SearchService();

  @override
  void onInit() {
    super.onInit();
  }
  @override
  void onClose() {
    super.onClose();
  }

  void getSaerchDataCalling(
    String rent,
    String city,
    String area,
    String slectedPropertType,
    String carSpace,
    String bathrooms,
    String rooms,
  ) async {
    try {
      searchLoading(true);
      var searchServices = await searchService.fetchFilterSearchData(
          rent, city, area, slectedPropertType, carSpace, bathrooms, rooms);
      if (searchServices != null) {
        getSearch.value = searchServices;
        update();
      }
    } finally {
      searchLoading(false);
    }
  }
}
