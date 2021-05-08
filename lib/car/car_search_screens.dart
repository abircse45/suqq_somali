import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:suuq_somali/car/car_filter_details.dart';
import 'package:suuq_somali/car/car_search_controller.dart';
import 'package:suuq_somali/exception/no_data_available.dart';
import 'package:suuq_somali/utils/app_theme.dart';

class CarSearchScreen extends StatefulWidget {

  @override
  _CarSearchScreenState createState() => _CarSearchScreenState();
}

class _CarSearchScreenState extends State<CarSearchScreen> {
  @override
  Widget build(BuildContext context) {
    final carSearchController = Get.put(CarSearchController());

    return Scaffold(
      backgroundColor: HexColor("#ededed"),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0.0,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Image.asset(
            "assets/images/suuq_logo.png",
            height: 90,
            width: 170,
          ),
        ),
      ),
      body: Obx(() {
        if (carSearchController.searchLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return carSearchController.getSearch.value.listItems.isNotEmpty ?
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListView.builder(
            shrinkWrap: true,
            primary: false,
            scrollDirection: Axis.vertical,
            itemCount: carSearchController.getSearch.value.listItems.length,
            itemBuilder: (_, index) {
              var data = carSearchController.getSearch.value.listItems[index];
              print("ABir  ${data.listingTitle}");

              return Padding(
                padding: const EdgeInsets.only(left: 4.0, top: 5),
                child: Card(
                  color: Colors.white,
                  elevation: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: InkWell(
                      onTap: () {
                        Get.to(CarFilterDetails(
                          image: data.mainPicUrl,
                          title: data.listingTitle,
                          price: data.price,
                          description: data.shortDesc,
                        ),transition: Transition.zoom);
                      },
                      child: Container(
                        height: 300,
                        width: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Image.network(
                                  data.mainPicUrl,
                                  height: 138,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 98.0,
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 0.0, right: 30),
                                        child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                              BorderRadius.circular(0),
                                            ),
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.all(6.0),
                                              child: Text(
                                                "\$${data.price}",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white),
                                              ),
                                            )),
                                      ),
                                      Spacer(),
                                      IconButton(
                                          icon: Icon(
                                            Icons.favorite_border,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {}),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                data.listingTitle,
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 4.0),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.person,
                                                  color: Colors.red,
                                                ),
                                                Text("  1 month ago"),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 4.0),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.tour,
                                                  color: Colors.red,
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.all(4.0),
                                                  child: Text("  Beds: 1"),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 4.0),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.keyboard,
                                                  color: Colors.red,
                                                ),
                                                Text("   Type : 3"),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(right: 4.0),
                                        child: Column(
                                          // mainAxisAlignment:
                                          //     MainAxisAlignment.start,
                                          // crossAxisAlignment:
                                          //     CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              // mainAxisAlignment:
                                              //     MainAxisAlignment.start,
                                              // crossAxisAlignment:
                                              //     CrossAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.location_on_outlined,
                                                  color: Colors.red,
                                                ),
                                                Text(" Hargeisa"),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20.0, right: 5),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        right: 3.0),
                                                    child: Icon(
                                                      Icons.adb_sharp,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                  Text(" Baths"),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 22.0, right: 3),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.border_style,
                                                    color: Colors.red,
                                                  ),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        left: 4.0),
                                                    child: Text(" sq. ft"),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                ],
                              ),
                            ),

                            ///  property  Call
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 6.0),
                                  child: Text(
                                    "Property for Buy",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.red[600],
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 25.0, right: 5.0),
                                  child: new ElevatedButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                        backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.black)),
                                    child: Text("    Call    "),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ) : NoDatAvailable();
      }),
    );
  }
}
