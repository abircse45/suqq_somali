import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:suuq_somali/controller/property_controller.dart';
import 'package:suuq_somali/controller/filter_search_controller_property.dart';
import 'package:suuq_somali/models/property_model.dart';
import 'package:suuq_somali/property/search_screen.dart';
import 'package:suuq_somali/utils/app_theme.dart';
import 'package:fluttertoast/fluttertoast.dart';
class PropertyFilter extends StatefulWidget {
  @override
  _PropertyFilterState createState() => _PropertyFilterState();
}

class _PropertyFilterState extends State<PropertyFilter> {
  final propertyController = Get.put(PropertyController());
  final searchController = Get.put(SearchController());
  bool isPropertySelected = false;
  bool isVisible = false;
  //List<String> datType = [];
  //String buycat_id = "173";
  String propertyRent = "173";
  String propertyBuy = "174";
  var currentSelectedValueRent = "173";
  // var currentSelectedValueBuy = "174";

  String currentSelectedValueProperty;
  String currentSelectedValueRoom;
  String currentSelectedValueBathroom;
  String currentSelectedValueCar;

  String selectArea;
  // String selectProperty;
  // String selectedRoom;
  // String selectBathRooms;
  // String selectedCarSpace;
  String selectedCity;
  AutoCompleteTextField searchTextField;
  GlobalKey<AutoCompleteTextFieldState<StateData>> key = new GlobalKey();
  List<StateData> state = [];
  var selected = -1;
  var selected1 = -1;
  var selected2 = -1;
  var selected3 = -1;

  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 1,
        backgroundColor: Colors.grey[100],
        leading: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "FILTERS",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16),
        ),
        actions: [
          InkWell(
            onTap: () {
              setState(() {
                selectedCity = null;
                selectArea = null;
                selected = null;
                selected1 = null;
                selected2 = null;
                selected3 = null;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Reset",
                  style: TextStyle(fontSize: 17, color: Colors.green[800]),
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar:      Padding(
        padding: const EdgeInsets.only(left:15.0,right:15),
        child: Container(
          height: 45,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {


              searchController.getSaerchDataCalling(
                currentSelectedValueRent,
                selectedCity,
                selectArea,
                currentSelectedValueProperty,
                currentSelectedValueRoom,
                currentSelectedValueBathroom,
                currentSelectedValueCar,
              );
              // searchController.searchService.fetchSearchData(
              //   buycat_id,
              //   selectedCity,
              //   selectArea,
              //   selectProperty,
              //   selectedCarSpace,
              //   selectBathRooms,
              //   selectedRoom,
              //
              //
              //
              // );
              Get.to(SearchScreen(), transition: Transition.zoom);
            },
            style: ButtonStyle(
              backgroundColor:
              MaterialStateProperty.all<Color>(Colors.green[800]),
            ),
            child: Text(
              "Search",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
      body:

      // currentSelectedValueRent == propertyRent
      //     ?
      SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0.0, bottom: 5, top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:17.0),
                    child: RaisedButton(
                      color: currentSelectedValueRent == propertyRent
                          ? HexColor("#bae6c0")
                          : Colors.white,
                      onPressed: () {
                        setState(() {
                          currentSelectedValueRent = propertyRent;
                        });
                      },
                      child: Text(
                        "         Rent         ",
                        style: TextStyle(fontSize: 16, color: Colors.green[700]),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  RaisedButton(
                    color: currentSelectedValueRent == propertyBuy
                        ? HexColor("#bae6c0")
                        : Colors.white,
                    onPressed: () {
                      setState(
                            () {
                          currentSelectedValueRent = propertyBuy;
                        },
                      );
                    },
                    child: Text(
                      "         Buy         ",
                      style: TextStyle(fontSize: 16, color: Colors.green[700]),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 10,
            ),
            // Obx((){
            //   if(propertyController.loading.value){
            //     return Center(child: CircularProgressIndicator(),);
            //   }
            //   return  searchTextField = AutoCompleteTextField<StateData>(
            //     key: key,
            //     clearOnSubmit: false,
            //     onFocusChanged: (dff){},
            //     suggestions: state,
            //     style: TextStyle(color: Colors.black, fontSize: 16.0),
            //     decoration: InputDecoration(
            //       contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 20.0),
            //       hintText: "Search Name",
            //       hintStyle: TextStyle(color: Colors.black),
            //     ),
            //     itemFilter: (item, query) {
            //       return item.stateName.toLowerCase().startsWith(query.toLowerCase());
            //     },
            //     itemSorter: (a, b) {
            //       return a.stateName.compareTo(b.stateName);
            //     },
            //     itemSubmitted: (item) {
            //       setState(() {
            //         searchTextField.textField.controller.text = item.stateName;
            //       });
            //     },
            //     itemBuilder: (context, item) {
            //       return Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: <Widget>[
            //           ListTile(
            //             title:Text(item.stateName),
            //           )
            //         ],
            //       );
            //     },
            //   );
            // }),

            Obx(
                  () {
                return Padding(
                  padding:
                  const EdgeInsets.only(left: 15.0, right: 27.0, top: 8),
                  child: Container(
                    height: 65,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: SearchableDropdown(
                      hint: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Text("Select City"),
                      ),
                      iconSize: 20,
                      displayClearIcon: true,
                      underline: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white)),
                      ),
                      items: propertyController.getProperty.value.states.values
                          .map((e) {
                        return DropdownMenuItem(
                          child: Text(e.stateName),
                          value: e.stateName,
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
              },
            ),
            SizedBox(
              height: 8,
            ),
            Obx(
                  () {
                if (propertyController.loading.value) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Padding(
                  padding:
                  const EdgeInsets.only(top: 10.0, left: 15, right: 25),
                  child: Container(
                    height: 65,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        underline: Container(
                          height: 1,
                          color: Colors.transparent,
                        ),
                        iconSize: 30,
                        isExpanded: true,
                        style: TextStyle(color: Colors.black),
                        hint: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            " Select Area",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        items: propertyController
                            .getProperty.value.cities.values
                            .map((e) {
                          return DropdownMenuItem(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0.0),
                              child: Container(
                                child: ListTile(
                                  title: Text(e.cityName),
                                ),
                              ),
                            ),
                            value: e.cityName,
                          );
                        }).toList(),
                        value: selectArea,
                        onChanged: (text) {
                          setState(() {
                            selectArea = text;
                          });
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 13,
            ),
            Divider(
              color: Colors.grey,
            ),

            SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 0.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.home,
                          color: Colors.green[800],
                          size: 25,
                        ),
                        SizedBox(width: 7),
                        Text(
                          "Property Types",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                  Obx(
                        () {
                      if (propertyController.loading.value) {
                        return Center(
                          child: SpinKitCircle(
                            color: Colors.green[800],
                            size: 40,
                          ),
                        );
                      }
                      return Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            primary: false,
                            itemCount: propertyController.propertyList.length,
                            itemBuilder: (_, index) {
                              var aparetMent =
                              propertyController.propertyList[index];
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    currentSelectedValueProperty = aparetMent;
                                    if (selected == index) {
                                      selected = -1;
                                    } else {
                                      selected = index;
                                    }
                                    print(
                                        "Property....${currentSelectedValueProperty}");
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.all(10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: selected == index
                                          ? Colors.green[800]
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      shape: BoxShape.rectangle),
                                  child: Text(
                                    aparetMent,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),

            Divider(
              color: Colors.grey,
            ),

            // Rooms...

            SizedBox(
              height: 8,
            ),

            //BathRooms..
            Padding(
              padding: const EdgeInsets.only(left: 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.hotel,
                          color: Colors.green[800],
                          size: 25,
                        ),
                        SizedBox(width: 7),
                        Text(
                          "Rooms",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                  Obx(
                        () {
                      if (propertyController.loading.value) {
                        return Center(
                          child: SpinKitCircle(
                            color: Colors.green[800],
                            size: 40,
                          ),
                        );
                      }
                      return Padding(
                        padding: const EdgeInsets.only(left: 2.0, top: 10),
                        child: Container(
                          height: 50,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            primary: false,
                            itemCount: propertyController.roomList.length,
                            itemBuilder: (_, index) {
                              var room = propertyController.roomList[index];
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    if (selected1 == index) {
                                      selected1 = -1;
                                    } else {
                                      selected1 = index;
                                    }
                                    currentSelectedValueRoom = room;
                                    print("Room ${currentSelectedValueRoom}");
                                    print("Room  ${room}");
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 14.0, left: 14),
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: selected1 == index
                                          ? Colors.green[800]
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: Text(
                                      room,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            // Rooms...
            Divider(
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.hotel,
                          color: Colors.green[800],
                          size: 25,
                        ),
                        SizedBox(width: 7),
                        Text(
                          "Bathrooms",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                  Obx(
                        () {
                      if (propertyController.loading.value) {
                        return Center(
                          child: SpinKitCircle(
                            color: Colors.green[800],
                            size: 40,
                          ),
                        );
                      }
                      return Padding(
                        padding: const EdgeInsets.only(left: 2.0, top: 10),
                        child: Container(
                          height: 50,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            primary: false,
                            itemCount: propertyController.bathRooms.length,
                            itemBuilder: (_, index) {
                              var bath = propertyController.bathRooms[index];
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    if (selected2 == index) {
                                      selected2 = -1;
                                    } else {
                                      selected2 = index;
                                    }
                                    currentSelectedValueBathroom = bath;
                                    print(
                                        "BathRooms ${currentSelectedValueBathroom}");
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 14.0, left: 14),
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: selected2 == index
                                            ? Colors.green[800]
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        shape: BoxShape.rectangle),
                                    child: Text(
                                      bath,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: 12,
            ),
            // Rooms...
            Padding(
              padding: const EdgeInsets.only(left: 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.hotel,
                          color: Colors.green[800],
                          size: 25,
                        ),
                        SizedBox(width: 7),
                        Text(
                          "Car Space",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                  Obx(
                        () {
                      if (propertyController.loading.value) {
                        return Center(
                          child: SpinKitCircle(
                            color: Colors.green[800],
                            size: 40,
                          ),
                        );
                      }
                      return Padding(
                        padding: const EdgeInsets.only(left: 2.0, top: 10),
                        child: Container(
                          height: 50,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            primary: false,
                            itemCount: propertyController.carSpace.length,
                            itemBuilder: (_, index) {
                              var car = propertyController.carSpace[index];
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    if (selected3 == index) {
                                      selected3 = -1;
                                    } else {
                                      selected3 = index;
                                    }
                                    currentSelectedValueCar = car;
                                    print("CAR....${currentSelectedValueCar}");
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 14.0, left: 14),
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: selected3 == index
                                            ? Colors.green[800]
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        shape: BoxShape.rectangle),
                                    child: Text(
                                      car,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 8,
            ),
            Divider(
              color: Colors.grey,
            ),
            // currentSelectedValueRent == propertyRent
            //     ?
            // Container(
            //   // height: 470,
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //         image: AssetImage('assets/images/hero.jpeg'),
            //         fit: BoxFit.cover),
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.only(top: 28.0, bottom: 30),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: <Widget>[
            //         Padding(
            //           padding: const EdgeInsets.only(left: 30.0, bottom: 5),
            //           child: Wrap(
            //             children: [
            //               RaisedButton(
            //                 color: currentSelectedValueRent == propertyRent
            //                     ? Colors.black
            //                     : Colors.red,
            //                 onPressed: () {
            //                   setState(() {
            //                     currentSelectedValueRent = propertyRent;
            //                   });
            //                 },
            //                 child: Text(
            //                   "Rent",
            //                   style: TextStyle(
            //                       fontSize: 16, color: Colors.white),
            //                 ),
            //               ),
            //               SizedBox(
            //                 width: 10,
            //               ),
            //               RaisedButton(
            //                 color: currentSelectedValueRent == propertyBuy
            //                     ? Colors.black
            //                     : Colors.red,
            //                 onPressed: () {
            //                   setState(
            //                         () {
            //                       currentSelectedValueRent = propertyBuy;
            //                     },
            //                   );
            //                 },
            //                 child: Text(
            //                   "Buy",
            //                   style: TextStyle(
            //                       fontSize: 16, color: Colors.white),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.only(left: 20.0, right: 20),
            //           child: Container(
            //             // height: 360,
            //             // width: double.infinity,
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(5),
            //               color: Colors.black,
            //             ),
            //             child: Column(
            //               children: [
            //                 Obx(() {
            //                   return Padding(
            //                     padding: const EdgeInsets.only(
            //                         left: 23.0, right: 23.0, top: 18),
            //                     child: Container(
            //                       height: 70,
            //                       decoration: BoxDecoration(
            //                           borderRadius: BorderRadius.circular(5),
            //                           color: Colors.white),
            //                       child: SearchableDropdown(
            //                         hint: Padding(
            //                           padding: const EdgeInsets.all(13.0),
            //                           child: Text("Select City"),
            //                         ),
            //                         iconSize: 20,
            //                         displayClearIcon: true,
            //                         underline: Container(
            //                           decoration: BoxDecoration(
            //                               border: Border.all(
            //                                   color: Colors.white)),
            //                         ),
            //                         items: propertyController
            //                             .getProperty.value.states.values
            //                             .map((e) {
            //                           return DropdownMenuItem(
            //                             child: Text(e.stateName),
            //                             value: e.stateName,
            //                           );
            //                         }).toList(),
            //                         value: selectedCity,
            //                         onChanged: (value) {
            //                           setState(() {
            //                             selectedCity = value;
            //                           });
            //                         },
            //                         isExpanded: true,
            //                       ),
            //                     ),
            //                   );
            //                 }),
            //
            //                 ///Pending......
            //
            //                 Obx(
            //                       () {
            //                     if (propertyController.loading.value) {
            //                       return Center(
            //                         child: CircularProgressIndicator(),
            //                       );
            //                     }
            //                     return Padding(
            //                       padding: const EdgeInsets.only(
            //                           top: 10.0, left: 25, right: 25),
            //                       child: Container(
            //                         height: 70,
            //                         decoration: BoxDecoration(
            //                           color: Colors.white,
            //                         ),
            //                         child: DropdownButtonHideUnderline(
            //                           child: DropdownButton(
            //                             underline: Container(
            //                               height: 1,
            //                               color: Colors.transparent,
            //                             ),
            //                             iconSize: 30,
            //                             isExpanded: true,
            //                             style: TextStyle(color: Colors.black),
            //                             hint: Padding(
            //                               padding: const EdgeInsets.only(
            //                                   left: 10.0),
            //                               child: Text(
            //                                 " Select Area",
            //                                 style: TextStyle(
            //                                     color: Colors.black),
            //                               ),
            //                             ),
            //                             items: propertyController
            //                                 .getProperty.value.cities.values
            //                                 .map((e) {
            //                               return DropdownMenuItem(
            //                                 child: Padding(
            //                                   padding: const EdgeInsets.only(
            //                                       left: 0.0),
            //                                   child: Container(
            //                                     child: ListTile(
            //                                       title: Text(e.cityName),
            //                                     ),
            //                                   ),
            //                                 ),
            //                                 value: e.cityName,
            //                               );
            //                             }).toList(),
            //                             value: selectArea,
            //                             onChanged: (text) {
            //                               setState(() {
            //                                 selectArea = text;
            //                               });
            //                             },
            //                           ),
            //                         ),
            //                       ),
            //                     );
            //                   },
            //                 ),
            //
            //                 //  Area ////////
            //
            //                 Obx(
            //                       () {
            //                     if (propertyController.loading.value) {
            //                       return Center(
            //                         child: SpinKitChasingDots(
            //                           color: Colors.red,
            //                           size: 50.0,
            //                         ),
            //                       );
            //                     }
            //                     return Padding(
            //                       padding: const EdgeInsets.only(
            //                           top: 10.0, left: 25, right: 25),
            //                       child: Container(
            //                         height: 70,
            //                         decoration: BoxDecoration(
            //                           color: Colors.white,
            //                         ),
            //                         child: DropdownButtonHideUnderline(
            //                           child: DropdownButton(
            //                             iconSize: 35,
            //                             isExpanded: true,
            //                             style: TextStyle(color: Colors.black),
            //                             hint: Padding(
            //                               padding: const EdgeInsets.only(
            //                                   left: 10.0),
            //                               child: Text(
            //                                 " Select Property Type",
            //                                 style: TextStyle(
            //                                     color: Colors.black),
            //                               ),
            //                             ),
            //                             items: propertyController.propertyList
            //                                 .map((element) {
            //                               return DropdownMenuItem(
            //                                 value: element,
            //                                 child: Padding(
            //                                   padding: const EdgeInsets.only(
            //                                       left: 17.0),
            //                                   child: Text(
            //                                     element,
            //                                     style: TextStyle(
            //                                         color: Colors.black),
            //                                   ),
            //                                 ),
            //                               );
            //                             }).toList(),
            //                             value: selectProperty,
            //                             onChanged: (text) {
            //                               setState(() {
            //                                 selectProperty = text;
            //                               });
            //                             },
            //                           ),
            //                         ),
            //                       ),
            //                     );
            //                   },
            //                 ),
            //                 SizedBox(
            //                   height: 15,
            //                 ),
            //
            //                 Padding(
            //                   padding: const EdgeInsets.only(
            //                       left: 28.0, right: 28),
            //                   child: Container(
            //                     height: 50,
            //                     width: double.infinity,
            //                     child: ElevatedButton(
            //                       onPressed: () {
            //                         searchController.getSaerchDataCalling(
            //                           currentSelectedValueRent,
            //                           selectedCity,
            //                           selectArea,
            //                           selectProperty,
            //                           selectedCarSpace,
            //                           selectBathRooms,
            //                           selectedRoom,
            //                         );
            //                         // searchController.searchService.fetchSearchData(
            //                         //   buycat_id,
            //                         //   selectedCity,
            //                         //   selectArea,
            //                         //   selectProperty,
            //                         //   selectedCarSpace,
            //                         //   selectBathRooms,
            //                         //   selectedRoom,
            //                         //
            //                         //
            //                         //
            //                         // );
            //                         Get.to(SearchScreen(),
            //                             transition: Transition.zoom);
            //                       },
            //                       style: ButtonStyle(
            //                         backgroundColor:
            //                         MaterialStateProperty.all<Color>(
            //                             Colors.red),
            //                       ),
            //                       child: Text(
            //                         "Search",
            //                         style: TextStyle(fontSize: 20),
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //
            //                 SizedBox(
            //                   height: 10,
            //                 ),
            //                 Row(
            //                   children: [
            //                     InkWell(
            //                       onTap: () {
            //                         setState(() {
            //                           isVisible = !isVisible;
            //                         });
            //                       },
            //                       child: Row(
            //                         children: [
            //                           Padding(
            //                             padding:
            //                             const EdgeInsets.only(left: 30.0),
            //                             child: Text(
            //                               "Advance Search",
            //                               style: TextStyle(
            //                                   fontSize: 15,
            //                                   color: Colors.white),
            //                             ),
            //                           ),
            //                           Icon(
            //                             isVisible
            //                                 ? Icons
            //                                 .keyboard_arrow_down_rounded
            //                                 : Icons
            //                                 .keyboard_arrow_up_outlined,
            //                             color: Colors.white,
            //                           ),
            //                           // Spacer(),
            //                           // Padding(
            //                           //   padding: const EdgeInsets.only(right: 30.0),
            //                           //   child: Text(
            //                           //     "Reset Search",
            //                           //     style: TextStyle(
            //                           //         fontSize: 14, color: Colors.white),
            //                           //   ),
            //                           // ),
            //                         ],
            //                       ),
            //                     ),
            //                     SizedBox(
            //                       width: 30,
            //                     ),
            //                     TextButton(
            //                       onPressed: () {
            //                         setState(() {
            //                           selectedCity = null;
            //                           selectArea = null;
            //                           selectProperty = null;
            //                           selectedRoom = null;
            //                           selectBathRooms = null;
            //                           selectedCarSpace = null;
            //                         });
            //                       },
            //                       child: Text(
            //                         "Reset Search",
            //                         style: TextStyle(
            //                             fontSize: 15, color: Colors.white),
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //                 SizedBox(
            //                   height: 10,
            //                 ),
            //                 Visibility(
            //                   visible: isVisible,
            //                   child: Column(
            //                     children: [
            //                       //Rooms......Advance Search......
            //                       Obx(
            //                             () {
            //                           if (propertyController.loading.value) {
            //                             return Center(
            //                               child: SpinKitChasingDots(
            //                                 color: Colors.red,
            //                                 size: 50.0,
            //                               ),
            //                             );
            //                           }
            //                           return Padding(
            //                             padding: const EdgeInsets.only(
            //                                 top: 10.0, left: 25, right: 25),
            //                             child: Container(
            //                               height: 70,
            //                               decoration: BoxDecoration(
            //                                 color: Colors.white,
            //                               ),
            //                               child: DropdownButtonHideUnderline(
            //                                 child: DropdownButton(
            //                                   isExpanded: true,
            //                                   style: TextStyle(
            //                                       color: Colors.black),
            //                                   hint: Padding(
            //                                     padding:
            //                                     const EdgeInsets.only(
            //                                         left: 12.0),
            //                                     child: Text(
            //                                       "Rooms",
            //                                       style: TextStyle(
            //                                           color: Colors.black),
            //                                     ),
            //                                   ),
            //                                   items: propertyController
            //                                       .roomList
            //                                       .map((element) {
            //                                     return DropdownMenuItem(
            //                                       value: element,
            //                                       child: Padding(
            //                                         padding:
            //                                         const EdgeInsets.only(
            //                                             left: 13.0),
            //                                         child: Text(
            //                                           element,
            //                                           style: TextStyle(
            //                                               color:
            //                                               Colors.black),
            //                                         ),
            //                                       ),
            //                                     );
            //                                   }).toList(),
            //                                   value: selectedRoom,
            //                                   onChanged: (text) {
            //                                     setState(() {
            //                                       selectedRoom = text;
            //                                     });
            //                                   },
            //                                 ),
            //                               ),
            //                             ),
            //                           );
            //                         },
            //                       ),
            //                       Obx(
            //                             () {
            //                           if (propertyController.loading.value) {
            //                             return Center(
            //                               child: SpinKitChasingDots(
            //                                 color: Colors.red,
            //                                 size: 50.0,
            //                               ),
            //                             );
            //                           }
            //                           return Padding(
            //                             padding: const EdgeInsets.only(
            //                                 top: 10.0, left: 25, right: 25),
            //                             child: Container(
            //                               height: 70,
            //                               decoration: BoxDecoration(
            //                                 color: Colors.white,
            //                               ),
            //                               child: DropdownButtonHideUnderline(
            //                                 child: DropdownButton(
            //                                   isExpanded: true,
            //                                   style: TextStyle(
            //                                       color: Colors.black),
            //                                   hint: Padding(
            //                                     padding:
            //                                     const EdgeInsets.only(
            //                                         left: 12.0),
            //                                     child: Text(
            //                                       "BathRooms",
            //                                       style: TextStyle(
            //                                           color: Colors.black),
            //                                     ),
            //                                   ),
            //                                   items: propertyController
            //                                       .bathRooms
            //                                       .map((element) {
            //                                     return DropdownMenuItem(
            //                                       value: element,
            //                                       child: Padding(
            //                                         padding:
            //                                         const EdgeInsets.only(
            //                                             left: 13.0),
            //                                         child: Text(
            //                                           element,
            //                                           style: TextStyle(
            //                                               color:
            //                                               Colors.black),
            //                                         ),
            //                                       ),
            //                                     );
            //                                   }).toList(),
            //                                   value: selectBathRooms,
            //                                   onChanged: (text) {
            //                                     setState(() {
            //                                       selectBathRooms = text;
            //                                     });
            //                                   },
            //                                 ),
            //                               ),
            //                             ),
            //                           );
            //                         },
            //                       ),
            //                       Obx(
            //                             () {
            //                           if (propertyController.loading.value) {
            //                             return Center(
            //                               child: CircularProgressIndicator(),
            //                             );
            //                           }
            //                           return Padding(
            //                             padding: const EdgeInsets.only(
            //                                 top: 10.0, left: 25, right: 25),
            //                             child: Container(
            //                               height: 70,
            //                               decoration: BoxDecoration(
            //                                 color: Colors.white,
            //                               ),
            //                               child: DropdownButtonHideUnderline(
            //                                 child: DropdownButton(
            //                                   isExpanded: true,
            //                                   style: TextStyle(
            //                                       color: Colors.black),
            //                                   hint: Padding(
            //                                     padding:
            //                                     const EdgeInsets.only(
            //                                         left: 12.0),
            //                                     child: Text(
            //                                       "Car Space",
            //                                       style: TextStyle(
            //                                           color: Colors.black),
            //                                     ),
            //                                   ),
            //                                   items: propertyController
            //                                       .carSpace
            //                                       .map((element) {
            //                                     return DropdownMenuItem(
            //                                       value: element,
            //                                       child: Padding(
            //                                         padding:
            //                                         const EdgeInsets.only(
            //                                             left: 13.0),
            //                                         child: Text(
            //                                           element,
            //                                           style: TextStyle(
            //                                               color:
            //                                               Colors.black),
            //                                         ),
            //                                       ),
            //                                     );
            //                                   }).toList(),
            //                                   value: selectedCarSpace,
            //                                   onChanged: (text) {
            //                                     setState(() {
            //                                       selectedCarSpace = text;
            //                                     });
            //                                   },
            //                                 ),
            //                               ),
            //                             ),
            //                           );
            //                         },
            //                       ),
            //                       Row(
            //                         children: [
            //                           Expanded(
            //                             child: Column(
            //                               mainAxisAlignment:
            //                               MainAxisAlignment.start,
            //                               crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                               children: [
            //                                 Padding(
            //                                   padding: const EdgeInsets.only(
            //                                       left: 23.0, top: 10),
            //                                   child: Container(
            //                                     height: 70,
            //                                     width: double.infinity,
            //                                     child: TextFormField(
            //                                       keyboardType:
            //                                       TextInputType.number,
            //                                       decoration: InputDecoration(
            //                                         contentPadding:
            //                                         EdgeInsets.only(
            //                                             left: 59),
            //                                         filled: true,
            //                                         focusColor: Colors.white,
            //                                         fillColor: Colors.white,
            //                                         border:
            //                                         OutlineInputBorder(
            //                                           borderSide: BorderSide(
            //                                             color: Colors.white,
            //                                           ),
            //                                           borderRadius:
            //                                           BorderRadius
            //                                               .circular(5),
            //                                         ),
            //                                         hintText: "0",
            //                                       ),
            //                                     ),
            //                                   ),
            //                                 ),
            //                               ],
            //                             ),
            //                           ),
            //                           Expanded(
            //                             child: Padding(
            //                               padding: const EdgeInsets.only(
            //                                   right: 21, top: 10),
            //                               child: Column(
            //                                 children: [
            //                                   Padding(
            //                                     padding:
            //                                     const EdgeInsets.only(
            //                                         left: 18.0),
            //                                     child: Container(
            //                                       height: 70,
            //                                       width: double.infinity,
            //                                       child: TextFormField(
            //                                         // controller: passportTourController,
            //                                         // //     controller: _controllers3[index],
            //                                         //
            //
            //                                         decoration:
            //                                         InputDecoration(
            //                                           contentPadding:
            //                                           EdgeInsets.only(
            //                                               left: 49),
            //                                           filled: true,
            //                                           focusColor:
            //                                           Colors.white,
            //                                           fillColor: Colors.white,
            //                                           border:
            //                                           OutlineInputBorder(
            //                                             borderSide:
            //                                             BorderSide(
            //                                               color: Colors.white,
            //                                             ),
            //                                             borderRadius:
            //                                             BorderRadius
            //                                                 .circular(5),
            //                                           ),
            //                                           hintText: "100",
            //                                         ),
            //                                       ),
            //                                     ),
            //                                   ),
            //                                 ],
            //                               ),
            //                             ),
            //                           ),
            //                         ],
            //                       ),
            //                       SizedBox(
            //                         height: 20,
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // )
            //     : Container(
            //   // height: 470,
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //         image: AssetImage('assets/images/hero.jpeg'),
            //         fit: BoxFit.cover),
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.only(top: 28.0, bottom: 30),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: <Widget>[
            //         Padding(
            //           padding: const EdgeInsets.only(left: 30.0, bottom: 5),
            //           child: Wrap(
            //             children: [
            //               RaisedButton(
            //                 color: currentSelectedValueRent == propertyRent
            //                     ? Colors.black
            //                     : Colors.red,
            //                 onPressed: () {
            //                   setState(() {
            //                     currentSelectedValueRent = propertyRent;
            //                   });
            //                 },
            //                 child: Text(
            //                   "Rent",
            //                   style: TextStyle(
            //                       fontSize: 16, color: Colors.white),
            //                 ),
            //               ),
            //               SizedBox(
            //                 width: 10,
            //               ),
            //               RaisedButton(
            //                 color: currentSelectedValueRent == propertyBuy
            //                     ? Colors.black
            //                     : Colors.red,
            //                 onPressed: () {
            //                   setState(
            //                         () {
            //                       currentSelectedValueRent = propertyBuy;
            //                     },
            //                   );
            //                 },
            //                 child: Text(
            //                   "Buy",
            //                   style: TextStyle(
            //                       fontSize: 16, color: Colors.white),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.only(left: 20.0, right: 20),
            //           child: Container(
            //             // height: 360,
            //             // width: double.infinity,
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(5),
            //               color: Colors.black,
            //             ),
            //             child: Column(
            //               children: [
            //                 Obx(() {
            //                   return Padding(
            //                     padding: const EdgeInsets.only(
            //                         left: 23.0, right: 23.0, top: 18),
            //                     child: Container(
            //                       height: 70,
            //                       decoration: BoxDecoration(
            //                           borderRadius: BorderRadius.circular(5),
            //                           color: Colors.white),
            //                       child: SearchableDropdown(
            //                         hint: Padding(
            //                           padding: const EdgeInsets.all(13.0),
            //                           child: Text("Select City"),
            //                         ),
            //                         iconSize: 20,
            //                         displayClearIcon: true,
            //                         underline: Container(
            //                           decoration: BoxDecoration(
            //                               border: Border.all(
            //                                   color: Colors.white)),
            //                         ),
            //                         items: propertyController
            //                             .getProperty.value.states.values
            //                             .map((e) {
            //                           return DropdownMenuItem(
            //                             child: Text(e.stateName),
            //                             value: e.stateName,
            //                           );
            //                         }).toList(),
            //                         value: selectedCity,
            //                         onChanged: (value) {
            //                           setState(() {
            //                             selectedCity = value;
            //                           });
            //                         },
            //                         isExpanded: true,
            //                       ),
            //                     ),
            //                   );
            //                 }),
            //
            //                 ///Pending......
            //
            //                 Obx(
            //                       () {
            //                     if (propertyController.loading.value) {
            //                       return Center(
            //                         child: CircularProgressIndicator(),
            //                       );
            //                     }
            //                     return Padding(
            //                       padding: const EdgeInsets.only(
            //                           top: 10.0, left: 25, right: 25),
            //                       child: Container(
            //                         height: 70,
            //                         decoration: BoxDecoration(
            //                           color: Colors.white,
            //                         ),
            //                         child: DropdownButtonHideUnderline(
            //                           child: DropdownButton(
            //                             underline: Container(
            //                               height: 1,
            //                               color: Colors.transparent,
            //                             ),
            //                             iconSize: 30,
            //                             isExpanded: true,
            //                             style: TextStyle(color: Colors.black),
            //                             hint: Padding(
            //                               padding: const EdgeInsets.only(
            //                                   left: 10.0),
            //                               child: Text(
            //                                 " Select Area",
            //                                 style: TextStyle(
            //                                     color: Colors.black),
            //                               ),
            //                             ),
            //                             items: propertyController
            //                                 .getProperty.value.cities.values
            //                                 .map((e) {
            //                               return DropdownMenuItem(
            //                                 child: Padding(
            //                                   padding: const EdgeInsets.only(
            //                                       left: 0.0),
            //                                   child: Container(
            //                                     child: ListTile(
            //                                       title: Text(e.cityName),
            //                                     ),
            //                                   ),
            //                                 ),
            //                                 value: e.cityName,
            //                               );
            //                             }).toList(),
            //                             value: selectArea,
            //                             onChanged: (text) {
            //                               setState(() {
            //                                 selectArea = text;
            //                               });
            //                             },
            //                           ),
            //                         ),
            //                       ),
            //                     );
            //                   },
            //                 ),
            //
            //                 //  Area ////////
            //
            //                 Obx(
            //                       () {
            //                     if (propertyController.loading.value) {
            //                       return Center(
            //                         child: SpinKitChasingDots(
            //                           color: Colors.red,
            //                           size: 50.0,
            //                         ),
            //                       );
            //                     }
            //                     return Padding(
            //                       padding: const EdgeInsets.only(
            //                           top: 10.0, left: 25, right: 25),
            //                       child: Container(
            //                         height: 70,
            //                         decoration: BoxDecoration(
            //                           color: Colors.white,
            //                         ),
            //                         child: DropdownButtonHideUnderline(
            //                           child: DropdownButton(
            //                             iconSize: 35,
            //                             isExpanded: true,
            //                             style: TextStyle(color: Colors.black),
            //                             hint: Padding(
            //                               padding: const EdgeInsets.only(
            //                                   left: 10.0),
            //                               child: Text(
            //                                 " Select Property Type",
            //                                 style: TextStyle(
            //                                     color: Colors.black),
            //                               ),
            //                             ),
            //                             items: propertyController.propertyList
            //                                 .map((element) {
            //                               return DropdownMenuItem(
            //                                 value: element,
            //                                 child: Padding(
            //                                   padding: const EdgeInsets.only(
            //                                       left: 17.0),
            //                                   child: Text(
            //                                     element,
            //                                     style: TextStyle(
            //                                         color: Colors.black),
            //                                   ),
            //                                 ),
            //                               );
            //                             }).toList(),
            //                             value: selectProperty,
            //                             onChanged: (text) {
            //                               setState(() {
            //                                 selectProperty = text;
            //                               });
            //                             },
            //                           ),
            //                         ),
            //                       ),
            //                     );
            //                   },
            //                 ),
            //                 SizedBox(
            //                   height: 15,
            //                 ),
            //
            //                 Padding(
            //                   padding: const EdgeInsets.only(
            //                       left: 28.0, right: 28),
            //                   child: Container(
            //                     height: 50,
            //                     width: double.infinity,
            //                     child: ElevatedButton(
            //                       onPressed: () {
            //                         searchController.getSaerchDataCalling(
            //                           propertyBuy,
            //                           selectedCity,
            //                           selectArea,
            //                           selectProperty,
            //                           selectedCarSpace,
            //                           selectBathRooms,
            //                           selectedRoom,
            //                         );
            //                         // searchController.searchService.fetchSearchData(
            //                         //   buycat_id,
            //                         //   selectedCity,
            //                         //   selectArea,
            //                         //   selectProperty,
            //                         //   selectedCarSpace,
            //                         //   selectBathRooms,
            //                         //   selectedRoom,
            //                         //
            //                         //
            //                         //
            //                         // );
            //                         Get.to(SearchScreen(),
            //                             transition: Transition.zoom);
            //                       },
            //                       style: ButtonStyle(
            //                         backgroundColor:
            //                         MaterialStateProperty.all<Color>(
            //                             Colors.red),
            //                       ),
            //                       child: Text(
            //                         "Search",
            //                         style: TextStyle(fontSize: 20),
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //
            //                 SizedBox(
            //                   height: 10,
            //                 ),
            //                 Row(
            //                   children: [
            //                     InkWell(
            //                       onTap: () {
            //                         setState(() {
            //                           isVisible = !isVisible;
            //                         });
            //                       },
            //                       child: Row(
            //                         children: [
            //                           Padding(
            //                             padding:
            //                             const EdgeInsets.only(left: 30.0),
            //                             child: Text(
            //                               "Advance Search",
            //                               style: TextStyle(
            //                                   fontSize: 15,
            //                                   color: Colors.white),
            //                             ),
            //                           ),
            //                           Icon(
            //                             isVisible
            //                                 ? Icons
            //                                 .keyboard_arrow_down_rounded
            //                                 : Icons
            //                                 .keyboard_arrow_up_outlined,
            //                             color: Colors.white,
            //                           ),
            //                           // Spacer(),
            //                           // Padding(
            //                           //   padding: const EdgeInsets.only(right: 30.0),
            //                           //   child: Text(
            //                           //     "Reset Search",
            //                           //     style: TextStyle(
            //                           //         fontSize: 14, color: Colors.white),
            //                           //   ),
            //                           // ),
            //                         ],
            //                       ),
            //                     ),
            //                     SizedBox(
            //                       width: 30,
            //                     ),
            //                     TextButton(
            //                       onPressed: () {
            //                         // setState(() {
            //                         //   // selectArea = '';
            //                         //   // selectProperty = '';
            //                         //   // selectBathRooms = '';
            //                         //   // selectedCarSpace = '';
            //                         //   // selectedRoom = '';
            //                         //   // selectedValue = '';
            //                         // });
            //                       },
            //                       child: Text(
            //                         "Reset Search",
            //                         style: TextStyle(
            //                             fontSize: 15, color: Colors.white),
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //                 SizedBox(
            //                   height: 10,
            //                 ),
            //                 Visibility(
            //                   visible: isVisible,
            //                   child: Column(
            //                     children: [
            //                       //Rooms......Advance Search......
            //                       Obx(
            //                             () {
            //                           if (propertyController.loading.value) {
            //                             return Center(
            //                               child: SpinKitChasingDots(
            //                                 color: Colors.red,
            //                                 size: 50.0,
            //                               ),
            //                             );
            //                           }
            //                           return Padding(
            //                             padding: const EdgeInsets.only(
            //                                 top: 10.0, left: 25, right: 25),
            //                             child: Container(
            //                               height: 70,
            //                               decoration: BoxDecoration(
            //                                 color: Colors.white,
            //                               ),
            //                               child: DropdownButtonHideUnderline(
            //                                 child: DropdownButton(
            //                                   isExpanded: true,
            //                                   style: TextStyle(
            //                                       color: Colors.black),
            //                                   hint: Padding(
            //                                     padding:
            //                                     const EdgeInsets.only(
            //                                         left: 12.0),
            //                                     child: Text(
            //                                       "Rooms",
            //                                       style: TextStyle(
            //                                           color: Colors.black),
            //                                     ),
            //                                   ),
            //                                   items: propertyController
            //                                       .roomList
            //                                       .map((element) {
            //                                     return DropdownMenuItem(
            //                                       value: element,
            //                                       child: Padding(
            //                                         padding:
            //                                         const EdgeInsets.only(
            //                                             left: 13.0),
            //                                         child: Text(
            //                                           element,
            //                                           style: TextStyle(
            //                                               color:
            //                                               Colors.black),
            //                                         ),
            //                                       ),
            //                                     );
            //                                   }).toList(),
            //                                   value: selectedRoom,
            //                                   onChanged: (text) {
            //                                     setState(() {
            //                                       selectedRoom = text;
            //                                     });
            //                                   },
            //                                 ),
            //                               ),
            //                             ),
            //                           );
            //                         },
            //                       ),
            //                       Obx(
            //                             () {
            //                           if (propertyController.loading.value) {
            //                             return Center(
            //                               child: SpinKitChasingDots(
            //                                 color: Colors.red,
            //                                 size: 50.0,
            //                               ),
            //                             );
            //                           }
            //                           return Padding(
            //                             padding: const EdgeInsets.only(
            //                                 top: 10.0, left: 25, right: 25),
            //                             child: Container(
            //                               height: 70,
            //                               decoration: BoxDecoration(
            //                                 color: Colors.white,
            //                               ),
            //                               child: DropdownButtonHideUnderline(
            //                                 child: DropdownButton(
            //                                   isExpanded: true,
            //                                   style: TextStyle(
            //                                       color: Colors.black),
            //                                   hint: Padding(
            //                                     padding:
            //                                     const EdgeInsets.only(
            //                                         left: 12.0),
            //                                     child: Text(
            //                                       "BathRooms",
            //                                       style: TextStyle(
            //                                           color: Colors.black),
            //                                     ),
            //                                   ),
            //                                   items: propertyController
            //                                       .bathRooms
            //                                       .map((element) {
            //                                     return DropdownMenuItem(
            //                                       value: element,
            //                                       child: Padding(
            //                                         padding:
            //                                         const EdgeInsets.only(
            //                                             left: 13.0),
            //                                         child: Text(
            //                                           element,
            //                                           style: TextStyle(
            //                                               color:
            //                                               Colors.black),
            //                                         ),
            //                                       ),
            //                                     );
            //                                   }).toList(),
            //                                   value: selectBathRooms,
            //                                   onChanged: (text) {
            //                                     setState(() {
            //                                       selectBathRooms = text;
            //                                     });
            //                                   },
            //                                 ),
            //                               ),
            //                             ),
            //                           );
            //                         },
            //                       ),
            //                       Obx(
            //                             () {
            //                           if (propertyController.loading.value) {
            //                             return Center(
            //                               child: CircularProgressIndicator(),
            //                             );
            //                           }
            //                           return Padding(
            //                             padding: const EdgeInsets.only(
            //                                 top: 10.0, left: 25, right: 25),
            //                             child: Container(
            //                               height: 70,
            //                               decoration: BoxDecoration(
            //                                 color: Colors.white,
            //                               ),
            //                               child: DropdownButtonHideUnderline(
            //                                 child: DropdownButton(
            //                                   isExpanded: true,
            //                                   style: TextStyle(
            //                                       color: Colors.black),
            //                                   hint: Padding(
            //                                     padding:
            //                                     const EdgeInsets.only(
            //                                         left: 12.0),
            //                                     child: Text(
            //                                       "Car Space",
            //                                       style: TextStyle(
            //                                           color: Colors.black),
            //                                     ),
            //                                   ),
            //                                   items: propertyController
            //                                       .carSpace
            //                                       .map((element) {
            //                                     return DropdownMenuItem(
            //                                       value: element,
            //                                       child: Padding(
            //                                         padding:
            //                                         const EdgeInsets.only(
            //                                             left: 13.0),
            //                                         child: Text(
            //                                           element,
            //                                           style: TextStyle(
            //                                               color:
            //                                               Colors.black),
            //                                         ),
            //                                       ),
            //                                     );
            //                                   }).toList(),
            //                                   value: selectedCarSpace,
            //                                   onChanged: (text) {
            //                                     setState(() {
            //                                       selectedCarSpace = text;
            //                                     });
            //                                   },
            //                                 ),
            //                               ),
            //                             ),
            //                           );
            //                         },
            //                       ),
            //                       Row(
            //                         children: [
            //                           Expanded(
            //                             child: Column(
            //                               mainAxisAlignment:
            //                               MainAxisAlignment.start,
            //                               crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                               children: [
            //                                 Padding(
            //                                   padding: const EdgeInsets.only(
            //                                       left: 23.0, top: 10),
            //                                   child: Container(
            //                                     height: 70,
            //                                     width: double.infinity,
            //                                     child: TextFormField(
            //                                       keyboardType:
            //                                       TextInputType.number,
            //                                       decoration: InputDecoration(
            //                                         contentPadding:
            //                                         EdgeInsets.only(
            //                                             left: 59),
            //                                         filled: true,
            //                                         focusColor: Colors.white,
            //                                         fillColor: Colors.white,
            //                                         border:
            //                                         OutlineInputBorder(
            //                                           borderSide: BorderSide(
            //                                             color: Colors.white,
            //                                           ),
            //                                           borderRadius:
            //                                           BorderRadius
            //                                               .circular(5),
            //                                         ),
            //                                         hintText: "0",
            //                                       ),
            //                                     ),
            //                                   ),
            //                                 ),
            //                               ],
            //                             ),
            //                           ),
            //                           Expanded(
            //                             child: Padding(
            //                               padding: const EdgeInsets.only(
            //                                   right: 21, top: 10),
            //                               child: Column(
            //                                 children: [
            //                                   Padding(
            //                                     padding:
            //                                     const EdgeInsets.only(
            //                                         left: 18.0),
            //                                     child: Container(
            //                                       height: 70,
            //                                       width: double.infinity,
            //                                       child: TextFormField(
            //                                         // controller: passportTourController,
            //                                         // //     controller: _controllers3[index],
            //                                         //
            //
            //                                         decoration:
            //                                         InputDecoration(
            //                                           contentPadding:
            //                                           EdgeInsets.only(
            //                                               left: 49),
            //                                           filled: true,
            //                                           focusColor:
            //                                           Colors.white,
            //                                           fillColor: Colors.white,
            //                                           border:
            //                                           OutlineInputBorder(
            //                                             borderSide:
            //                                             BorderSide(
            //                                               color: Colors.white,
            //                                             ),
            //                                             borderRadius:
            //                                             BorderRadius
            //                                                 .circular(5),
            //                                           ),
            //                                           hintText: "100",
            //                                         ),
            //                                       ),
            //                                     ),
            //                                   ),
            //                                 ],
            //                               ),
            //                             ),
            //                           ),
            //                         ],
            //                       ),
            //                       SizedBox(
            //                         height: 20,
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 24,
            ),



            SizedBox(
              height: 24,
            ),
          ],
        ),
      )
    );
  }
}

