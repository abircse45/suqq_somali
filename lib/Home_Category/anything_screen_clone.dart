import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:suuq_somali/Home_Category/home_all_category_list.dart';
import 'package:suuq_somali/car/CarPage.dart';
import 'package:suuq_somali/controller/anything_controller.dart';
import 'package:suuq_somali/models/anything_model.dart';
import 'package:suuq_somali/property/PropertyPage.dart';
import 'package:suuq_somali/utils/app_theme.dart';



class AnythingPageClone extends StatefulWidget {
  @override
  _AnythingPageCloneState createState() => _AnythingPageCloneState();
}

class _AnythingPageCloneState extends State<AnythingPageClone> {
  final anyThingController = Get.put(AnyThingController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            child: Image.asset(
              "assets/images/car.jpg",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          // Row(
          //   children: [
          //     Expanded(
          //       child: InkWell(
          //         onTap: () {
          //
          //         },
          //         child: FadeAnimation(
          //           0.2,
          //           ItemCard("assets/images/real-state.png", "Property"),
          //         ),
          //       ),
          //     ),
          //     Expanded(
          //       child: InkWell(
          //         onTap: () {
          //
          //         },
          //         child: FadeAnimation(
          //           0.2,
          //           ItemCard("assets/images/car.png", "Car"),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          Container(
            color: HexColor("#ededed"),
            child: Obx(
              () {
                if (anyThingController.anyLoading.value) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top:138.0),
                      child: SpinKitRing(
                        color: Colors.red,
                        size: 40.0,
                      ),
                    ),
                  );
                }
              return  GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  shrinkWrap: true,
                  primary: false,
                  itemCount: anyThingController.finalList.length,
                  itemBuilder: (_, index) {
                    var anything =
                    anyThingController.finalList[index];
                    return InkWell(
                      onTap: () {

                        if(anything.catId=="001"){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PropertyPage()),
                          );
                        }else if(anything.catId == "002"){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CarPage()),
                          );
                        }else {
                          Get.to(HomeAllCategoryListScreen(cat: anything,
                            appBarTitle: anything.catName,
                              ),
                              transition: Transition.zoom);
                        }
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
                                      image:  ImageSet(anything),
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

          SizedBox(height: 240,),


        ],
      ),
    );
  }

  ImageProvider<Object> ImageSet(Cat cat){
    if(cat.catId == "001"){
      return AssetImage("assets/images/real-state.png");
    }else if(cat.catId == "002"){
      return AssetImage("assets/images/car.png");
    }else{
      return NetworkImage(
        cat.catImg,
      );
    }
  }
}

class ItemCard extends StatelessWidget {
  String image, title;

  ItemCard(this.image, this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 7.0, right: 7.0, top: 8.0, bottom: 5.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        height: 120,
        width: 300,
        child: Material(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    height: 60,
                    width: 60,
                    color: Colors.black,
                    image: AssetImage(
                      image,
                    ),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
