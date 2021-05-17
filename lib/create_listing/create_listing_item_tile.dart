import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suuq_somali/Login/login_screen.dart';
import 'package:suuq_somali/create_listing/createList_controller_foreach.dart';
import 'package:suuq_somali/create_listing/look_for_some_form.dart';
import 'package:suuq_somali/utils/app_theme.dart';
import 'create_listing_form.dart';

class CreateListingItem extends StatefulWidget {
  @override
  _CreateListingItemState createState() => _CreateListingItemState();
}

class _CreateListingItemState extends State<CreateListingItem> {
  final createList = Get.put(CreateListForEachController());
  var currentSelect = "173";
  String selectedRadio;
  String selectedRadio2;
  String token;
  void getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString("loggedin_token");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getToken();
    selectedRadio = "173";
    selectedRadio2 = "174";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#ededed"),
      appBar: AppBar(
        title: Text("Post Your Ad"),
        backgroundColor: HexColor("#dc3545"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Container(
                height: 80,
                child: Card(
                  elevation: 0,
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/create.png",
                        cacheHeight: 60,
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your free posting allowance",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text("Learn about posting ads for free on suuq"),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Obx(() {
                if (createList.cl.value) {
                  return Center(
                    child: SpinKitChasingDots(
                      color: HexColor("#dc3545"),
                    ),
                  );
                }
                return ListView(
                  shrinkWrap: true,
                  primary: false,
                  children: [
                    ExpansionTile(
                      trailing: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                      title: Text("A Sell Property Cars an item or Service"),
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: createList.propertyList.length,
                          itemBuilder: (context, i) {
                            var data = createList.propertyList[i];
                            print("$data");
                            return ListTile(
                              onTap: (){
                                Get.to(CreateListFormPage(),transition: Transition.zoom);
                              },
                              title: Text(data),
                            );
                          },
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                    ),

                    ExpansionTile(
                      trailing: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                      title: Text("Offer property for rent"),
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: createList.propertyList.length,
                          itemBuilder: (context, i) {
                            var data = createList.propertyList[i];
                            print("$data");
                            return ListTile(
                              onTap: (){
                                Get.to(CreateListFormPage(),transition: Transition.zoom);
                              },
                              title: Text(data),
                            );
                          },
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey[800],
                    ),



                    ExpansionTile(
                      trailing: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                      title: Text("Post a job vacancy"),
                      children: [],
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    ExpansionTile(
                      trailing: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                      title: Text("Look for something to buy"),
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: createList.propertyList.length,
                          itemBuilder: (context, i) {
                            var data = createList.propertyList[i];
                            return ListTile(
                              onTap: (){
                                Get.to(LookForSomeFormSrceen(),transition: Transition.zoom);
                              },
                              title: Text(data),
                            );
                          },
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    ExpansionTile(
                      trailing: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                      title: Text("Look for something to rent"),
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: createList.propertyList.length,
                          itemBuilder: (context, i) {
                            var data = createList.propertyList[i];
                            return ListTile(
                              onTap: (){
                                Get.to(LookForSomeFormSrceen(),transition: Transition.zoom);
                              },
                              title: Text(data),
                            );
                          },
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    // ExpansionTile(
                    //   trailing: Icon(
                    //     Icons.arrow_drop_down,
                    //     color: Colors.white,
                    //   ),
                    //   title: Text("Sell or Rent Property "),
                    //   children: [
                    //     ListView.builder(
                    //       shrinkWrap: true,
                    //       primary: false,
                    //       itemCount: createList.propertyList.length,
                    //       itemBuilder: (context, i) {
                    //         var data = createList.propertyList[i];
                    //         return ListTile(
                    //           title: Text(data),
                    //         );
                    //       },
                    //     ),
                    //   ],
                    // ),
                    // Divider(
                    //   color: Colors.grey,
                    // ),
                    // ExpansionTile(
                    //   trailing: Icon(
                    //     Icons.arrow_drop_down,
                    //     color: Colors.white,
                    //   ),
                    //   title: Text("Sell or Rent Property "),
                    //   children: [
                    //     ListView.builder(
                    //       shrinkWrap: true,
                    //       primary: false,
                    //       itemCount: createList.propertyList.length,
                    //       itemBuilder: (context, i) {
                    //         var data = createList.propertyList[i];
                    //         return ListTile(
                    //           title: Text(data),
                    //         );
                    //       },
                    //     ),
                    //   ],
                    // ),
                    // Divider(
                    //   color: Colors.grey,
                    // ),
                    // ExpansionTile(
                    //   trailing: Icon(
                    //     Icons.arrow_drop_down,
                    //     color: Colors.white,
                    //   ),
                    //   title: Text("Sell or Rent Property "),
                    //   children: [
                    //     ListView.builder(
                    //       shrinkWrap: true,
                    //       primary: false,
                    //       itemCount: createList.propertyList.length,
                    //       itemBuilder: (context, i) {
                    //         var data = createList.propertyList[i];
                    //         return ListTile(
                    //           title: Text(data),
                    //         );
                    //       },
                    //     ),
                    //   ],
                    // ),
                    // Divider(
                    //   color: Colors.grey,
                    // ),
                    // ExpansionTile(
                    //   trailing: Icon(
                    //     Icons.arrow_drop_down,
                    //     color: Colors.white,
                    //   ),
                    //   title: Text("Sell or Rent Property "),
                    //   children: [
                    //     ListView.builder(
                    //       shrinkWrap: true,
                    //       primary: false,
                    //       itemCount: createList.propertyList.length,
                    //       itemBuilder: (context, i) {
                    //         var data = createList.propertyList[i];
                    //         return ListTile(
                    //           title: Text(data),
                    //         );
                    //       },
                    //     ),
                    //   ],
                    // ),
                    // Divider(
                    //   color: Colors.grey,
                    // ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
