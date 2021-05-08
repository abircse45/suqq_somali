import 'package:get/get.dart';
import 'package:suuq_somali/create_listing/categories_list_model.dart';
import 'package:suuq_somali/models/all_category_list.dart';

import 'all_category_screen_services.dart';


class AllCategoryScreenController extends GetxController {
  var getallCategory = AllCategoryList().obs;
  var allCategoryLoading = true.obs;
  ALLCategoryScreenService service = ALLCategoryScreenService();
  var categor = Categor();
  var ch = Child();

  AllCategoryScreenController(this.categor,this.ch);

  @override
  void onInit() {
    super.onInit();
   getCategoryDetails(categor.catSlug);
  }


  void getCategoryDetails(String slug) async {
    try {
      allCategoryLoading(true);
      //Cat cat = Cat(catId: categor.catId,catIcon: "",catName: categor.catName,catSlug: categor.catSlug,catImg: "",catOrder: "",catPlural: "");
      var allCategoryListSata = await service.fetchCatDetailsData(slug);
      if (allCategoryListSata != null) {
        getallCategory.value = allCategoryListSata;


      }
    } finally {
      allCategoryLoading(false);
    }
  }
}
