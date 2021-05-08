import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suuq_somali/controller/property_controller.dart';
import 'package:suuq_somali/create_listing/category_list_controller.dart';
import 'package:suuq_somali/screen/tabbar_page.dart';
import 'package:suuq_somali/utils/app_theme.dart';
import 'package:http/http.dart' as http;

import 'createList_controller_foreach.dart';
import 'create_listing_item_tile.dart';

class LookForSomeFormSrceen extends StatefulWidget {
  @override
  _LookForSomeFormSrceenState createState() => _LookForSomeFormSrceenState();
}

class _LookForSomeFormSrceenState extends State<LookForSomeFormSrceen> {
  final  crateListFormSearch =
      Get.put(CreateListForEachController());

  //final  propertyCategory = Get.put(PropertyController());
  bool _autoValidate = false;
  String selectedCity;

  String selectedArea;

  String selectedRoom;

  String bathrooms;

  String selectedCarSpace;
  String buildYearValue;

  final itemTilte = TextEditingController();

  final price = TextEditingController();

  final shortDescription = TextEditingController();

  final description = TextEditingController();

  final address = TextEditingController();

  final postalCode = TextEditingController();

  final phoneNumber = TextEditingController();

  final enterHouseSizeController = TextEditingController();

  final keys = GlobalKey<FormState>();

  bool isLoading = false;

  Future<void> postAddData(
    String listingTitle,
    String price,
    String shortDescription,
    String description,
    String address,
    String postalCode,
    String phonenumber,
    String houseSize,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var id = sharedPreferences.getString("id");
    var token = sharedPreferences.getString("loggedin_token");
    var headers = {"Accept": "application/json"};
    String url = "https://suuq.cwprojects.xyz/api/user/process-create-listing";
    Map body = {
      "token": token,
      "userid": id,
      "listing_title": listingTitle,
      "price": price,
      "short_desc": shortDescription,
      "description": description,
      "address": address,
      "postal_code": postalCode,
      "phone": phonenumber,
      "area_code": "1",
      "category_id": "173",
      "city_id": "1",
      "country_code": "su",
      "custom_fields_ids": "32",
      "latlng": "23.4545,4.5634",
      "wa_area_code": "",
      "wa_area_code": "",
      "cats[]": ""
    };
    var response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {


      Map<String,dynamic> map = jsonDecode(response.body);
      if(map['status']==1){
        checkInOutDialogBox(context, "Success".toUpperCase(), "Successfully Data inserted!");
        // var data = jsonDecode(response.body);
        print("AAAA${response.body}");
      }else{
        errorDialouge(context, "Error".toUpperCase(), "Something Went Wrong!");

      }

      // if (data == 1) {
      //   // Fluttertoast.showToast(
      //   //     msg: "Data insert Successfully",
      //   //     toastLength: Toast.LENGTH_SHORT,
      //   //     gravity: ToastGravity.BOTTOM,
      //   //     timeInSecForIosWeb: 4,
      //   //     backgroundColor: Colors.red,
      //   //     textColor: Colors.white,
      //   //     fontSize: 16.0);
      // } else {
      //   // Fluttertoast.showToast(
      //   //     msg: "Something Went Wrong..",
      //   //     toastLength: Toast.LENGTH_SHORT,
      //   //     gravity: ToastGravity.BOTTOM,
      //   //     timeInSecForIosWeb: 4,
      //   //     backgroundColor: Colors.red,
      //   //     textColor: Colors.white,
      //   //     fontSize: 16.0);
      // }
    }

  }

  @override
  void initState() {
    // itemTilte.clear();
    // price.clear();
    // shortDescription.clear();
    // description.clear();
    // address.clear();
    // postalCode.clear();
    // phoneNumber.clear();
    // setState(() {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Look For Something"),
        backgroundColor: HexColor("#dc3545"),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 0.0, left: 10,right: 10),
        child: GestureDetector(
          onTap: () {

            if(keys.currentState.validate()){
              final String title = itemTilte.text;
              final String priceData = price.text;
              final String shortDesciption = shortDescription.text;
              final String desciption = description.text;
              final String addressData = address.text;
              final String postal_code = postalCode.text;
              final String phone = phoneNumber.text;
              final String houseSize = enterHouseSizeController.text;
              postAddData(
                title,
                priceData,
                shortDesciption,
                desciption,
                addressData,
                postal_code,
                phone,
                houseSize,
              );
            }else{
              setState(() {
                _autoValidate = true;
              });
            }


            //   address: addressValue,
            //   areaCode: "",
            //   categoryId: "173",
            //   cityId: "1",
            //   countryCode: "su",
            //   customFiledsId: "32",
            //   description: desValue,
            //   latLang: "",
            //   listingTitle: "",
            //   phoneNumber: "",
            //   postlCode: "",
            //   price: priceValue,
            //   shortDescription: shortDescripValue,
            //   weAreaCode1: "",
            //   weAreaCode2: "",
            //   waPhone: "",
            // );
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(15.0),
            ),
            height: 45,
            width: 250,
            child: Text(
              "Submit",
              style: TextStyle(color: Colors.white,fontSize: 20),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          autovalidate: _autoValidate,
          key: keys,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Item Title..........

              Padding(

                padding: const EdgeInsets.only(
                    left: 25.0, right: 18, bottom: 19, top: 20),
                child: TextFormField(
                  validator: (value){
                    if(value.isEmpty){
                      return "please enter list item";
                    }
                    return null;
                  },
                  controller: itemTilte,
                  decoration: InputDecoration(hintText: "Item Title"),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 18, bottom: 19),
                child: TextFormField(
                  validator: (value){
                    if(value.isEmpty){
                      return "please enter price";
                    }
                    return null;
                  },
                  controller: price,
                  decoration: InputDecoration(hintText: "Price"),
                ),
              ),


              SizedBox(
                height: 15,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 18, bottom: 19),
                child: TextFormField(
                  validator: (value){
                    if(value.isEmpty){
                      return "please enter short_des";
                    }
                    return null;
                  },

                controller: shortDescription,
                  decoration: InputDecoration(hintText: "Short_des"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 18, bottom: 19),
                child: TextFormField(
                  validator: (value){
                    if(value.isEmpty){
                      return "please enter description";
                    }
                    return null;
                  },
                  controller: description,
                  decoration: InputDecoration(hintText: "Description"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 18, bottom: 19),
                child: TextFormField(
                  validator: (value){
                    if(value.isEmpty){
                      return "please enter address";
                    }
                    return null;
                  },
                  controller: address,
                  decoration: InputDecoration(hintText: "Address"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 18, bottom: 19),
                child: TextFormField(
                  validator: (value){
                    if(value.isEmpty){
                      return "please enter postal code";
                    }
                    return null;
                  },
                  controller: postalCode,
                  decoration: InputDecoration(hintText: "Postal Code"),
                ),
              ),
              Obx(() {
                if (crateListFormSearch.cl.value) {
                  return Center(
                    child: SpinKitChasingDots(
                      color: Colors.red,
                      size: 20,
                    ),
                  );
                }
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, right: 23.0, top: 18),
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(color: Colors.white),
                    child: SearchableDropdown(
                      hint: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Text("Location"),
                      ),
                      iconSize: 20,
                      displayClearIcon: true,
                      items: crateListFormSearch.ccccc.value.states
                          .map((e) {
                        return DropdownMenuItem(
                          child: Text(e.cityName),
                          value: e.cityName,
                        );
                      }).toList(),
                      value: selectedCity,
                      onChanged: (value) {
                        setState(() {
                          selectedCity = value;
                        });
                      },
                      isExpanded: true,
                    ),
                  ),
                );
              }),
              SizedBox(
                height: 10,
              ),
              Obx(
                () {
                  if (crateListFormSearch.cl.value) {
                    return Center(
                      child: SpinKitChasingDots(
                        color: Colors.red,
                        size: 40,
                      ),
                    );
                  }
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 15, right: 23),
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(color: Colors.white),
                      child: DropdownButton(
                        iconSize: 30,
                        isExpanded: true,
                        style: TextStyle(color: Colors.black),
                        hint: Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            " Select Area",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        items: crateListFormSearch.ccccc.value.cities
                            .map((e) {
                          return DropdownMenuItem(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0.0),
                              child: Container(
                                child: ListTile(
                                  title: Text(e.stateName),
                                ),
                              ),
                            ),
                            value: e.stateName,
                          );
                        }).toList(),
                        value: selectedArea,
                        onChanged: (text) {
                          setState(() {
                            selectedArea = text;
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 18, bottom: 19),
                child: TextFormField(
                  validator: (val){
                    if(val.isEmpty){
                      return "please enter phone number";
                    }
                    return null;
                  },
                  controller: phoneNumber,
                  decoration: InputDecoration(hintText: "Phone Number"),
                ),
              ),

              Obx(
                () {
                  if (crateListFormSearch.cl.value) {
                    return Center(
                      child: SpinKitChasingDots(
                        color: Colors.red,
                        size: 50.0,
                      ),
                    );
                  }
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 25, right: 25),
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: DropdownButton(
                        isExpanded: true,
                        style: TextStyle(color: Colors.black),
                        hint: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            "Rooms",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        items: crateListFormSearch.roomList.map((element) {
                          return DropdownMenuItem(
                            value: element,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 13.0),
                              child: Text(
                                // ignore: unnecessary_brace_in_string_interps
                                "${element} Rooms",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          );
                        }).toList(),
                        value: selectedRoom,
                        onChanged: (text) {
                          setState(() {
                            selectedRoom = text;
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),
              Obx(
                () {
                  if (crateListFormSearch.cl.value) {
                    return Center(
                      child: SpinKitChasingDots(
                        color: Colors.red,
                        size: 50.0,
                      ),
                    );
                  }
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 25, right: 25),
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: DropdownButton(
                        isExpanded: true,
                        style: TextStyle(color: Colors.black),
                        hint: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            "Bathrooms",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        items: crateListFormSearch.bathRooms.map((element) {
                          return DropdownMenuItem(
                            value: element,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 13.0),
                              child: Text(
                                // ignore: unnecessary_brace_in_string_interps
                                "${element} Bathrooms",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          );
                        }).toList(),
                        value: bathrooms,
                        onChanged: (text) {
                          setState(() {
                            bathrooms = text;
                          });
                        },
                      ),
                    ),
                  );
                },
              ),

              SizedBox(
                height: 10,
              ),
              Obx(
                () {
                  if (crateListFormSearch.cl.value) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 25, right: 25),
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: DropdownButton(
                        isExpanded: true,
                        style: TextStyle(color: Colors.black),
                        hint: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            "Car Space",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        items: crateListFormSearch.carSpace.map((element) {
                          return DropdownMenuItem(
                            value: element,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 13.0),
                              child: Text(
                                // ignore: unnecessary_brace_in_string_interps
                                "${element} Car Space",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          );
                        }).toList(),
                        value: selectedCarSpace,
                        onChanged: (text) {
                          setState(() {
                            selectedCarSpace = text;
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 18, bottom: 19),
                child: TextFormField(
                  validator: (value){
                    if(value.isEmpty){
                      return "please enter house size";
                    }
                    return null;
                  },
                  controller: enterHouseSizeController,
                  decoration: InputDecoration(hintText: "Enter house Size"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Obx(
                    () {
                  if (crateListFormSearch.cl.value) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Padding(
                    padding:
                    const EdgeInsets.only(top: 10.0, left: 25, right: 25),
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: DropdownButton(
                        isExpanded: true,
                        style: TextStyle(color: Colors.black),
                        hint: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            "Build Year",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        items: crateListFormSearch.buildYear.map((element) {
                          return DropdownMenuItem(
                            value: element,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 13.0),
                              child: Text(
                                // ignore: unnecessary_brace_in_string_interps
                                "${element}",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          );
                        }).toList(),
                        value: buildYearValue,
                        onChanged: (text) {
                          setState(() {
                            buildYearValue = text;
                          });
                        },
                      ),
                    ),
                  );
                },
              ),

              // Column(
              //   children: [
              //
              //     _image == null
              //         ? Text('No image selected.')
              //         : Image.file(_image,cacheHeight: 100,fit: BoxFit.cover,),
              //
              //     Padding(
              //       padding: const EdgeInsets.only(bottom: 12.0),
              //       child: GestureDetector(
              //         onTap: (){
              //          getImage();
              //         },
              //         child: Container(
              //           alignment: Alignment.center,
              //           decoration: BoxDecoration(
              //             color: Colors.red,
              //           ),
              //           height: 40,
              //           width: 320,
              //           child: Text(
              //             "Upload a Main Single Photo",
              //             style: TextStyle(color: Colors.white),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // Padding(
              //   padding: EdgeInsets.only(
              //     bottom: 10,
              //   ),
              //   child: Container(
              //     width: double.infinity,
              //     decoration: BoxDecoration(color: Colors.white),
              //     child: Column(
              //       children: [
              //         SizedBox(
              //           height: 8,
              //         ),
              //         CircleAvatar(
              //           radius: 60.0,
              //           backgroundColor: Colors.black,
              //           child: CircleAvatar(
              //             // backgroundColor: Colors.indigo,
              //             radius: 57.0,
              //             backgroundImage: fileImage1 == null
              //                 ? AssetImage("No Image Found...")
              //                 : FileImage(
              //                     File(fileImage1.path),
              //                   ),
              //
              //             backgroundColor: Colors.white,
              //           ),
              //         ),
              //         SizedBox(
              //           height: 15,
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.only(bottom: 12.0),
              //           child: GestureDetector(
              //             onTap: () {
              //               showModalBottomSheet(
              //                 context: context,
              //                 builder: ((builder) => bottomSheet()),
              //               );
              //             },
              //             child: Container(
              //               height: 40,
              //               width: 320,
              //               alignment: Alignment.center,
              //               decoration: BoxDecoration(
              //                 color: Colors.red,
              //               ),
              //               child: Text(
              //                 "Single photo",
              //                 style: TextStyle(color: Colors.white),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),

              // Container(
              //   decoration: BoxDecoration(color: Colors.white),
              //   child: Column(
              //     children: [
              //       // Padding(
              //       //   padding: const EdgeInsets.only(left: 25.0, right: 18),
              //       //   child: TextField(
              //       //     decoration:
              //       //         InputDecoration(hintText: "Description"),
              //       //   ),
              //       // ),
              //       SizedBox(
              //         height: 10,
              //       ),
              //
              //       SizedBox(
              //         height: 20,
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.only(
              //             left: 25.0, right: 18, bottom: 19),
              //         child: TextField(
              //           decoration: InputDecoration(hintText: "Price"),
              //         ),
              //       ),
              //
              //       SizedBox(
              //         height: 20,
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.only(
              //             left: 25.0, right: 18, bottom: 19),
              //         child: TextField(
              //           decoration: InputDecoration(hintText: "Address"),
              //         ),
              //       ),
              //       SizedBox(
              //         height: 20,
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.only(
              //             left: 25.0, right: 18, bottom: 19),
              //         child: TextField(
              //           decoration:
              //               InputDecoration(hintText: "Postal code"),
              //         ),
              //       ),
              //       SizedBox(
              //         height: 20,
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.only(
              //             left: 25.0, right: 18, bottom: 19),
              //         child: TextField(
              //           decoration: InputDecoration(hintText: "Build Year"),
              //         ),
              //       ),
              //       SizedBox(
              //         height: 20,
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.only(
              //             left: 25.0, right: 18, bottom: 19),
              //         child: TextField(
              //           decoration:
              //               InputDecoration(hintText: "Short Description"),
              //         ),
              //       ),
              //       // SizedBox(height: 30,),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 30,
              ),



            ],
          ),
        ),
      ),
    );
  }
  void checkInOutDialogBox(
      BuildContext context, String title, String description) {
    AwesomeDialog(
        dismissOnBackKeyPress: false,

        context: context,
        animType: AnimType.TOPSLIDE,
        headerAnimationLoop: false,
        dialogType: DialogType.SUCCES,
        title: title,
        dialogBackgroundColor: Colors.white,
        desc: description,
        btnOkOnPress: () {
          Get.to(CreateListingItem());

          // Get.to(() => PinCodeVerificationScreen(title));
        },
        btnOkIcon: Icons.check_circle,
        onDissmissCallback: () {
          debugPrint('Dialog Dissmiss from callback');
        })
      ..show();
  }
  void errorDialouge(
      BuildContext context, String title, String description) {
    AwesomeDialog(
        context: context,
        animType: AnimType.TOPSLIDE,
        headerAnimationLoop: false,
        dialogType: DialogType.ERROR,
        title: title,
        dialogBackgroundColor: Colors.white,
        desc: description,
        btnOkOnPress: () {
          Get.back();

          // Get.to(() => PinCodeVerificationScreen(title));
        },
        btnOkIcon: Icons.error_outlined,
        onDissmissCallback: () {
          debugPrint('Dialog Dissmiss from callback');
        })
      ..show();
  }
}


