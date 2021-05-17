import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:suuq_somali/All_Search/All_search_controller.dart';
import 'package:suuq_somali/Home_Category/anythings_list_category_details.dart';
import 'package:suuq_somali/exception/no_data_available.dart';
import 'package:suuq_somali/utils/app_theme.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class Search extends StatefulWidget {
  @override
  _Search createState() => _Search();
}

class _Search extends State<Search> {
  final searchData = Get.put(ChangeAllSearchController());
  String searchS;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#ededed"),
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text(
          "Search Result",
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 0.5,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
        //     Padding(
        //       padding: const EdgeInsets.only(left: 10.0, right: 6, top: 10),
        //       child: Container(
        //         height: 50,
        //         child: TextField(
        //           textInputAction: TextInputAction.search,
        //           //   FocusNode: focusNode,
        //           autofocus: true,
        //           onChanged: (val) {
        //             setState(() {
        //               searchS = val;
        //             });
        //           },
        //           onSubmitted: (val) {
        // setState(() {
        //   searchData.getDataCalling(searchS);
        //   searchData.allSearchLoading(true);
        // });
        //           },
        //           decoration: InputDecoration(
        //             suffixIcon: Padding(
        //               padding: const EdgeInsets.only(right: 8.0),
        //               child: GestureDetector(
        //                 onTap: () {
        //                   setState(() {
        //                     searchData.getDataCalling(searchS);
        //                     searchData.allSearchLoading(true);
        //                   });
        //                   Padding(
        //                     padding: const EdgeInsets.only(top: 38.0),
        //                     child: Center(
        //                       child: SpinKitRing(
        //                         color: Colors.red,
        //                         size: 30,
        //                       ),
        //                     ),
        //                   );
        //                 },
        //                 child: Icon(Icons.search),
        //               ),
        //             ),
        //             hintText: "Search",
        //             contentPadding: EdgeInsets.only(top: 8, left: 20),
        //             fillColor: Colors.white,
        //             filled: true,
        //             border: OutlineInputBorder(
        //               borderSide: BorderSide.none,
        //               borderRadius: BorderRadius.circular(18),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
            SizedBox(
              height: 5,
            ),
            Container(
              //   height: MediaQuery.of(context).size.height,
              child: Obx(
                () {
                  if (searchData.allSearchLoading.value) {
                    return Center(
                      child: SpinKitRing(
                        color: Colors.red,
                        size: 30,
                      ),
                    );
                  }
                  return searchData.getAllSearch.value.listItems !=null
                      ? ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount:
                              searchData.getAllSearch.value.listItems.length,
                          itemBuilder: (context, index) {
                            var allCategoryData =
                                searchData.getAllSearch.value.listItems[index];
                            return InkWell(
                              onTap: () {
                                Get.to(
                                    AnythigListCategoryDetails(
                                      image: allCategoryData.mainPicUrl,
                                      title: allCategoryData.listingTitle,
                                      price: allCategoryData.price,
                                      description: allCategoryData.shortDesc,
                                    ),
                                    transition: Transition.zoom);
                              },
                              child: Card(
                                color: Colors.white,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
                                elevation: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 32.0, left: 8),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  child: Image.network(
                                                    allCategoryData.mainPicUrl,
                                                    height: 140,
                                                    width: 120,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5.0, top: 30),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 9.0),
                                                        child: Text(
                                                          allCategoryData
                                                              .listingTitle,
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 9.0,
                                                                top: 9),
                                                        child: Text(
                                                          "Sl. Sh.${allCategoryData.price}",
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 12.0),
                                                        child: Text(
                                                          allCategoryData
                                                              .shortDesc,
                                                          style: TextStyle(
                                                              fontSize: 14),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 8,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 5.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .add_location,
                                                              color: Colors.red,
                                                              size: 25,
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            4.0),
                                                                child: Text(
                                                                  "${allCategoryData.address} , ${allCategoryData.address}",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          13),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 8,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 6.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .app_settings_alt,
                                                              color: Colors.red,
                                                              size: 20,
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Expanded(
                                                              child: Text(
                                                                "Name",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .aspect_ratio_rounded,
                                                              color: Colors.red,
                                                              size: 20,
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Expanded(
                                                              child: Text(
                                                                "New",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 5.0,
                                                                    right: 5.0),
                                                            child:
                                                                new ElevatedButton(
                                                              onPressed: () {
                                                                UrlLauncher.launch(
                                                                    'tel:+${allCategoryData.phone.toString()}');
                                                              },
                                                              style: ButtonStyle(
                                                                  backgroundColor: MaterialStateProperty.all<
                                                                          Color>(
                                                                      HexColor(
                                                                          "#dc3545"))),
                                                              child: Text(
                                                                  "  Call  "),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 45.0,
                                                                    right: 5.0),
                                                            child:
                                                                new ElevatedButton(
                                                              onPressed: () {
                                                                UrlLauncher.launch(
                                                                    'mailto:info@suuqsomali.com');
                                                              },
                                                              style: ButtonStyle(
                                                                  backgroundColor: MaterialStateProperty.all<
                                                                          Color>(
                                                                      HexColor(
                                                                          "#dc3545"))),
                                                              child: Text(
                                                                  " Email "),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      : NoDatAvailable();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: missing_return
