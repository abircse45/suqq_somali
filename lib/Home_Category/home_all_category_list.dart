import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:suuq_somali/Home_Category/home_category_list_controller.dart';
import 'package:suuq_somali/exception/no_data_available.dart';
import 'package:suuq_somali/models/anything_model.dart';
import 'package:suuq_somali/utils/app_theme.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

import 'home_all_category_list_details.dart';

class HomeAllCategoryListScreen extends StatefulWidget {
  final Cat cat;
  final String appBarTitle;

  const HomeAllCategoryListScreen({Key key, this.appBarTitle, this.cat})
      : super(key: key);

  @override
  _HomeAllCategoryListScreenState createState() =>
      _HomeAllCategoryListScreenState();
}

class _HomeAllCategoryListScreenState extends State<HomeAllCategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    final allCategory = Get.put(HomeCategoryListController(widget.cat));
    return Scaffold(
      backgroundColor: HexColor("#ededed"),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 1,
        centerTitle: true,
        title: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Text(
              widget.appBarTitle,
              style: TextStyle(fontSize: 18, color: Colors.black),
            )),
      ),
      body: Obx(() {
        if (allCategory.homeLoading.value) {
          return Center(
            child: SpinKitFadingCircle(
              duration: Duration(seconds: 3),
              color: Colors.red,
              size: 40.0,
            ),
          );
        }
        return allCategory.homeAllcategory.value.listItems.isNotEmpty
            ? ListView.builder(
                itemCount: allCategory.homeAllcategory.value.listItems.length,
                itemBuilder: (context, index) {
                  var allCategoryData =
                      allCategory.homeAllcategory.value.listItems[index];
                  return InkWell(
                    onTap: () {
                      Get.to(
                          HomeAllCategoryListDetails(
                            image: allCategoryData.mainPicUrl,
                            title: allCategoryData.listingTitle,
                            price: allCategoryData.price,
                            description: allCategoryData.shortDesc,
                          ),
                          transition: Transition.zoom);
                    },
                    child: Card(
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      elevation: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 32.0, left: 8),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
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
                                        padding: const EdgeInsets.only(
                                            left: 5.0, top: 30),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 9.0),
                                              child: Text(
                                                allCategoryData.listingTitle,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 9.0, top: 9),
                                              child: Text(
                                                "Sl. Sh.${allCategoryData.price}",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 12.0),
                                              child: Text(
                                                allCategoryData.shortDesc,
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.add_location,
                                                    color: Colors.red,
                                                    size: 25,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 4.0),
                                                      child: Text(
                                                        "${allCategoryData.address} , ${allCategoryData.address}",
                                                        style: TextStyle(
                                                            fontSize: 13),
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
                                              padding: const EdgeInsets.only(
                                                  left: 6.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.app_settings_alt,
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
                                                          fontSize: 13),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Icon(
                                                    Icons.aspect_ratio_rounded,
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
                                                          fontSize: 13),
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
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5.0,
                                                          right: 5.0),
                                                  child: new ElevatedButton(
                                                    onPressed: () {
                                                      UrlLauncher.launch(
                                                          'tel:+${allCategoryData.phone.toString()}');
                                                    },
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all<Color>(
                                                                    HexColor(
                                                                        "#dc3545"))),
                                                    child: Text("  Call  "),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 45.0,
                                                          right: 5.0),
                                                  child: new ElevatedButton(
                                                    onPressed: () {
                                                      UrlLauncher.launch(
                                                          'mailto:info@suuqsomali.com');
                                                    },
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all<Color>(
                                                                    HexColor(
                                                                        "#dc3545"))),
                                                    child: Text(" Email "),
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
      }),
    );
  }
}
