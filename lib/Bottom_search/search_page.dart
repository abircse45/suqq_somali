import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/route_manager.dart';
import 'package:suuq_somali/Bottom_search/bottom_search_controller.dart';
import 'package:suuq_somali/Home_Category/anythings_list_details.dart';
import 'package:suuq_somali/models/all_ads_model.dart';

import 'package:suuq_somali/utils/app_theme.dart';
import 'package:get/get.dart';

import '../DrawerScreen.dart';
import 'bottom_all_search.dart';
import 'bottom_change_location.dart';

class SearchPage extends StatefulWidget {
  // final String cityName;
  //
  // const SearchPage({Key key, this.cityName}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  StateValue editableText;
  // Future<List<Cat>> getCategory() async {
  //   String url = "https://suuq.cwprojects.xyz/api/anything";
  //
  //   print("Url : $url");
  //   final response = await http.get(Uri.parse(url));
  //   try {
  //     if (response.statusCode == 200) {
  //       print("Response Popular Json Data :  ${response.body}");
  //       return Anything.fromJson(jsonDecode(response.body)).cats;
  //     } else {
  //       throw Exception();
  //     }
  //   } catch (e) {
  //     throw e;
  //   }
  // }
  bool isSearching = false;

  final searchController = TextEditingController();
  final bottomSearchCategory = Get.put(BottomCategoryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#ededed"),
      // appBar: AppBar(
      //   title: !isSearching
      //       ? Text("")
      //       : ClipRRect(
      //     borderRadius: BorderRadius.all(Radius.circular(5)),
      //     child: TextFormField(
      //       controller: _searchingController,
      //       onTap: () {
      //
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => Search()));
      //
      //
      //       },
      //       decoration: InputDecoration(
      //         fillColor: Colors.white,
      //         filled: true,
      //         border: InputBorder.none,
      //         hintText: "All Search",
      //       ),
      //     ),
      //   ),
      //   iconTheme: new IconThemeData(color: Colors.white),
      //   actions: [
      //     isSearching
      //         ? IconButton(
      //       icon: Icon(Icons.cancel),
      //       onPressed: () {
      //         setState(() {
      //           this.isSearching = false;
      //         });
      //       },
      //     )
      //         : IconButton(
      //       icon: Icon(Icons.search),
      //       onPressed: () {
      //         setState(() {
      //           this.isSearching = true;
      //         });
      //       },
      //     ),
      //     // Badge(
      //     //     child: IconButton(
      //     //         icon: Icon(Icons.shopping_cart),
      //     //         onPressed: () {
      //     //           Navigator.push(
      //     //               context,
      //     //               MaterialPageRoute(
      //     //                   builder: (context) => CartPage()));
      //     //         }),
      //     //     value: dataList.toString()),
      //   ],
      //   elevation: 0,
      //   backgroundColor: Colors.red,
      // ),
      appBar: AppBar(
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black54),
        backgroundColor: Colors.white,
        title: Image.asset(
          "assets/images/suuq_logo.png",
          height: 90,
          width: 170,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(
                Icons.notifications_outlined,
                size: 30,
              ),
              onPressed: () {}),
        ],
      ),
      drawer: MenuScreen(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(Search());
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Text(
                            "Search",
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child: Icon(Icons.search),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // InkWell(
            //   onTap: (){
            //     Get.to(Search());
            //   },
            //     child: Text(" Search"),),
            Padding(
              padding: EdgeInsets.only(
                top: 15,
                left: 15,
              ),
              child: Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.add_location_rounded,
                        color: Colors.red,
                        size: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(
                          editableText == null
                              ? "All of City"
                              : editableText.stateName,
                          style: TextStyle(fontSize: 16, color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 14.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LocationSearch((value) {
                                      setState(() {});
                                      return editableText = value;
                                    })));
                      },
                      child: Text(
                        "Change Location",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
            ),
// Expanded(child:
//       FutureBuilder<List<Cat>>(
//         future: getCategory(),
//         builder: (context,snapshot){
//           if(snapshot.hasData){
//             final list = snapshot.data;
//             return ListView.builder(
//               shrinkWrap: true,
//               primary: false,
//               itemCount: list.length,
//               itemBuilder: (_,index){
//                 return Column(
//                   children: [
//
//                     Text(widget.title==null ? "" : widget.title),
//                   ],
//                 );
//               },
//             );
//           }else{
//             return Center(child: SpinKitChasingDots(color: Colors.red,size: 35,),);
//           }
//         },
//       ),
// )
            // Expanded(child: Padding(
            //   padding: const EdgeInsets.only(top:28.0,left: 10),
            //   child:
            //
            //   FutureBuilder<List<Cat>>(
            //     future: getCategory(),
            //     builder: (context, snapshot) {
            //       if (snapshot.hasData) {
            //         final list = snapshot.data;
            //         return ListView.builder(
            //           shrinkWrap: true,
            //           primary: false,
            //           itemCount: list.length,
            //           itemBuilder: (_, index) {
            //             final item = list[index];
            //             return Text(item.catName);
            //
            //           },
            //         );
            //       } else
            //         return Center(
            //           child: SpinKitChasingDots(
            //             color: Colors.red,
            //             size: 30,
            //           ),
            //         );
            //     },
            //
            //   ),
            // ) ,

            SizedBox(
              height: 10,
            ),

            Container(
              color: HexColor("#ededed"),
              child: Obx(
                () {
                  if (bottomSearchCategory.anyLoading.value) {
                    return Center(
                      child: SpinKitChasingDots(
                        color: Colors.red,
                        size: 40.0,
                      ),
                    );
                  }
                  return  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    shrinkWrap: true,
                    primary: false,
                    itemCount:
                        bottomSearchCategory.getAnything.value.cats.length,
                    itemBuilder: (_, index) {
                      var anything =
                          bottomSearchCategory.getAnything.value.cats[index];
                      return InkWell(
                        onTap: () {

                          Get.to(
                              AnythingCategoryDetails(
                                appBarTitle: anything.catName,
                                cat: anything,
                                stateValue: editableText,
                              ),
                              transition: Transition.zoom);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 7.0, right: 7.0, top: 8.0, bottom: 5.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0))),
                            height: 100,
                            width: 300,
                            child: Material(
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                ),
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image(
                                        height: 40,
                                        width: 40,
                                        image: NetworkImage(
                                          anything.catImg,
                                        ),
                                      ),
                                      SizedBox(height: 12.0),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12.0, right: 12.0),
                                        child: Text(
                                          anything.catName,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                      //   ClipRRect(
                      //   borderRadius: BorderRadius.circular(20),
                      //   child: InkWell(
                      //     onTap: () {
                      //       Get.to(AnythingCategoryDetails(cat: anything),
                      //           transition: Transition.zoom);
                      //     },
                      //     child:  Card(
                      //         elevation: 2,
                      //         color: Colors.white,
                      //         margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      //         child: Column(
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           children: [
                      //             Image.network(
                      //
                      //               anything.catImg,
                      //               height: 40,
                      //               width: 40,
                      //             ),
                      //             SizedBox(
                      //               height: 9,
                      //             ),
                      //             Padding(
                      //              padding: EdgeInsets.only(left: 8,right: 8),
                      //               child: Text(
                      //                 anything.catName,
                      //                 style: TextStyle(fontSize: 18),
                      //                 textAlign: TextAlign.center,
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //
                      // );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

//search Page.......SerachBar..........
//   Widget searchData() {
//     return Scaffold(
//       appBar: AppBar(
//         title: !isSearching
//             ? Text("")
//             : ClipRRect(
//                 borderRadius: BorderRadius.all(Radius.circular(5)),
//                 child: TextFormField(
//                   controller: _searchingController,
//                   onChanged: (val) {
//                     setState(() {
//                       // Navigator.push(
//                       //     context,
//                       //     MaterialPageRoute(
//                       //         builder: (context) => Search(val.trim())));
//
//                       _searchingController.clear();
//                     });
//                   },
//                   decoration: InputDecoration(
//                     fillColor: Colors.white,
//                     filled: true,
//                     border: InputBorder.none,
//                     hintText: "All Search",
//                   ),
//                 ),
//               ),
//         iconTheme: new IconThemeData(color: Colors.white),
//         actions: [
//           isSearching
//               ? IconButton(
//                   icon: Icon(Icons.cancel),
//                   onPressed: () {
//                     setState(() {
//                       this.isSearching = false;
//                     });
//                   },
//                 )
//               : IconButton(
//                   icon: Icon(Icons.search),
//                   onPressed: () {
//                     setState(() {
//                       this.isSearching = true;
//                     });
//                   },
//                 ),
//           // Badge(
//           //     child: IconButton(
//           //         icon: Icon(Icons.shopping_cart),
//           //         onPressed: () {
//           //           Navigator.push(
//           //               context,
//           //               MaterialPageRoute(
//           //                   builder: (context) => CartPage()));
//           //         }),
//           //     value: dataList.toString()),
//         ],
//         elevation: 0,
//         backgroundColor: Colors.red,
//       ),
//       body: Container(),
//     );
//   }
}

// class Search extends SearchDelegate{
//   @override
//   List<Widget> buildActions(BuildContext context) {
//
//    return [
//      IconButton(icon: Icon(Icons.search), onPressed: (){
//        query= "";
//        showSuggestions(context);
//      }),
//    ];
//   }
//
//   @override
//   Widget buildLeading(BuildContext context) {
//
//       return IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
//         close(context, null);
//       });
//
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//  return null;
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//    return Text("data");
//   }
//
// }
