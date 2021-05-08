import 'package:get/get.dart';
import 'package:suuq_somali/models/anything_model.dart';

import 'package:suuq_somali/services/anything_services.dart';

class AnyThingController extends GetxController {
  var getAnything = Anything().obs;
  var anyLoading = true.obs;
  List<String> selectCategory = [];
  AnyThingService service = AnyThingService();
  List<Cat> finalList = [];
  @override
  void onInit() {
    super.onInit();
    getDataCalling();
  }

  void getDataCalling() async {
    try {
      anyLoading(true);
      var anyResult = await service.fetchData();
      if (anyResult != null) {
        getAnything.value = anyResult;
        var list = anyResult.cats;
        var cat = Cat(
            catId: "001",
            catName: "Property",
            catSlug: "",
            catPlural: "",
            catOrder: "",
            catImg: "",
            catIcon: "");
        var cat2 = Cat(
            catId: "002",
            catName: "Car",
            catSlug: "",
            catPlural: "",
            catOrder: "",
            catImg: "",
            catIcon: "");
        finalList.clear();
        finalList.add(cat);
        finalList.add(cat2);
        finalList.addAll(list);
      }
    } finally {
      anyLoading(false);
    }
  }
}
