import 'package:get/get.dart';
import 'package:suuq_somali/models/search_model.dart';

import 'car_search_service.dart';

class CarSearchController extends GetxController {
  var getSearch = FilterPropertySearch().obs;
  var searchLoading = true.obs;
  CarSearchService carsearchService = CarSearchService();

  @override
  void onClose() {
    super.onClose();
  }



  void carGetSaerchDataCalling(
    String buy,
    String city,
    String area,
    String modelArea,
    String color,
    String transmission,
    String min,
    String max,
    String milage,
  ) async {
    try {
      searchLoading(true);
      var searchServices = await carsearchService.carFetchSearchData(
          buy, city, area, modelArea, color, transmission, min, max, milage);
      if (searchServices != null) {
        getSearch.value = searchServices;
        update();
      }
    } finally {
      searchLoading(false);
    }
  }
}
