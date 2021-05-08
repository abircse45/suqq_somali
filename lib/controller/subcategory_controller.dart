// import 'package:get/get.dart';
// import 'package:suuq_somali/create_listing/categories_list_model.dart';
// import 'package:suuq_somali/models/all_category_list.dart';
// import 'package:suuq_somali/services/all_category_service.dart';
//
// class SubCategoryController extends GetxController {
//   var getallCategory = AllCategoryList().obs;
//   var allCategoryLoading = true.obs;
//   ALLCategoryService service = ALLCategoryService();
//   var cat = Child();
//
//   SubCategoryController(this.cat);
//
//   @override
//   void onInit() {
//     super.onInit();
//     getCategoryDetails(cat.catSlug);
//   }
//
//
//   void getCategoryDetails(String slug) async {
//     try {
//       allCategoryLoading(true);
//       var allCategoryListSata = await service.fetchCatDetailsData(slug);
//       if (allCategoryListSata != null) {
//         getallCategory.value = allCategoryListSata;
//
//
//       }
//     } finally {
//       allCategoryLoading(false);
//     }
//   }
// }
