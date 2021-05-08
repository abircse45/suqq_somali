
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:suuq_somali/create_listing/categories_list_model.dart';
import 'package:suuq_somali/create_listing/category_list_controller.dart';

import 'package:suuq_somali/utils/app_theme.dart';

import '../AllAds/all_add_screen.dart';
import 'category_details_screen.dart';

class SearchListCategory extends StatefulWidget {
  final Child child;

  const SearchListCategory({Key key, this.child}) : super(key: key);
  @override
  _SearchListCategoryState createState() => _SearchListCategoryState();
}

class _SearchListCategoryState extends State<SearchListCategory> {
  final categoryController = Get.put(CategoryListController());
  // Future<List<Child>> getChild() async {
  //   String url = "https://suuq.cwprojects.xyz/api/categories";
  //
  //   print("Url : $url");
  //   final response = await http.get(Uri.parse(url));
  //   try {
  //     if (response.statusCode == 200) {
  //       print("Response Popular Json Data :  ${response.body}");
  //       return Categor.fromJson(jsonDecode(response.body)).childs;
  //     } else {
  //       throw Exception();
  //     }
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  String searchS;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: HexColor("#dc3545"),
        leading: IconButton(
          icon: Icon(
            Icons.close,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text("Pick a Category"),
      ),
      body: ListView(
        shrinkWrap: true,
        primary:false,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: Color(0xFFE0E0E0),
              borderRadius: BorderRadius.all(Radius.circular(0)),
            ),
            child: TextField(
              onChanged: (value) {
                setState(
                  () {
                    searchS = value;
                  },
                );
              },
              cursorColor: Colors.grey,
              style: TextStyle(fontSize: 16.0, color: Colors.black),
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 25,
                  ),
                  border: InputBorder.none,
                  hintText: "Search for a category",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Divider(
              thickness: 1,
              height: 1,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 14,
          ),
          ListTile(
            onTap: () {
              Get.to(AllAddScreen(), transition: Transition.zoom);
            },
            title: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                "Go to all ads",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          SizedBox(
            height: 5,
          ),

          Obx(
            () {
              if (categoryController.categoryLoading.value) {
                return Center(
                  child: SpinKitChasingDots(
                    color: Colors.red,
                  ),
                );
              }
              return Padding(
                  padding: const EdgeInsets.only(left:12.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: categoryController
                        .getCategoryListing.value.categories.length,
                    itemBuilder: (_, index) {

                      var data = categoryController
                          .getCategoryListing.value.categories[index];
                      if(searchS==null || searchS==""){
                        return ListTile(
                          onTap: (){
                            Get.to(CategoryScreen(
                              cat: data,
                              title: data.catName,
                              ch:widget.child,
                            ),
                            );
                          },
                          title: Text(data.catName),
                        );
                      }else{
                        if(data.catName.toLowerCase().contains(searchS.toLowerCase())){
                          return ListTile(
                            onTap: (){
                              Get.to(CategoryScreen(
                                cat: data,
                                title: data.catName,
                                ch:widget.child,
                              ),
                              );
                            },
                            title: Text(data.catName),
                          );
                        }else{
                          return Container();
                        }
                      }

                    },
                  ),

              );
            },
          ),

// CATEGORIES....>>>> ITEM..>>>>
//           Obx(
//             () {
//               if (categoryController.categoryLoading.value) {
//                 return Center(
//                   child: SpinKitChasingDots(
//                     color: Colors.red,
//                     size: 35,
//                   ),
//                 );
//               }
//               return Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.only(left:12.0),
//                   child: ListView.builder(
//                     shrinkWrap: true,
//                     primary: false,
//                     itemCount: categoryController
//                         .getCategoryListing.value.categories.length,
//                     itemBuilder: (_, index) {
//                       var item = categoryController
//                           .getCategoryListing.value.categories[index];
//
//                       if(searchS==null||searchS==""){
//                         return item.childs == null
//                             ? ListTile(
//                           onTap: () {
//                             Get.to(CategoryScreen(
//                               cat: item,
//                             ),
//                             );
//                           },
//                           title: Text(item.catName),
//                         )
//                             : ExpansionTile(
//                           trailing: Icon(
//                             Icons.keyboard_arrow_down_rounded,
//                             color: Colors.white,
//                             size: 20,
//                           ),
//                           title: Text(item.catName),
//                           children: [
//                             Obx(
//                                   () {
//                                 if (categoryController
//                                     .categoryLoading.value) {
//                                   return Center(
//                                     child: CircularProgressIndicator(),
//                                   );
//                                 }
//                                 return ListView.builder(
//                                   shrinkWrap: true,
//                                   primary: false,
//                                   itemCount: item.childs.length,
//                                   itemBuilder: (_, index) {
//                                     var data = item.childs[index];
//                                     return ListTile(
//                                       onTap: () {
//                                         Get.to(SubCategoryScreen(
//                                           child: data,
//                                         ),
//                                         );
//                                       },
//                                       title: Padding(
//                                         padding:
//                                         const EdgeInsets.only(left: 8.0),
//                                         child: Text(
//                                           data.catName,
//                                           style: TextStyle(
//                                             fontSize: 16,
//                                           ),
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                 );
//                               },
//                             )
//                           ],
//                         );
//                       }else{
//                         if( categoryController
//                             .getCategoryListing.value.categories[index].catName.toLowerCase().contains(searchS.toLowerCase())){
//                           return item.childs == null
//                               ? ListTile(
//                             onTap: () {
//                               Get.to(CategoryScreen(
//                                 cat: item,
//                               ));
//                             },
//                             title: Text(item.catName),
//                           )
//                               : ExpansionTile(
//                             trailing: Icon(
//                               Icons.keyboard_arrow_down_rounded,
//                               color: Colors.white,
//                               size: 20,
//                             ),
//                             title: Text(item.catName),
//                             children: [
//                               Obx(
//                                     () {
//                                   if (categoryController
//                                       .categoryLoading.value) {
//                                     return Center(
//                                       child: CircularProgressIndicator(),
//                                     );
//                                   }
//                                   return ListView.builder(
//                                     shrinkWrap: true,
//                                     primary: false,
//                                     itemCount: item.childs.length,
//                                     itemBuilder: (_, index) {
//                                       var data = item.childs[index];
//                                       return ListTile(
//                                         onTap: () {
//                                           Get.to(SubCategoryScreen(
//                                             child: data,
//                                           ),
//                                           );
//                                         },
//                                         title: Padding(
//                                           padding:
//                                           const EdgeInsets.only(left: 8.0),
//                                           child: Text(
//                                             data.catName,
//                                             style: TextStyle(
//                                               fontSize: 16,
//                                             ),
//                                           ),
//                                         ),
//                                       );
//                                     },
//                                   );
//                                 },
//                               )
//                             ],
//                           );
//                         }
//                       return Container();
//                       }
//
//
//
//                     },
//                   ),
//                 ),
//               );
//             },
//           ),
        ],
      ),
    );
  }
}
// FutureBuilder<List<Child>>(
//   future: getChild(),
//   builder: (context,snapshot){
//     if(snapshot.hasData){
//       final list = snapshot.data;
//       return ListView.builder(
//         shrinkWrap: true,
//         primary: false,
//         itemCount: list.length,
//         itemBuilder: (_,index){
//           var data = list[index];
//           return ListTile(
//             title: Text(data.catName),
//           );
//         },
//       );
//     }else{
//       return Center(child: SpinKitChasingDots(color: Colors.red,size: 36,),);
//     }
//   },
// ),
// ListView.builder(
//   shrinkWrap: true,
//   primary: false,
//   itemCount: categoryController.getCategoryListing.value.categories.length,
//   itemBuilder: (_,index){
//    var subCategory = categoryController.getCategoryListing.value.categories[index];
//     return ListTile(
//       title: Text(subCategory.childs[index].catName),
//     );
//   },
// ),
// Expanded(
//   child:
//   FutureBuilder<List<Cat>>(
//       future: getBlogListJsonData(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//          final list = snapshot.data;
//
//
//             return ListView.builder(
//               shrinkWrap: true,
//               primary: false,
//               itemCount: list.length,
//               itemBuilder: (_, index) {
//                 final item = list[index];
//                 if(searchS==null||searchS==""){
//                   return
//                     Padding(
//                     padding: const EdgeInsets.only(left: 10.0),
//                     child: ExpansionTile(
//                       trailing: Icon(
//                         Icons.arrow_drop_down_outlined,
//                         color: Colors.white,
//                       ),
//                       title: Text(item.catName),
//                       leading: Image.network(
//                         item.catImg,
//                         cacheHeight: 35,
//                       ),
//                       children: [
//                         FutureBuilder<SubCategoryList>(
//                             future: categoryList(item.catSlug),
//                             builder: (context, snapshot) {
//                               if (snapshot.hasData) {
//                                 final list = snapshot.data.listItems;
//
//                                 return list.isNotEmpty
//                                     ? ListView.builder(
//                                   shrinkWrap: true,
//                                   primary: false,
//                                   itemCount: list.length,
//                                   itemBuilder: (_, index) {
//                                     final item = list[index];
//                                     return ListTile(
//                                       onTap: () {
//                                         Get.to(
//                                             CategoryDetails(
//                                               title:
//                                               item.listingTitle,
//                                               image:
//                                               item.mainPicUrl,
//                                               price:
//                                               item.listingPrice,
//                                               description:
//                                               item.shortDesc,
//                                             ),
//                                             transition:
//                                             Transition.zoom);
//                                       },
//                                       title:
//                                       Text(item.listingTitle),
//                                     );
//                                   },
//                                 )
//                                     : Text(
//                                   "No Data",
//                                   style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold),
//                                 );
//                               } else if (snapshot.hasError) {
//                                 return Center(
//                                   child: Text("${snapshot.error}"),
//                                 );
//                               }
//
//                               return Padding(
//                                 padding: const EdgeInsets.all(16.0),
//                                 child: Center(
//                                   child: CircularProgressIndicator(),
//                                 ),
//                               );
//                             }),
//                       ],
//                     ),
//                   );
//                 }else{
//                   if(list[index].catName.toLowerCase().contains(searchS.toLowerCase())){
//                     return Padding(
//                       padding: const EdgeInsets.only(left: 10.0),
//                       child: ExpansionTile(
//                         trailing: Icon(
//                           Icons.arrow_drop_down_outlined,
//                           color: Colors.white,
//                         ),
//                         title: Text(item.catName),
//                         leading: Image.network(
//                           item.catImg,
//                           cacheHeight: 35,
//                         ),
//                         children: [
//                           FutureBuilder<SubCategoryList>(
//                               future: categoryList(item.catSlug),
//                               builder: (context, snapshot) {
//                                 if (snapshot.hasData) {
//                                   final list = snapshot.data.listItems;
//
//                                   return list.isNotEmpty
//                                       ? ListView.builder(
//                                     shrinkWrap: true,
//                                     primary: false,
//                                     itemCount: list.length,
//                                     itemBuilder: (_, index) {
//                                       final item = list[index];
//                                       return ListTile(
//                                         onTap: () {
//                                           Get.to(
//                                               CategoryDetails(
//                                                 title:
//                                                 item.listingTitle,
//                                                 image:
//                                                 item.mainPicUrl,
//                                                 price:
//                                                 item.listingPrice,
//                                                 description:
//                                                 item.shortDesc,
//                                               ),
//                                               transition:
//                                               Transition.zoom);
//                                         },
//                                         title:
//                                         Text(item.listingTitle),
//                                       );
//                                     },
//                                   )
//                                       : Text(
//                                     "No Data",
//                                     style: TextStyle(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.bold),
//                                   );
//                                 } else if (snapshot.hasError) {
//                                   return Center(
//                                     child: Text("${snapshot.error}"),
//                                   );
//                                 }
//
//                                 return Padding(
//                                   padding: const EdgeInsets.all(16.0),
//                                   child: Center(
//                                     child: CircularProgressIndicator(),
//                                   ),
//                                 );
//                               }),
//                         ],
//                       ),
//                     );
//                   }else{
//                     return Container();
//                   }
//                 }
//
//
//               },
//             );
//
//
//
//         } else if (snapshot.hasError) {
//           return Center(
//             child: Text("${snapshot.error}"),
//           );
//         }
//
//         return Center(
//           child: SpinKitChasingDots(
//             color: Colors.red,
//             size: 40,
//           ),
//         );
//       }),
// ),
// FutureBuilder(
//                         //   future: categoryController.categoryListServices.fetchData(),
//                         //   builder: (context,snapshot){
//                         //     if(snapshot.hasData){
//                         //       var subData = snapshot.data;
//                         //       return
//                         //     }else{
//                         //       return Container();
//                         //     }
//                         //   },
//                         // ),
