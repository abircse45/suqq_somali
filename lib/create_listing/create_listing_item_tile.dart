import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suuq_somali/Login/login_screen.dart';
import 'package:suuq_somali/create_listing/category_list_controller.dart';
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
                      title: Text("Sell or Rent Property "),
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: createList.propertyList.length,
                          itemBuilder: (context, i) {
                            var data = createList.propertyList[i];
                            print("$data");
                            return ExpansionTile(
                              trailing: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                              ),
                              title: Text(data),
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20.0, top: 6),
                                  child: Row(
                                    children: [
                                      Radio(
                                        value: selectedRadio,
                                        groupValue: currentSelect,
                                        onChanged: (val) {
                                          setState(() {
                                            currentSelect = selectedRadio;
                                          });
                                        },
                                      ),
                                      Text("Rent"),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20.0, top: 6),
                                  child: Row(
                                    children: [
                                      Radio(
                                        value: selectedRadio2,
                                        groupValue: currentSelect,
                                        onChanged: (val) {
                                          setState(() {
                                            currentSelect = selectedRadio2;
                                          });
                                        },
                                      ),
                                      Text("Sale"),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  // ignore: deprecated_member_use
                                  child: RaisedButton(
                                    onPressed: () {
                              if(token==null){
                                Get.to(LoginScreen(),
                                    transition: Transition.zoom);
                              }else{
                                Get.to(CreateListFormPage(),
                                    transition: Transition.zoom);
                              }
                                    },
                                    child: Text(
                                      "Next",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                    color: HexColor("#dc3545"),
                                  ),
                                )
                              ],
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
                      title: Text("Post a job vacancy"),
                      children: [

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
                      title: Text("Look for Something"),
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: createList.propertyList.length,
                          itemBuilder: (context, i) {
                            var data = createList.propertyList[i];
                            return ExpansionTile(
                              trailing: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                              ),
                              title: Text(data),
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsets.only(left: 20.0, top: 6),
                                  child: Row(
                                    children: [
                                      Radio(
                                        value: selectedRadio,
                                        groupValue: currentSelect,
                                        onChanged: (val) {
                                          setState(() {
                                            currentSelect = selectedRadio;
                                          });
                                        },
                                      ),
                                      Text("Rent"),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(left: 20.0, top: 6),
                                  child: Row(
                                    children: [
                                      Radio(
                                        value: selectedRadio2,
                                        groupValue: currentSelect,
                                        onChanged: (val) {
                                          setState(() {
                                            currentSelect = selectedRadio2;
                                          });
                                        },
                                      ),
                                      Text("Sale"),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  // ignore: deprecated_member_use
                                  child: RaisedButton(
                                    onPressed: () {
                                      if(token==null){
                                        Get.to(LoginScreen(),
                                            transition: Transition.zoom);
                                      }else{
                                        Get.to(LookForSomeFormSrceen(),
                                            transition: Transition.zoom);
                                      }
                                    },
                                    child: Text(
                                      "Next",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                    color: HexColor("#dc3545"),
                                  ),
                                )
                              ],
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
