import 'package:get/get.dart';
import 'package:suuq_somali/create_listing/categories_list_model.dart';
import 'category_list_services.dart';
import 'create_list_foreach_services.dart';
import 'create_listing_foreach_model.dart';

class CreateListForEachController extends GetxController {
  var ccccc =CreateListForEach ().obs;
  var cl = true.obs;
  CreateListForEachServices categoryListServices = CreateListForEachServices();
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
      cl(true);
      var allAdsServices = await categoryListServices.fetchData();
      if (allAdsServices != null) {
        ccccc.value = allAdsServices;
        ccccc.value.customFields.forEach((k, v) {
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

        ccccc.value.customFields.forEach((k, v) {
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
        ccccc.value.customFields.forEach((k, v) {
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

        ccccc.value.customFields.forEach((k, v) {
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
        ccccc.value.customFields.forEach((k, v) {
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
      cl(false);
    }
  }
}
