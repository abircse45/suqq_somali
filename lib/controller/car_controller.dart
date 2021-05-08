import 'package:get/get.dart';
import 'package:suuq_somali/models/car_model.dart';
import 'package:suuq_somali/services/car_services.dart';

class CarController extends GetxController {
  var getCar = Car().obs;
  var carLoading = true.obs;
  CarService service = CarService();
  List<String> carBrandList=[];
  List<String> carColorList=[];
  List<String> transmissionList=[];

  @override
  void onInit() {
    super.onInit();
    getDataCalling();
  }

  void getDataCalling() async {
    try {
      carLoading(true);
      var carResult = await service.fetchData();
      if (carResult != null) {
        getCar.value = carResult;

        // selectedCarBrand.......
        getCar.value.customFields.forEach((k, v) {
          print(k);
          print(v.fieldName);
          if (v.fieldName == "Type of car") {
            carBrandList.clear();
            v.valuesList.forEach((element) {
              carBrandList.add(element);
              print("element name: " + element);
            });
          }
        });
      /// color List...
        getCar.value.customFields.forEach((k, v) {
          print(k);
          print(v.fieldName);
          if (v.fieldName == "Color") {
            carColorList.clear();
            v.valuesList.forEach((element) {
              carColorList.add(element);
              print("element name: " + element);
            });
          }
        });

        /// Car Transmission...
        getCar.value.customFields.forEach((k, v) {
          print(k);
          print(v.fieldName);
          if (v.fieldName == "Transmission") {
            transmissionList.clear();
            v.valuesList.forEach((element) {
              transmissionList.add(element);
              print("element name: " + element);
            });
          }
        });

      }
    } finally {
      carLoading(false);
    }
  }
}
