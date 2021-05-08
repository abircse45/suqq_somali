import 'package:get/get.dart';
import 'package:suuq_somali/create_listing/categories_list_model.dart';
import 'category_list_services.dart';

class CategoryListController extends GetxController {
  var getCategoryListing = CategoryListing().obs;
  var categoryLoading = true.obs;
  CategoryListServices categoryListServices = CategoryListServices();
  List<String> propertyList = [];
  List<String> roomList = [];
  List<String> bathRooms = [];
  List<String> carSpace = [];
  List<String> buildYear = [];

  @override
  void onInit() {
    super.onInit();
    getDataCalling();
  }

  void getDataCalling() async {
    try {
      categoryLoading(true);
      var allAdsServices = await categoryListServices.fetchData();
      if (allAdsServices != null) {
        getCategoryListing.value = allAdsServices;
        getCategoryListing.value.customFields.forEach((k, v) {
          print(k);
          print(v.fieldName);
          if (v.fieldName == "Property Type") {
            propertyList.clear();
            v.valuesList.forEach((element) {
              propertyList.add(element);
              print("element name: " + element);
            });
          }
        });

        getCategoryListing.value.customFields.forEach((k, v) {
          print(k);
          print(v.fieldName);
          if (v.fieldName == "Rooms") {
            roomList.clear();
            v.valuesList.forEach((element) {
              roomList.add(element);
              print("element name: " + element);
            });
          }
        });
        //  Selected BathRooms....//////
        getCategoryListing.value.customFields.forEach((k, v) {
          print(k);
          print(v.fieldName);
          if (v.fieldName == "Bathrooms") {
            bathRooms.clear();
            v.valuesList.forEach((element) {
              bathRooms.add(element);
              print("element name: " + element);
            });
          }
        });

        //selectedCarSpace.....////

        getCategoryListing.value.customFields.forEach((k, v) {
          print(k);
          print(v.fieldName);
          if (v.fieldName == "Car Space") {
            carSpace.clear();
            v.valuesList.forEach((element) {
              carSpace.add(element);
              print("element name: " + element);
            });
          }
        });

        //  selecyted Build Year
        getCategoryListing.value.customFields.forEach((k, v) {
          print(k);
          print(v.fieldName);
          if (v.fieldName == "Build Year") {
            buildYear.clear();
            v.valuesList.forEach((element) {
              buildYear.add(element);
              print("element name: " + element);
            });
          }
        });
      }
    } finally {
      categoryLoading(false);
    }
  }
}
