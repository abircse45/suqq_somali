import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:suuq_somali/Home_Category/anythings_list_category_details.dart';
import 'package:suuq_somali/create_listing/categories_list_model.dart';
import 'package:suuq_somali/exception/no_data_available.dart';
import 'package:suuq_somali/utils/app_theme.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

import 'all_category_screen_controller.dart';

class CategoryScreen extends StatefulWidget {
  final Categor cat;
  final String title;
  final Child ch;

  const CategoryScreen({Key key, this.cat, this.title,this.ch}) : super(key: key);
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final data = Get.put(AllCategoryScreenController(widget.cat,widget.ch));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#dc3545"),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(widget.title),
      ),
      body: Obx(() {
        if (data.allCategoryLoading.value) {
          return Center(
            child: SpinKitChasingDots(
              color: Colors.red,
              size: 35,
            ),
          );
        }
        return data.getallCategory.value.listItems.isNotEmpty
            ? Column(
                children: [
               widget.cat.childs == null ? Container() :   ExpansionTile(
                    title: Text(widget.title),
                    children: [
                      Obx((){
                        if(data.allCategoryLoading.value){
                          return Center(child: SpinKitChasingDots(color: Colors.red,size: 35,),);
                        }

                        return ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: widget.cat.childs.length,
                          itemBuilder: (_,index){
                            var dataC = widget.cat.childs[index];
                            return ListTile(
                              onTap: (){
                                data.getCategoryDetails(dataC.catSlug);


                              },
                              title: Text(  dataC.catName),

                            );
                          },
                        );
                      }),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: data.getallCategory.value.listItems.length,
                      itemBuilder: (context, index) {
                        var allCategoryData =
                            data.getallCategory.value.listItems[index];
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
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                              padding: const EdgeInsets.only(
                                                  left: 5.0, top: 30),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 9.0),
                                                    child: Text(
                                                      allCategoryData
                                                          .listingTitle,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
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
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 12.0),
                                                    child: Text(
                                                      allCategoryData.shortDesc,
                                                      style: TextStyle(
                                                          fontSize: 14),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
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
                                                                const EdgeInsets
                                                                        .only(
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
                                                    padding:
                                                        const EdgeInsets.only(
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
                                                                fontSize: 13),
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
                                                              backgroundColor:
                                                                  MaterialStateProperty.all<
                                                                          Color>(
                                                                      HexColor(
                                                                          "#dc3545"))),
                                                          child:
                                                              Text("  Call  "),
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
                                                              backgroundColor:
                                                                  MaterialStateProperty.all<
                                                                          Color>(
                                                                      HexColor(
                                                                          "#dc3545"))),
                                                          child:
                                                              Text(" Email "),
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
                    ),
                  ),
                ],
              )
            : NoDatAvailable();
      }),
    );
  }
}
