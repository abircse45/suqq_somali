import 'package:get/get.dart';
import 'package:suuq_somali/models/anything_model.dart';


import 'bottom_serch_services.dart';

class BottomCategoryController extends GetxController {
  var getAnything = Anything().obs;
  var anyLoading = true.obs;
  List<String> selectCategory = [];
  BottomSearchServices service = BottomSearchServices();

  @override
  void onInit() {
    super.onInit();
    getDataCalling();
  }

  void getDataCalling() async {
    try {
      anyLoading(true);
      var anyResult = await service.fetchBottomSearch();
      if (anyResult != null) {
        getAnything.value = anyResult;
        anyResult.cats;


      }
    } finally {
      anyLoading(false);
    }
  }
}
