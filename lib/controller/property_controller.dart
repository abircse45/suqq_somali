import 'package:get/get.dart';
import 'package:suuq_somali/models/property_model.dart';
import 'package:suuq_somali/services/property_services.dart';

class PropertyController extends GetxController {
  var getProperty = NewProperty().obs;
  var loading = true.obs;
  PropertyService service = PropertyService();
  List<String> propertyList = [];
  List<String> roomList = [];
  List<String> bathRooms = [];
  List<String> carSpace = [];

  String pBeds1;

  @override
  void onInit() {
    super.onInit();
    getDataCalling();
  }

  void getDataCalling() async {
    try {
      loading(true);
      var result = await service.fetchData();
      if (result != null) {
        getProperty.value = result;
        // select Property ....DropDown........
        getProperty.value.customFields.forEach((k, v) {
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
        // Select RoomList....////
        getProperty.value.customFields.forEach((k, v) {
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
        getProperty.value.customFields.forEach((k, v) {
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

        getProperty.value.customFields.forEach((k, v) {
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

        /// Custom Field..........

      }
    } finally {
      loading(false);
    }
  }
}
