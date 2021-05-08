import 'package:get/get.dart';
import 'package:suuq_somali/All_Search/All_search_controller.dart';
import 'package:suuq_somali/Bottom_search/bottom_search_controller.dart';
import 'package:suuq_somali/car/car_search_controller.dart';
import 'package:suuq_somali/controller/all_ads_controller.dart';
import 'package:suuq_somali/controller/anything_controller.dart';
import 'package:suuq_somali/controller/car_controller.dart';
import 'package:suuq_somali/controller/property_controller.dart';
import 'package:suuq_somali/controller/filter_search_controller_property.dart';
import 'package:suuq_somali/create_listing/category_list_controller.dart';

class AllControllerBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PropertyController>(() => PropertyController());
    Get.lazyPut<CarController>(() => CarController());
    Get.lazyPut<AnyThingController>(() => AnyThingController());
    Get.lazyPut<AllAdsController>(() => AllAdsController());
    //Get.lazyPut<AllCategoryController>(() =>AllCategoryController(c));
    Get.lazyPut<SearchController>(() => SearchController());
    Get.lazyPut<CarSearchController>(() => CarSearchController());
    Get.lazyPut<CategoryListController>(() => CategoryListController());
 //   Get.lazyPut<AllSearchController>(() => AllSearchController());
 //   Get.lazyPut<AllCategoryScreenController>(() => AllCategoryScreenController());
    Get.lazyPut<ChangeAllSearchController>(() => ChangeAllSearchController());
    Get.lazyPut<BottomCategoryController>(() => BottomCategoryController());
  }
}
