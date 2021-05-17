import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:suuq_somali/car/car_feature_details.dart';
import 'package:suuq_somali/controller/car_controller.dart';
import 'package:suuq_somali/models/car_model.dart';
import 'package:suuq_somali/utils/app_theme.dart';

import 'car_search_controller.dart';

class CarPage extends StatefulWidget {
  @override
  _CarPageState createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> {
  final carController = Get.put(CarController());
  final carSaerchController = Get.put(CarSearchController());
  bool isVisible = false;
  String selectedCarBrand;
  String selectedColor;
  String transmission;
  String selectedValueArea;
  AutoCompleteTextField autoCompleteTextField;
  GlobalKey<AutoCompleteTextFieldState<City>> key = new GlobalKey();
  DateTime selectedDate;
  String buyACar = "176";
  String rentACar = "175";
  var currentSelectedByaCar = "176";

  DateTime convertTimeStampToDateTime(int timeStamp) {
    var dateToTimeStamp = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    return dateToTimeStamp;
  }

  String convertTimeStampToHumanDate(int timeStamp) {
    var dateToTimeStamp = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    return DateFormat('M').format(dateToTimeStamp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#ededed"),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: HexColor("#dc3545"),
        elevation: 1,
        centerTitle: true,
        title: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Text(
              "Car",
              style: TextStyle(fontSize: 19, color: Colors.white),
            )),
      ),
      //   drawer: MenuScreen(),
      body: Obx(() {
        if (carController.carLoading.value) {
          return Center(
            child: SpinKitFadingCircle(
              color: Colors.red,
              size: 40.0,
            ),
          );
        }
        return ListView(
          shrinkWrap: true,
          primary: false,
          children: [
            carWidget(),
          ],
        );
      }),
    );
  }

  Widget carWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // currentSelectedByaCar== buyACar ?
        // Container(
        //   // height: 470,
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage('assets/images/car.jpg'),
        //         fit: BoxFit.cover),
        //   ),
        //   child: Padding(
        //     padding: const EdgeInsets.only(top: 28.0, bottom: 30),
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: <Widget>[
        //         Padding(
        //           padding: const EdgeInsets.only(left: 23.0, bottom: 5),
        //           child: Wrap(
        //             children: [
        //               RaisedButton(
        //                 color: currentSelectedByaCar == buyACar
        //                     ? Colors.black
        //                     : Colors.red,
        //                 onPressed: () {
        //                   setState(() {
        //                     currentSelectedByaCar = buyACar;
        //                   });
        //                 },
        //                 child: Text(
        //                   "Buy a Car",
        //                   style: TextStyle(fontSize: 16, color: Colors.white),
        //                 ),
        //               ),
        //               SizedBox(
        //                 width: 10,
        //               ),
        //               // ignore: deprecated_member_use
        //               RaisedButton(
        //                 color: currentSelectedByaCar == rentACar
        //                     ? Colors.black
        //                     : Colors.red,
        //                 onPressed: () {
        //                   setState(
        //                         () {
        //                           currentSelectedByaCar = rentACar;
        //                     },
        //                   );
        //                 },
        //                 child: Text(
        //                   "Rent a Car",
        //                   style: TextStyle(fontSize: 16, color: Colors.white),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //      Padding(
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
        //                 Padding(
        //                   padding: const EdgeInsets.only(
        //                       left: 24, right: 24, top: 23),
        //                   child: Container(
        //                     height: 70,
        //                     decoration: BoxDecoration(
        //                       color: AppTheme.getTheme().backgroundColor,
        //                       borderRadius: BorderRadius.all(
        //                         Radius.circular(0),
        //                       ),
        //                       boxShadow: <BoxShadow>[
        //                         BoxShadow(
        //                           color: AppTheme.getTheme().dividerColor,
        //                           blurRadius: 8,
        //                           offset: Offset(4, 4),
        //                         ),
        //                       ],
        //                     ),
        //                     child: Padding(
        //                       padding: const EdgeInsets.only(
        //                           left: 1, right: 16, top: 0),
        //                       child: Column(
        //                         children: [
        //                           //Select Car Brand......
        //                           Obx(
        //                                 () {
        //                               if (carController.carLoading.value) {
        //                                 return Center(
        //                                   child: CircularProgressIndicator(),
        //                                 );
        //                               }
        //                               return Padding(
        //                                 padding: const EdgeInsets.only(
        //                                     top: 8.0, left: 20, right: 5),
        //                                 child: Container(
        //                                   decoration: BoxDecoration(
        //                                     color: Colors.white,
        //
        //                                   ),
        //                                   child: DropdownButtonHideUnderline(
        //                                     child: DropdownButton(
        //
        //                                       isExpanded: true,
        //                                       style: TextStyle(color: Colors.black),
        //                                       hint: Padding(
        //                                         padding: const EdgeInsets.only(left:0.0),
        //                                         child: Text(
        //                                           " Select Car Brand",
        //                                           style: TextStyle(color: Colors.black),
        //                                         ),
        //                                       ),
        //                                       items: carController.carBrandList
        //                                           .map((element) {
        //                                         print("object : $element");
        //                                         return DropdownMenuItem(
        //                                           value: element,
        //                                           child: Padding(
        //                                             padding: const EdgeInsets.only(left:13.0),
        //                                             child: Text(
        //                                               element,
        //                                               style:
        //                                               TextStyle(color: Colors.black),
        //                                             ),
        //                                           ),
        //                                         );
        //                                       }).toList(),
        //                                       value: selectedCarBrand,
        //                                       onChanged: (text) {
        //                                         setState(() {
        //                                           selectedCarBrand = text;
        //                                         });
        //                                       },
        //                                     ),
        //                                   ),
        //
        //                                 ),
        //                               );
        //                             },
        //                           ),
        //
        //                           //End Car Brand.....
        //
        //                           //
        //
        //                         ],
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //
        //                 Obx(() {
        //                   return Padding(
        //                     padding: const EdgeInsets.only(
        //                         left: 23.0, right: 23.0, top: 10),
        //                     child: Container(
        //                       height: 70,
        //                       decoration: BoxDecoration(
        //                           borderRadius: BorderRadius.circular(0),
        //                           color: Colors.white),
        //                       child: SearchableDropdown(
        //                         underline: Container(
        //                           decoration: BoxDecoration(
        //                               border: Border.all(color: Colors.white)
        //                           ),
        //                         ),
        //                         items: carController
        //                             .getCar.value.cities
        //                             .map((e) {
        //                           return DropdownMenuItem(
        //                             child: Text("${e.cityName},${e.state}"),
        //                             value: e.cityName,
        //                           );
        //                         }).toList(),
        //                         value: selectedValueArea,
        //                         hint: Padding(
        //                           padding: const EdgeInsets.all(13.0),
        //                           child: Text("Enter Area"),
        //                         ),
        //                         onChanged: (value) {
        //                           setState(() {
        //                             selectedValueArea = value;
        //                           });
        //                         },
        //                         isExpanded: true,
        //                       ),
        //                     ),
        //                   );
        //                 }),
        //                 Padding(
        //                   padding: const EdgeInsets.only(
        //                       top: 10.0, left: 25, right: 25),
        //                   child: TextField(
        //                     decoration: InputDecoration(
        //                       filled: true,
        //                       focusColor: Colors.white,
        //                       fillColor: Colors.white,
        //                       border: OutlineInputBorder(
        //                         borderSide: BorderSide(
        //                           color: Colors.white,
        //                         ),
        //                         borderRadius: BorderRadius.circular(5),
        //                       ),
        //                       hintText: "Model Area",
        //                     ),
        //                   ),
        //                 ),
        //                 // Padding(
        //                 //   padding: const EdgeInsets.only(
        //                 //       top: 10.0, left: 25, right: 25),
        //                 //   child: Container(
        //                 //     height: 70,
        //                 //     child: TextField(
        //                 //       decoration: InputDecoration(
        //                 //         contentPadding: EdgeInsets.only(left: 19),
        //                 //         filled: true,
        //                 //         focusColor: Colors.white,
        //                 //         fillColor: Colors.white,
        //                 //         border: OutlineInputBorder(
        //                 //           borderSide: BorderSide(
        //                 //             color: Colors.white,
        //                 //           ),
        //                 //           borderRadius: BorderRadius.circular(5),
        //                 //         ),
        //                 //         hintText: " Model Year",
        //                 //       ),
        //                 //     ),
        //                 //   ),
        //                 // ),
        //                 SizedBox(
        //                   height: 15,
        //                 ),
        //                 Padding(
        //                   padding: const EdgeInsets.only(left: 28.0, right: 28),
        //                   child: Container(
        //                     height: 50,
        //                     width: double.infinity,
        //                     child: ElevatedButton(
        //                       onPressed: () {
        //
        //                         /// Search....Data.........try
        //                         ///
        //                         ///
        //                         carSaerchController.carGetSaerchDataCalling(
        //                           buyACar,
        //                           selectedCarBrand,
        //                           "selectArea",
        //                           "selectProperty",
        //                           "selectedCarSpace",
        //                           "selectBathRooms",
        //                           "selectedRoom",
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
        //                         Get.to(CarSearchScreen(),
        //                             transition: Transition.zoom);
        //
        //                       },
        //                       style: ButtonStyle(
        //                           backgroundColor:
        //                           MaterialStateProperty.all<Color>(
        //                               Colors.red)),
        //                       child: Text(
        //                         "Search",
        //                         style: TextStyle(fontSize: 20),
        //                       ),
        //                     ),
        //                   ),
        //                 ),
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
        //                             padding: const EdgeInsets.only(left: 30.0),
        //                             child: Text(
        //                               "Advance Search",
        //                               style: TextStyle(
        //                                   fontSize: 15, color: Colors.white),
        //                             ),
        //                           ),
        //                           Icon(
        //                           isVisible ?  Icons.keyboard_arrow_down_rounded:Icons.keyboard_arrow_up,
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
        //                           setState(() {
        //                             selectedCarBrand = null;
        //                             selectedColor = null;
        //                             transmission = null;
        //                             selectedValueArea = null;
        //
        //                           });
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
        //
        //                       Obx(
        //                             () {
        //                           if (carController.carLoading.value) {
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
        //
        //                               ),
        //                               child: DropdownButtonHideUnderline(
        //                                 child: DropdownButton(
        //                                   iconSize: 35,
        //                                   icon: Icon(Icons.keyboard_arrow_down_rounded),
        //                                   isExpanded: true,
        //                                   style: TextStyle(color: Colors.black),
        //                                   hint: Padding(
        //                                     padding: const EdgeInsets.only(left:12.0),
        //                                     child: Text(
        //                                        "Color",
        //                                       style: TextStyle(color: Colors.black),
        //                                     ),
        //                                   ),
        //                                   items: carController.carColorList
        //                                       .map((element) {
        //                                     print("object : $element");
        //                                     return DropdownMenuItem(
        //                                       value: element,
        //                                       child: Padding(
        //                                         padding: const EdgeInsets.only(left:13.0),
        //                                         child: Text(
        //                                           element,
        //                                           style:
        //                                           TextStyle(color: Colors.black),
        //                                         ),
        //                                       ),
        //                                     );
        //                                   }).toList(),
        //                                   value: selectedColor,
        //                                   onChanged: (text) {
        //                                     setState(() {
        //                                       selectedColor = text;
        //                                     });
        //                                   },
        //                                 ),
        //                               ),
        //
        //                             ),
        //                           );
        //                         },
        //                       ),
        //                       Obx(
        //                             () {
        //                           if (carController.carLoading.value) {
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
        //
        //                               ),
        //                               child: DropdownButtonHideUnderline(
        //                                 child: DropdownButton(
        //                                   iconSize: 35,
        //                                   icon: Icon(Icons.keyboard_arrow_down_rounded),
        //                                   isExpanded: true,
        //                                   style: TextStyle(color: Colors.black),
        //                                   hint: Padding(
        //                                     padding: const EdgeInsets.only(left:12.0),
        //                                     child: Text(
        //                                       "Transmission",
        //                                       style: TextStyle(color: Colors.black),
        //                                     ),
        //                                   ),
        //                                   items: carController.transmissionList
        //                                       .map((element) {
        //                                     print("object : $element");
        //                                     return DropdownMenuItem(
        //                                       value: element,
        //                                       child: Padding(
        //                                         padding: const EdgeInsets.only(left:13.0),
        //                                         child: Text(
        //                                           element,
        //                                           style:
        //                                           TextStyle(color: Colors.black),
        //                                         ),
        //                                       ),
        //                                     );
        //                                   }).toList(),
        //                                   value: transmission,
        //                                   onChanged: (text) {
        //                                     setState(() {
        //                                       transmission = text;
        //                                     });
        //                                   },
        //                                 ),
        //                               ),
        //
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
        //                                       left: 25.0, top: 10),
        //                                   child: Container(
        //                                     height: 70,
        //                                     width: double.infinity,
        //                                     child: TextFormField(
        //                                       keyboardType:
        //                                       TextInputType.number,
        //                                       decoration: InputDecoration(
        //                                         contentPadding: EdgeInsets.only(left: 60),
        //                                         filled: true,
        //                                         focusColor: Colors.white,
        //                                         fillColor: Colors.white,
        //                                         border: OutlineInputBorder(
        //                                           borderSide: BorderSide(
        //                                             color: Colors.white,
        //                                           ),
        //                                           borderRadius:
        //                                           BorderRadius.circular(5),
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
        //                                   right: 29, top: 10),
        //                               child: Column(
        //                                 children: [
        //                                   Padding(
        //                                     padding: const EdgeInsets.only(
        //                                         left: 8.0),
        //                                     child: Container(
        //                                       height: 70,
        //                                       width: double.infinity,
        //                                       child: TextFormField(
        //                                         // controller: passportTourController,
        //                                         // //     controller: _controllers3[index],
        //                                         //
        //
        //                                         decoration: InputDecoration(
        //                                           contentPadding: EdgeInsets.only(left: 40),
        //                                           filled: true,
        //                                           focusColor: Colors.white,
        //                                           fillColor: Colors.white,
        //                                           border: OutlineInputBorder(
        //                                             borderSide: BorderSide(
        //                                               color: Colors.white,
        //                                             ),
        //                                             borderRadius:
        //                                             BorderRadius.circular(
        //                                                 5),
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
        //                       Padding(
        //                         padding: const EdgeInsets.only(
        //                             top: 0.0, left: 25, right: 25),
        //                         child: TextField(
        //                           decoration: InputDecoration(
        //                             filled: true,
        //                             focusColor: Colors.white,
        //                             fillColor: Colors.white,
        //                             border: OutlineInputBorder(
        //                               borderSide: BorderSide(
        //                                 color: Colors.white,
        //                               ),
        //                               borderRadius: BorderRadius.circular(5),
        //                             ),
        //                             hintText: "Milage",
        //                           ),
        //                         ),
        //                       ),
        //                       SizedBox(
        //                         height: 10,
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         )
        //
        //       ],
        //     ),
        //   ),
        // ) :
        // Container(
        //   // height: 470,
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage('assets/images/car.jpg'),
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
        //                 color: currentSelectedByaCar == buyACar
        //                     ? Colors.black
        //                     : Colors.red,
        //                 onPressed: () {
        //                   setState(() {
        //                     currentSelectedByaCar = buyACar;
        //                   });
        //                 },
        //                 child: Text(
        //                   "Buy a Car",
        //                   style: TextStyle(fontSize: 16, color: Colors.white),
        //                 ),
        //               ),
        //               SizedBox(
        //                 width: 10,
        //               ),
        //               RaisedButton(
        //                 color: currentSelectedByaCar == rentACar
        //                     ? Colors.black
        //                     : Colors.red,
        //                 onPressed: () {
        //                   setState(
        //                         () {
        //                       currentSelectedByaCar = rentACar;
        //                     },
        //                   );
        //                 },
        //                 child: Text(
        //                   "Rent a Car",
        //                   style: TextStyle(fontSize: 16, color: Colors.white),
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
        //                 Padding(
        //                   padding: const EdgeInsets.only(
        //                       left: 24, right: 24, top: 23),
        //                   child: Container(
        //                     height: 70,
        //                     decoration: BoxDecoration(
        //                       color: AppTheme.getTheme().backgroundColor,
        //                       borderRadius: BorderRadius.all(
        //                         Radius.circular(0),
        //                       ),
        //                       boxShadow: <BoxShadow>[
        //                         BoxShadow(
        //                           color: AppTheme.getTheme().dividerColor,
        //                           blurRadius: 8,
        //                           offset: Offset(4, 4),
        //                         ),
        //                       ],
        //                     ),
        //                     child: Padding(
        //                       padding: const EdgeInsets.only(
        //                           left: 1, right: 16, top: 0),
        //                       child: Column(
        //                         children: [
        //                           //Select Car Brand......
        //                           Obx(
        //                                 () {
        //                               if (carController.carLoading.value) {
        //                                 return Center(
        //                                   child: CircularProgressIndicator(),
        //                                 );
        //                               }
        //                               return Padding(
        //                                 padding: const EdgeInsets.only(
        //                                     top: 8.0, left: 20, right: 5),
        //                                 child: Container(
        //                                   decoration: BoxDecoration(
        //                                     color: Colors.white,
        //
        //                                   ),
        //                                   child: DropdownButtonHideUnderline(
        //                                     child: DropdownButton(
        //
        //                                       isExpanded: true,
        //                                       style: TextStyle(color: Colors.black),
        //                                       hint: Padding(
        //                                         padding: const EdgeInsets.only(left:0.0),
        //                                         child: Text(
        //                                           " Select Car Brand",
        //                                           style: TextStyle(color: Colors.black),
        //                                         ),
        //                                       ),
        //                                       items: carController.carBrandList
        //                                           .map((element) {
        //                                         print("object : $element");
        //                                         return DropdownMenuItem(
        //                                           value: element,
        //                                           child: Padding(
        //                                             padding: const EdgeInsets.only(left:13.0),
        //                                             child: Text(
        //                                               element,
        //                                               style:
        //                                               TextStyle(color: Colors.black),
        //                                             ),
        //                                           ),
        //                                         );
        //                                       }).toList(),
        //                                       value: selectedCarBrand,
        //                                       onChanged: (text) {
        //                                         setState(() {
        //                                           selectedCarBrand = text;
        //                                         });
        //                                       },
        //                                     ),
        //                                   ),
        //
        //                                 ),
        //                               );
        //                             },
        //                           ),
        //
        //                           //End Car Brand.....
        //
        //                           //
        //
        //                         ],
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //
        //                 Obx(() {
        //                   return Padding(
        //                     padding: const EdgeInsets.only(
        //                         left: 23.0, right: 23.0, top: 10),
        //                     child: Container(
        //                       height: 70,
        //                       decoration: BoxDecoration(
        //                           borderRadius: BorderRadius.circular(0),
        //                           color: Colors.white),
        //                       child: SearchableDropdown(
        //                         underline: Container(
        //                           decoration: BoxDecoration(
        //                               border: Border.all(color: Colors.white)
        //                           ),
        //                         ),
        //                         items: carController
        //                             .getCar.value.cities
        //                             .map((e) {
        //                           return DropdownMenuItem(
        //                             child: Text("${e.cityName},${e.state}"),
        //                             value: e.cityName,
        //                           );
        //                         }).toList(),
        //                         value: selectedValueArea,
        //                         hint: Padding(
        //                           padding: const EdgeInsets.all(13.0),
        //                           child: Text("Enter Area"),
        //                         ),
        //                         onChanged: (value) {
        //                           setState(() {
        //                             selectedValueArea = value;
        //                           });
        //                         },
        //                         isExpanded: true,
        //                       ),
        //                     ),
        //                   );
        //                 }),
        //                 Padding(
        //                   padding: const EdgeInsets.only(
        //                       top: 10.0, left: 25, right: 25),
        //                   child: TextField(
        //                     decoration: InputDecoration(
        //                       filled: true,
        //                       focusColor: Colors.white,
        //                       fillColor: Colors.white,
        //                       border: OutlineInputBorder(
        //                         borderSide: BorderSide(
        //                           color: Colors.white,
        //                         ),
        //                         borderRadius: BorderRadius.circular(5),
        //                       ),
        //                       hintText: "Model Area",
        //                     ),
        //                   ),
        //                 ),
        //                 // Padding(
        //                 //   padding: const EdgeInsets.only(
        //                 //       top: 10.0, left: 25, right: 25),
        //                 //   child: Container(
        //                 //     height: 70,
        //                 //     child: TextField(
        //                 //       decoration: InputDecoration(
        //                 //         contentPadding: EdgeInsets.only(left: 19),
        //                 //         filled: true,
        //                 //         focusColor: Colors.white,
        //                 //         fillColor: Colors.white,
        //                 //         border: OutlineInputBorder(
        //                 //           borderSide: BorderSide(
        //                 //             color: Colors.white,
        //                 //           ),
        //                 //           borderRadius: BorderRadius.circular(5),
        //                 //         ),
        //                 //         hintText: " Model Year",
        //                 //       ),
        //                 //     ),
        //                 //   ),
        //                 // ),
        //                 SizedBox(
        //                   height: 15,
        //                 ),
        //                 Padding(
        //                   padding: const EdgeInsets.only(left: 28.0, right: 28),
        //                   child: Container(
        //                     height: 50,
        //                     width: double.infinity,
        //                     child: ElevatedButton(
        //                       onPressed: () {
        //
        //                         /// Search....Data.........try
        //                         ///
        //                         ///
        //                         carSaerchController.carGetSaerchDataCalling(
        //                           buyACar,
        //                           selectedCarBrand,
        //                           "selectArea",
        //                           "selectProperty",
        //                           "selectedCarSpace",
        //                           "selectBathRooms",
        //                           "selectedRoom",
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
        //                         Get.to(CarSearchScreen(),
        //                             transition: Transition.zoom);
        //
        //                       },
        //                       style: ButtonStyle(
        //                           backgroundColor:
        //                           MaterialStateProperty.all<Color>(
        //                               Colors.red)),
        //                       child: Text(
        //                         " Search",
        //                         style: TextStyle(fontSize: 20),
        //                       ),
        //                     ),
        //                   ),
        //                 ),
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
        //                             padding: const EdgeInsets.only(left: 30.0),
        //                             child: Text(
        //                               "Advance Search",
        //                               style: TextStyle(
        //                                   fontSize: 15, color: Colors.white),
        //                             ),
        //                           ),
        //                           Icon(
        //                             isVisible ?  Icons.keyboard_arrow_down_rounded:Icons.keyboard_arrow_up,
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
        //                           setState(() {
        //                             selectedCarBrand = null;
        //                             selectedColor = null;
        //                             transmission = null;
        //                             selectedValueArea = null;
        //
        //                           });
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
        //
        //                       Obx(
        //                             () {
        //                           if (carController.carLoading.value) {
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
        //
        //                               ),
        //                               child: DropdownButtonHideUnderline(
        //                                 child: DropdownButton(
        //                                   iconSize: 35,
        //                                   icon: Icon(Icons.keyboard_arrow_down_rounded),
        //                                   isExpanded: true,
        //                                   style: TextStyle(color: Colors.black),
        //                                   hint: Padding(
        //                                     padding: const EdgeInsets.only(left:12.0),
        //                                     child: Text(
        //                                       "Color",
        //                                       style: TextStyle(color: Colors.black),
        //                                     ),
        //                                   ),
        //                                   items: carController.carColorList
        //                                       .map((element) {
        //                                     print("object : $element");
        //                                     return DropdownMenuItem(
        //                                       value: element,
        //                                       child: Padding(
        //                                         padding: const EdgeInsets.only(left:13.0),
        //                                         child: Text(
        //                                           element,
        //                                           style:
        //                                           TextStyle(color: Colors.black),
        //                                         ),
        //                                       ),
        //                                     );
        //                                   }).toList(),
        //                                   value: selectedColor,
        //                                   onChanged: (text) {
        //                                     setState(() {
        //                                       selectedColor = text;
        //                                     });
        //                                   },
        //                                 ),
        //                               ),
        //
        //                             ),
        //                           );
        //                         },
        //                       ),
        //                       Obx(
        //                             () {
        //                           if (carController.carLoading.value) {
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
        //
        //                               ),
        //                               child: DropdownButtonHideUnderline(
        //                                 child: DropdownButton(
        //                                   iconSize: 35,
        //                                   icon: Icon(Icons.keyboard_arrow_down_rounded),
        //                                   isExpanded: true,
        //                                   style: TextStyle(color: Colors.black),
        //                                   hint: Padding(
        //                                     padding: const EdgeInsets.only(left:12.0),
        //                                     child: Text(
        //                                       "Transmission",
        //                                       style: TextStyle(color: Colors.black),
        //                                     ),
        //                                   ),
        //                                   items: carController.transmissionList
        //                                       .map((element) {
        //                                     print("object : $element");
        //                                     return DropdownMenuItem(
        //                                       value: element,
        //                                       child: Padding(
        //                                         padding: const EdgeInsets.only(left:13.0),
        //                                         child: Text(
        //                                           element,
        //                                           style:
        //                                           TextStyle(color: Colors.black),
        //                                         ),
        //                                       ),
        //                                     );
        //                                   }).toList(),
        //                                   value: transmission,
        //                                   onChanged: (text) {
        //                                     setState(() {
        //                                       transmission = text;
        //                                     });
        //                                   },
        //                                 ),
        //                               ),
        //
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
        //                                       left: 25.0, top: 10),
        //                                   child: Container(
        //                                     height: 70,
        //                                     width: double.infinity,
        //                                     child: TextFormField(
        //                                       keyboardType:
        //                                       TextInputType.number,
        //                                       decoration: InputDecoration(
        //                                         contentPadding: EdgeInsets.only(left: 60),
        //                                         filled: true,
        //                                         focusColor: Colors.white,
        //                                         fillColor: Colors.white,
        //                                         border: OutlineInputBorder(
        //                                           borderSide: BorderSide(
        //                                             color: Colors.white,
        //                                           ),
        //                                           borderRadius:
        //                                           BorderRadius.circular(5),
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
        //                                   right: 29, top: 10),
        //                               child: Column(
        //                                 children: [
        //                                   Padding(
        //                                     padding: const EdgeInsets.only(
        //                                         left: 8.0),
        //                                     child: Container(
        //                                       height: 70,
        //                                       width: double.infinity,
        //                                       child: TextFormField(
        //                                         // controller: passportTourController,
        //                                         // //     controller: _controllers3[index],
        //                                         //
        //
        //                                         decoration: InputDecoration(
        //                                           contentPadding: EdgeInsets.only(left: 40),
        //                                           filled: true,
        //                                           focusColor: Colors.white,
        //                                           fillColor: Colors.white,
        //                                           border: OutlineInputBorder(
        //                                             borderSide: BorderSide(
        //                                               color: Colors.white,
        //                                             ),
        //                                             borderRadius:
        //                                             BorderRadius.circular(
        //                                                 5),
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
        //                       Padding(
        //                         padding: const EdgeInsets.only(
        //                             top: 0.0, left: 25, right: 25),
        //                         child: TextField(
        //                           decoration: InputDecoration(
        //                             filled: true,
        //                             focusColor: Colors.white,
        //                             fillColor: Colors.white,
        //                             border: OutlineInputBorder(
        //                               borderSide: BorderSide(
        //                                 color: Colors.white,
        //                               ),
        //                               borderRadius: BorderRadius.circular(5),
        //                             ),
        //                             hintText: "Milage",
        //                           ),
        //                         ),
        //                       ),
        //                       SizedBox(
        //                         height: 10,
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         )
        //
        //       ],
        //     ),
        //   ),
        // ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "${carController.getCar.value.featured.length} Car ",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  height: 36,
                  width: 50,
                  child: Icon(
                    Icons.list,
                    color: Colors.white,
                    size: 30,
                  ),
                ),

                // ignore: deprecated_member_use
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(3.0),
                    child: RaisedButton(
                      color: Colors.red,
                      onPressed: () {},
                      child: Text(
                        "Filters",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        Obx(() {
          if (carController.carLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: carController.getCar.value.featured.length,
            itemBuilder: (_, index) {
              var data = carController.getCar.value.featured[index];
              return InkWell(
                onTap: () {
                  Get.to(
                      CarFeatureDetails(
                        image: data.photoUrl,
                        title: data.listingTitle,
                        price: data.price,
                        description: data.shortDesc,
                        listingAddress: data.listingAddr,
                        catNamePropertyForBuy: "${data.catName}",
                        typeOfCar: data.customFields['27'],
                        transmission: data.customFields['29'],
                        modelYear: data.customFields['40'],
                        color: data.customFields['28'],
                        condition: data.customFields['33'],
                        milage: data.customFields['41'],
                        location: data.cityName,
                        submissionDate: data.submissionDate,
                      ),
                      transition: Transition.zoom);
                  // Get.to(
                  //     // PropertyDetails(
                  //     //   image: data.photoUrl,
                  //     //   title: data.listingTitle,
                  //     //   price: data.price,
                  //     //   description: data.shortDesc,
                  //     //   listingAddress: data.listingAddr,
                  //     //   catNamePropertyForBuy: "${data.catName}",
                  //     //   propertyType: data.customFields['32'],
                  //     //   bathrooms: data.customFields['34'],
                  //     //   buildYear: data.customFields['39'],
                  //     //   enterHouseSize: data.customFields['38'],
                  //     //   rooms: data.customFields['33'],
                  //     //   carSpace: data.customFields['37'],
                  //     // ),
                  //     transition: Transition.zoom);
                },
                child: Card(
                  elevation: 0,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                            borderRadius:
                            BorderRadius.all(Radius.circular(3.0)),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 28.0),
                              child: Image.network(
                                data.photoUrl,
                                cacheHeight: 85,
                              ),
                            )),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12.0, top: 12),
                                    child: Text("\$ ${data.price}",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 12.0, top: 5),
                                child: Text(
                                  "${data.listingAddr}",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 8.0, top: 5),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                          "${data.customFields['33'] ?? ""}  Bed"),
                                    ),
                                    Expanded(
                                      child: Text(
                                          "${data.customFields['34'] ?? ""}  Bath"),
                                    ),
                                    Expanded(
                                      child: Text(
                                          "${data.customFields['38'] ?? ""}  sqft"),
                                    ),
                                  ],
                                ),
                              )

                              // Column(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   crossAxisAlignment: CrossAxisAlignment.center,
                              //   children: [
                              //     Row(
                              //       mainAxisAlignment: MainAxisAlignment.start,
                              //       crossAxisAlignment: CrossAxisAlignment.start,
                              //       children: [
                              //         Expanded(
                              //           child: Column(
                              //             mainAxisAlignment:
                              //             MainAxisAlignment.start,
                              //             crossAxisAlignment:
                              //             CrossAxisAlignment.start,
                              //             children: [
                              //               Padding(
                              //                 padding: const EdgeInsets.only(
                              //                     left: 4.0),
                              //                 child: Row(
                              //                   mainAxisAlignment:
                              //                   MainAxisAlignment.start,
                              //                   crossAxisAlignment:
                              //                   CrossAxisAlignment.start,
                              //                   children: [
                              //                     Icon(
                              //                       Icons.person,
                              //                       color: Colors.red,
                              //                     ),
                              //                     Expanded(child: Text("${convertTimeStampToHumanDate(data.submissionDate)} months ago")),
                              //                   ],
                              //                 ),
                              //               ),
                              //               SizedBox(
                              //                 height: 4,
                              //               ),
                              //               Padding(
                              //                 padding: const EdgeInsets.only(
                              //                     left: 4.0),
                              //                 child: Row(
                              //                   mainAxisAlignment:
                              //                   MainAxisAlignment.start,
                              //                   crossAxisAlignment:
                              //                   CrossAxisAlignment.start,
                              //                   children: [
                              //                     Icon(
                              //                       Icons.tour,
                              //                       color: Colors.red,
                              //                     ),
                              //                     Padding(
                              //                       padding:
                              //                       const EdgeInsets.all(4.0),
                              //                       child: Text(
                              //                           "Beds:${data.customFields['33']?? ""}"),
                              //                     ),
                              //                   ],
                              //                 ),
                              //               ),
                              //               SizedBox(
                              //                 height: 3,
                              //               ),
                              //               Padding(
                              //                 padding: const EdgeInsets.only(
                              //                     left: 4.0),
                              //                 child: Row(
                              //                   children: [
                              //                     Icon(
                              //                       Icons.keyboard,
                              //                       color: Colors.red,
                              //                     ),
                              //                     Expanded(
                              //                       child: Text(
                              //                           " Type: ${data.customFields['32'] ?? ""}"),
                              //                     )
                              //                   ],
                              //                 ),
                              //               ),
                              //             ],
                              //           ),
                              //         ),
                              //         Expanded(
                              //           child: Padding(
                              //             padding:
                              //             const EdgeInsets.only(right: 4.0),
                              //             child: Column(
                              //               mainAxisAlignment:
                              //               MainAxisAlignment.start,
                              //               crossAxisAlignment:
                              //               CrossAxisAlignment.start,
                              //               children: [
                              //                 Row(
                              //                   // mainAxisAlignment:
                              //                   //     MainAxisAlignment.start,
                              //                   // crossAxisAlignment:
                              //                   //     CrossAxisAlignment.start,
                              //                   children: [
                              //                     Icon(
                              //                       Icons.location_on_outlined,
                              //                       color: Colors.red,
                              //                     ),
                              //                     Text(data.stateAbbr),
                              //                   ],
                              //                 ),
                              //                 SizedBox(
                              //                   height: 4,
                              //                 ),
                              //                 Padding(
                              //                   padding: const EdgeInsets.only(
                              //                       left: 20.0, right: 5),
                              //                   child: Row(
                              //                     children: [
                              //                       Padding(
                              //                         padding:
                              //                         const EdgeInsets.only(
                              //                             right: 3.0),
                              //                         child: Icon(
                              //                           Icons.adb_sharp,
                              //                           color: Colors.red,
                              //                         ),
                              //                       ),
                              //                       Expanded(
                              //                         child: Text(
                              //                             "Bath:${data.customFields['34'] ?? ""}"),
                              //                       ),
                              //                     ],
                              //                   ),
                              //                 ),
                              //                 SizedBox(
                              //                   height: 4,
                              //                 ),
                              //                 Padding(
                              //                   padding: const EdgeInsets.only(
                              //                       left: 25.0, right: 0),
                              //                   child: Row(
                              //                     children: [
                              //                       Icon(
                              //                         Icons.border_style,
                              //                         color: Colors.red,
                              //                       ),
                              //                       Expanded(
                              //                         child: Padding(
                              //                           padding:
                              //                           const EdgeInsets.only(
                              //                               left: 4.0),
                              //                           child: Text(
                              //                               "sq.ft${data.customFields['38'] ?? ""}"),
                              //                         ),
                              //                       )
                              //                     ],
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //     SizedBox(
                              //       height: 2,
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
          // return Container(
          //   height: 335,
          //   //  width: 260,
          //   child:
          //   ListView.builder(
          //     shrinkWrap: true,
          //     scrollDirection: Axis.horizontal,
          //     itemCount: propertyController.getProperty.value.featured.length,
          //     itemBuilder: (_, index) {
          //       var data = propertyController.getProperty.value.featured[index];
          //       return Padding(
          //         padding: const EdgeInsets.only(left: 7.0, top: 5),
          //         child: Card(
          //           color: Colors.white,
          //           elevation: 2,
          //           child: ClipRRect(
          //             borderRadius: BorderRadius.circular(5),
          //             child: InkWell(
          //               onTap: () {
          //                 Get.to(
          //                     PropertyDetails(
          //                       image: data.photoUrl,
          //                       title: data.listingTitle,
          //                       price: data.price,
          //                       description: data.shortDesc,
          //                       listingAddress: data.listingAddr,
          //                       catNamePropertyForBuy: "${data.catName}",
          //                       propertyType: data.customFields['32'],
          //                       bathrooms: data.customFields['34'],
          //                       buildYear: data.customFields['39'],
          //                       enterHouseSize: data.customFields['38'],
          //                       rooms: data.customFields['33'],
          //                       carSpace: data.customFields['37'],
          //                     ),
          //                     transition: Transition.zoom);
          //               },
          //               child: Container(
          //                 height: 360,
          //                 width: 260,
          //                 child: Column(
          //                   mainAxisAlignment: MainAxisAlignment.start,
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     Stack(
          //                       children: [
          //                         Image.network(
          //                           data.photoUrl,
          //                           height: 138,
          //                           width: 300,
          //                           fit: BoxFit.cover,
          //                         ),
          //                         Padding(
          //                           padding: const EdgeInsets.only(
          //                             top: 98.0,
          //                           ),
          //                           child: Row(
          //                             children: [
          //                               Padding(
          //                                 padding: const EdgeInsets.only(
          //                                     left: 0.0, right: 30),
          //                                 child: Container(
          //                                     decoration: BoxDecoration(
          //                                       color: Colors.red,
          //                                       borderRadius:
          //                                           BorderRadius.circular(0),
          //                                     ),
          //                                     child: Padding(
          //                                       padding:
          //                                           const EdgeInsets.all(6.0),
          //                                       child: Text(
          //                                         "\$${data.price}",
          //                                         style: TextStyle(
          //                                             fontSize: 18,
          //                                             color: Colors.white),
          //                                       ),
          //                                     )),
          //                               ),
          //                               Spacer(),
          //                               IconButton(
          //                                   icon: Icon(
          //                                     Icons.favorite_border,
          //                                     color: Colors.white,
          //                                   ),
          //                                   onPressed: () {}),
          //                             ],
          //                           ),
          //                         )
          //                       ],
          //                     ),
          //                     Padding(
          //                       padding: const EdgeInsets.only(left: 8.0),
          //                       child: Text(
          //                         data.listingTitle,
          //                         style: TextStyle(
          //                             fontSize: 17,
          //                             fontWeight: FontWeight.bold),
          //                       ),
          //                     ),
          //                     SizedBox(
          //                       height: 4,
          //                     ),
          //                     Expanded(
          //                       child: Column(
          //                         mainAxisAlignment: MainAxisAlignment.center,
          //                         crossAxisAlignment: CrossAxisAlignment.center,
          //                         children: [
          //                           Row(
          //                             mainAxisAlignment:
          //                                 MainAxisAlignment.center,
          //                             crossAxisAlignment:
          //                                 CrossAxisAlignment.center,
          //                             children: [
          //                               Column(
          //                                 mainAxisAlignment:
          //                                     MainAxisAlignment.start,
          //                                 crossAxisAlignment:
          //                                     CrossAxisAlignment.start,
          //                                 children: [
          //                                   Padding(
          //                                     padding: const EdgeInsets.only(
          //                                         left: 4.0),
          //                                     child: Row(
          //                                       mainAxisAlignment:
          //                                           MainAxisAlignment.center,
          //                                       crossAxisAlignment:
          //                                           CrossAxisAlignment.center,
          //                                       children: [
          //                                         Icon(
          //                                           Icons.person,
          //                                           color: Colors.red,
          //                                         ),
          //                                         Text("1 month ago"),
          //                                       ],
          //                                     ),
          //                                   ),
          //                                   SizedBox(
          //                                     height: 4,
          //                                   ),
          //                                   Padding(
          //                                     padding: const EdgeInsets.only(
          //                                         left: 4.0),
          //                                     child: Row(
          //                                       mainAxisAlignment:
          //                                           MainAxisAlignment.start,
          //                                       crossAxisAlignment:
          //                                           CrossAxisAlignment.start,
          //                                       children: [
          //                                         Icon(
          //                                           Icons.tour,
          //                                           color: Colors.red,
          //                                         ),
          //                                         Padding(
          //                                           padding:
          //                                               const EdgeInsets.all(
          //                                                   4.0),
          //                                           child: Text(
          //                                               "Beds:${data.customFields['33']}"),
          //                                         ),
          //                                       ],
          //                                     ),
          //                                   ),
          //                                   SizedBox(
          //                                     height: 3,
          //                                   ),
          //                                   Padding(
          //                                     padding: const EdgeInsets.only(
          //                                         left: 4.0),
          //                                     child: Row(
          //                                       children: [
          //                                         Icon(
          //                                           Icons.keyboard,
          //                                           color: Colors.red,
          //                                         ),
          //                                         Text(
          //                                             "Type:${data.customFields['32']}"),
          //                                       ],
          //                                     ),
          //                                   ),
          //                                 ],
          //                               ),
          //                               Spacer(),
          //                               Padding(
          //                                 padding:
          //                                     const EdgeInsets.only(right: 4.0),
          //                                 child: Column(
          //                                   // mainAxisAlignment:
          //                                   //     MainAxisAlignment.start,
          //                                   // crossAxisAlignment:
          //                                   //     CrossAxisAlignment.start,
          //                                   children: [
          //                                     Row(
          //                                       // mainAxisAlignment:
          //                                       //     MainAxisAlignment.start,
          //                                       // crossAxisAlignment:
          //                                       //     CrossAxisAlignment.start,
          //                                       children: [
          //                                         Icon(
          //                                           Icons.location_on_outlined,
          //                                           color: Colors.red,
          //                                         ),
          //                                         Text(data.stateAbbr),
          //                                       ],
          //                                     ),
          //                                     SizedBox(
          //                                       height: 4,
          //                                     ),
          //                                     Padding(
          //                                       padding: const EdgeInsets.only(
          //                                           left: 20.0, right: 5),
          //                                       child: Row(
          //                                         children: [
          //                                           Padding(
          //                                             padding:
          //                                                 const EdgeInsets.only(
          //                                                     right: 3.0),
          //                                             child: Icon(
          //                                               Icons.adb_sharp,
          //                                               color: Colors.red,
          //                                             ),
          //                                           ),
          //                                           Text(
          //                                               "Bath:${data.customFields['34']}"),
          //                                         ],
          //                                       ),
          //                                     ),
          //                                     SizedBox(
          //                                       height: 4,
          //                                     ),
          //                                     Padding(
          //                                       padding: const EdgeInsets.only(
          //                                           left: 2.0, right: 3),
          //                                       child: Row(
          //                                         children: [
          //                                           Icon(
          //                                             Icons.border_style,
          //                                             color: Colors.red,
          //                                           ),
          //                                           Padding(
          //                                             padding:
          //                                                 const EdgeInsets.only(
          //                                                     left: 4.0),
          //                                             child: Text(
          //                                                 "sq.ft${data.customFields['38'] ?? ""}"),
          //                                           ),
          //                                         ],
          //                                       ),
          //                                     ),
          //                                   ],
          //                                 ),
          //                               ),
          //                             ],
          //                           ),
          //                           SizedBox(
          //                             height: 2,
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //
          //                     ///  property  Call
          //                     Row(
          //                       children: [
          //                         Padding(
          //                           padding: const EdgeInsets.only(left: 6.0),
          //                           child: Text(
          //                             "Property for Buy",
          //                             style: TextStyle(
          //                                 fontSize: 16,
          //                                 color: Colors.red[600],
          //                                 fontWeight: FontWeight.bold),
          //                           ),
          //                         ),
          //                         Spacer(),
          //                         Padding(
          //                           padding: const EdgeInsets.only(
          //                               left: 25.0, right: 5.0),
          //                           child: new ElevatedButton(
          //                             onPressed: () {},
          //                             style: ButtonStyle(
          //                                 backgroundColor:
          //                                     MaterialStateProperty.all<Color>(
          //                                         Colors.black)),
          //                             child: Text("    Call    "),
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // );
        }),
        // Divider(
        //   thickness: 2,
        //   color: Colors.grey,
        //   indent: 5,
        //   endIndent: 5,
        // ),
        //  Feature Listing....................
        // Obx(() {
        //   if (carController.carLoading.value) {
        //     return Center(
        //       child: CircularProgressIndicator(),
        //     );
        //   }
        //   return Container(
        //     height: 335,
        //     //  width: 260,
        //     child: ListView.builder(
        //       shrinkWrap: true,
        //       scrollDirection: Axis.horizontal,
        //       itemCount: carController.getCar.value.featured.length,
        //       itemBuilder: (_, index) {
        //         var data = carController.getCar.value.featured[index];
        //         return Padding(
        //           padding: const EdgeInsets.only(left: 7.0, top: 5),
        //           child: Card(
        //             color: Colors.white,
        //             elevation: 2,
        //             child: ClipRRect(
        //               borderRadius: BorderRadius.circular(5),
        //               child: InkWell(
        //                 onTap: () {
        //                   Get.to(
        //                       CarFeatureDetails(
        //                         image: data.photoUrl,
        //                         title: data.listingTitle,
        //                         price: data.price,
        //                         description: data.shortDesc,
        //                         listingAddress: data.listingAddr,
        //                         catNamePropertyForBuy: "${data.catName}",
        //                         typeOfCar: data.customFields['27'],
        //                         transmission: data.customFields['29'],
        //                         modelYear: data.customFields['40'],
        //                         color: data.customFields['28'],
        //                         condition: data.customFields['33'],
        //                         milage: data.customFields['41'],
        //                       ),
        //                       transition: Transition.zoom);
        //                 },
        //                 child: Container(
        //                   height: 360,
        //                   width: 250,
        //                   child: Column(
        //                     mainAxisAlignment: MainAxisAlignment.start,
        //                     crossAxisAlignment: CrossAxisAlignment.start,
        //                     children: [
        //                       Stack(
        //                         children: [
        //                           Image.network(
        //                             data.photoUrl,
        //                             height: 138,
        //                             width: 300,
        //                             fit: BoxFit.cover,
        //                           ),
        //                           Padding(
        //                             padding: const EdgeInsets.only(top: 98.0),
        //                             child: Row(
        //                               children: [
        //                                 Padding(
        //                                   padding: const EdgeInsets.only(
        //                                       right: 30.0),
        //                                   child: Container(
        //                                       decoration: BoxDecoration(
        //                                         color: Colors.red,
        //                                         borderRadius:
        //                                             BorderRadius.circular(5),
        //                                       ),
        //                                       child: Padding(
        //                                         padding:
        //                                             const EdgeInsets.all(6.0),
        //                                         child: Text(
        //                                           "\$ ${data.price}",
        //                                           style: TextStyle(
        //                                               fontSize: 18,
        //                                               color: Colors.white),
        //                                         ),
        //                                       )),
        //                                 ),
        //                                 Spacer(),
        //                                 IconButton(
        //                                     icon: Icon(
        //                                       Icons.favorite_border,
        //                                       color: Colors.white,
        //                                     ),
        //                                     onPressed: () {}),
        //                               ],
        //                             ),
        //                           )
        //                         ],
        //                       ),
        //                       Padding(
        //                         padding: const EdgeInsets.only(left: 7.0),
        //                         child: Text(
        //                           data.listingTitle,
        //                           style: TextStyle(
        //                               fontSize: 17,
        //                               fontWeight: FontWeight.bold),
        //                         ),
        //                       ),
        //                       SizedBox(
        //                         height: 5,
        //                       ),
        //                       Expanded(
        //                         child: Column(
        //                           mainAxisAlignment: MainAxisAlignment.center,
        //                           crossAxisAlignment: CrossAxisAlignment.center,
        //                           children: [
        //                             Row(
        //                               mainAxisAlignment:
        //                                   MainAxisAlignment.center,
        //                               crossAxisAlignment:
        //                                   CrossAxisAlignment.center,
        //                               children: [
        //                                 Column(
        //                                   mainAxisAlignment:
        //                                       MainAxisAlignment.start,
        //                                   crossAxisAlignment:
        //                                       CrossAxisAlignment.start,
        //                                   children: [
        //                                     Padding(
        //                                       padding: const EdgeInsets.only(
        //                                           left: 4.0),
        //                                       child: Row(
        //                                         mainAxisAlignment:
        //                                             MainAxisAlignment.center,
        //                                         crossAxisAlignment:
        //                                             CrossAxisAlignment.center,
        //                                         children: [
        //                                           Icon(
        //                                             Icons.person,
        //                                             color: Colors.red,
        //                                           ),
        //                                           Text("  1 month ago"),
        //                                         ],
        //                                       ),
        //                                     ),
        //                                     SizedBox(
        //                                       height: 4,
        //                                     ),
        //                                     Padding(
        //                                       padding: const EdgeInsets.only(
        //                                           left: 4.0),
        //                                       child: Row(
        //                                         mainAxisAlignment:
        //                                             MainAxisAlignment.start,
        //                                         crossAxisAlignment:
        //                                             CrossAxisAlignment.start,
        //                                         children: [
        //                                           Icon(
        //                                             Icons.tour,
        //                                             color: Colors.red,
        //                                           ),
        //                                           Padding(
        //                                             padding:
        //                                                 const EdgeInsets.all(
        //                                                     4.0),
        //                                             child: Text(
        //                                                 "  Milage: ${data.customFields['41']}"),
        //                                           ),
        //                                         ],
        //                                       ),
        //                                     ),
        //                                     SizedBox(
        //                                       height: 3,
        //                                     ),
        //                                   ],
        //                                 ),
        //                                 Spacer(),
        //                                 Padding(
        //                                   padding:
        //                                       const EdgeInsets.only(right: 4.0),
        //                                   child: Column(
        //                                     // mainAxisAlignment:
        //                                     //     MainAxisAlignment.start,
        //                                     // crossAxisAlignment:
        //                                     //     CrossAxisAlignment.start,
        //                                     children: [
        //                                       Row(
        //                                         // mainAxisAlignment:
        //                                         //     MainAxisAlignment.start,
        //                                         // crossAxisAlignment:
        //                                         //     CrossAxisAlignment.start,
        //                                         children: [
        //                                           Icon(
        //                                             Icons.location_on_outlined,
        //                                             color: Colors.red,
        //                                           ),
        //                                           Text(data.stateAbbr),
        //                                         ],
        //                                       ),
        //                                       SizedBox(
        //                                         height: 4,
        //                                       ),
        //                                       Padding(
        //                                         padding: const EdgeInsets.only(
        //                                             left: 5.0, right: 5),
        //                                         child: Row(
        //                                           children: [
        //                                             Padding(
        //                                               padding:
        //                                                   const EdgeInsets.only(
        //                                                       right: 3.0),
        //                                               child: Icon(
        //                                                 Icons.adb_sharp,
        //                                                 color: Colors.red,
        //                                               ),
        //                                             ),
        //                                             Text(
        //                                                 " Year: ${data.customFields["40"]}"),
        //                                           ],
        //                                         ),
        //                                       ),
        //                                       SizedBox(
        //                                         height: 4,
        //                                       ),
        //                                     ],
        //                                   ),
        //                                 ),
        //                               ],
        //                             ),
        //                             SizedBox(
        //                               height: 2,
        //                             ),
        //                           ],
        //                         ),
        //                       ),
        //
        //                       ///  property  Call
        //                       Row(
        //                         children: [
        //                           Padding(
        //                             padding: const EdgeInsets.only(left: 6.0),
        //                             child: Text(
        //                               "Property for Buy",
        //                               style: TextStyle(
        //                                   fontSize: 16,
        //                                   color: Colors.red[600],
        //                                   fontWeight: FontWeight.bold),
        //                             ),
        //                           ),
        //                           Spacer(),
        //                           Padding(
        //                             padding: const EdgeInsets.only(
        //                                 left: 25.0, right: 5.0),
        //                             child: new ElevatedButton(
        //                               onPressed: () {},
        //                               style: ButtonStyle(
        //                                   backgroundColor:
        //                                       MaterialStateProperty.all<Color>(
        //                                           Colors.black)),
        //                               child: Text("    Call    "),
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                       // SizedBox(height: 3,)
        //                     ],
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           ),
        //         );
        //       },
        //     ),
        //   );
        // }),
        SizedBox(
          height: 20,
        ),
        // // Explore The Latest Listings...
        // Padding(
        //   padding: const EdgeInsets.only(top: 12.0, left: 14),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Text(
        //         "Explore The Latest Listing",
        //         style: TextStyle(
        //             fontSize: 20,
        //             color: Colors.black,
        //             fontWeight: FontWeight.bold),
        //       ),
        //     ],
        //   ),
        // ),
        // Divider(
        //   thickness: 2,
        //   color: Colors.grey,
        //   indent: 12,
        //   endIndent: 5,
        // ),
        // Obx(() {
        //   if (carController.carLoading.value) {
        //     return Center(
        //       child: CircularProgressIndicator(),
        //     );
        //   }
        //   return Container(
        //     height: 335,
        //     //  width: 260,
        //     child: ListView.builder(
        //       shrinkWrap: true,
        //       scrollDirection: Axis.horizontal,
        //       itemCount: carController.getCar.value.latest.length,
        //       itemBuilder: (_, index) {
        //         var latestData = carController.getCar.value.latest[index];
        //         return Padding(
        //           padding: const EdgeInsets.only(left: 7.0, top: 5),
        //           child: Card(
        //             color: Colors.white,
        //             elevation: 2,
        //             child: ClipRRect(
        //               borderRadius: BorderRadius.circular(5),
        //               child: InkWell(
        //                 onTap: () {
        //                   Get.to(
        //                       CarLatestDetails(
        //                         image: latestData.photoUrl,
        //                         title: latestData.listingTitle,
        //                         price: latestData.listingPrice,
        //                         description: latestData.shortDesc,
        //                         listingAddress: latestData.listingAddr,
        //                         catNamePropertyForBuy:
        //                             latestData.catName.toString(),
        //                         typeOfCar: latestData.customFields['27'],
        //                         transmission: latestData.customFields['29'],
        //                         modelYear: latestData.customFields['40'],
        //                         color: latestData.customFields['28'],
        //                         condition: latestData.customFields['33'],
        //                         milage: latestData.customFields['41'],
        //                       ),
        //                       transition: Transition.zoom);
        //
        //                   //   Get.to(PropertyDetails(), transition: Transition.zoom);
        //                 },
        //                 child: Container(
        //                   height: 360,
        //                   width: 250,
        //                   child: Column(
        //                     mainAxisAlignment: MainAxisAlignment.start,
        //                     crossAxisAlignment: CrossAxisAlignment.start,
        //                     children: [
        //                       Stack(
        //                         children: [
        //                           Image.network(
        //                             latestData.photoUrl,
        //                             height: 138,
        //                             width: 300,
        //                             fit: BoxFit.cover,
        //                           ),
        //                           Padding(
        //                             padding: const EdgeInsets.only(top: 98.0),
        //                             child: Row(
        //                               children: [
        //                                 Padding(
        //                                   padding: const EdgeInsets.only(
        //                                       right: 30.0),
        //                                   child: Container(
        //                                       decoration: BoxDecoration(
        //                                         color: Colors.red,
        //                                         borderRadius:
        //                                             BorderRadius.circular(5),
        //                                       ),
        //                                       child: Padding(
        //                                         padding:
        //                                             const EdgeInsets.all(6.0),
        //                                         child: Text(
        //                                           "\$ ${latestData.listingPrice}",
        //                                           style: TextStyle(
        //                                               fontSize: 18,
        //                                               color: Colors.white),
        //                                         ),
        //                                       )),
        //                                 ),
        //                                 Spacer(),
        //                                 IconButton(
        //                                     icon: Icon(
        //                                       Icons.favorite_border,
        //                                       color: Colors.white,
        //                                     ),
        //                                     onPressed: () {}),
        //                               ],
        //                             ),
        //                           )
        //                         ],
        //                       ),
        //                       Padding(
        //                         padding: const EdgeInsets.only(left: 7.0),
        //                         child: Text(
        //                           "${latestData.listingTitle}",
        //                           style: TextStyle(
        //                               fontSize: 17,
        //                               fontWeight: FontWeight.bold),
        //                         ),
        //                       ),
        //                       SizedBox(
        //                         height: 5,
        //                       ),
        //                       Expanded(
        //                         child: Column(
        //                           mainAxisAlignment: MainAxisAlignment.center,
        //                           crossAxisAlignment: CrossAxisAlignment.center,
        //                           children: [
        //                             Row(
        //                               mainAxisAlignment:
        //                                   MainAxisAlignment.center,
        //                               crossAxisAlignment:
        //                                   CrossAxisAlignment.center,
        //                               children: [
        //                                 Column(
        //                                   mainAxisAlignment:
        //                                       MainAxisAlignment.start,
        //                                   crossAxisAlignment:
        //                                       CrossAxisAlignment.start,
        //                                   children: [
        //                                     Padding(
        //                                       padding: const EdgeInsets.only(
        //                                           left: 4.0),
        //                                       child: Row(
        //                                         mainAxisAlignment:
        //                                             MainAxisAlignment.center,
        //                                         crossAxisAlignment:
        //                                             CrossAxisAlignment.center,
        //                                         children: [
        //                                           Icon(
        //                                             Icons.person,
        //                                             color: Colors.red,
        //                                           ),
        //                                           Text("  1 month ago"),
        //                                         ],
        //                                       ),
        //                                     ),
        //                                     SizedBox(
        //                                       height: 4,
        //                                     ),
        //                                     Padding(
        //                                       padding: const EdgeInsets.only(
        //                                           left: 4.0),
        //                                       child: Row(
        //                                         mainAxisAlignment:
        //                                             MainAxisAlignment.start,
        //                                         crossAxisAlignment:
        //                                             CrossAxisAlignment.start,
        //                                         children: [
        //                                           Icon(
        //                                             Icons.tour,
        //                                             color: Colors.red,
        //                                           ),
        //                                           Padding(
        //                                             padding:
        //                                                 const EdgeInsets.all(
        //                                                     4.0),
        //                                             child: Text(
        //                                                 "  Milage: ${latestData.customFields['41']}"),
        //                                           ),
        //                                         ],
        //                                       ),
        //                                     ),
        //                                     SizedBox(
        //                                       height: 3,
        //                                     ),
        //                                   ],
        //                                 ),
        //                                 Spacer(),
        //                                 Padding(
        //                                   padding:
        //                                       const EdgeInsets.only(right: 4.0),
        //                                   child: Column(
        //                                     // mainAxisAlignment:
        //                                     //     MainAxisAlignment.start,
        //                                     // crossAxisAlignment:
        //                                     //     CrossAxisAlignment.start,
        //                                     children: [
        //                                       Row(
        //                                         // mainAxisAlignment:
        //                                         //     MainAxisAlignment.start,
        //                                         // crossAxisAlignment:
        //                                         //     CrossAxisAlignment.start,
        //                                         children: [
        //                                           Icon(
        //                                             Icons.location_on_outlined,
        //                                             color: Colors.red,
        //                                           ),
        //                                           Text(latestData.stateAbbr),
        //                                         ],
        //                                       ),
        //                                       SizedBox(
        //                                         height: 4,
        //                                       ),
        //                                       Padding(
        //                                         padding: const EdgeInsets.only(
        //                                             left: 5.0, right: 5),
        //                                         child: Row(
        //                                           children: [
        //                                             Padding(
        //                                               padding:
        //                                                   const EdgeInsets.only(
        //                                                       right: 3.0),
        //                                               child: Icon(
        //                                                 Icons.adb_sharp,
        //                                                 color: Colors.red,
        //                                               ),
        //                                             ),
        //                                             Text(
        //                                                 " Year: ${latestData.customFields["40"]}"),
        //                                           ],
        //                                         ),
        //                                       ),
        //                                       SizedBox(
        //                                         height: 4,
        //                                       ),
        //                                     ],
        //                                   ),
        //                                 ),
        //                               ],
        //                             ),
        //                             SizedBox(
        //                               height: 2,
        //                             ),
        //                           ],
        //                         ),
        //                       ),
        //                       Row(
        //                         children: [
        //                           Padding(
        //                             padding: const EdgeInsets.only(left: 4.0),
        //                             child: Container(
        //                               decoration: BoxDecoration(
        //                                   borderRadius:
        //                                       BorderRadius.circular(5),
        //                                   color: Colors.red),
        //                               child: Padding(
        //                                 padding: const EdgeInsets.all(8.0),
        //                                 child: Container(
        //                                   child: Text(
        //                                     "Property for Buy",
        //                                     style: TextStyle(
        //                                         fontSize: 17,
        //                                         color: Colors.white),
        //                                   ),
        //                                 ),
        //                               ),
        //                             ),
        //                           ),
        //                           Spacer(),
        //                           Padding(
        //                             padding: const EdgeInsets.only(right: 4.0),
        //                             child: Container(
        //                               decoration: BoxDecoration(
        //                                 color: Colors.black,
        //                                 borderRadius: BorderRadius.circular(5),
        //                               ),
        //                               child: InkWell(
        //                                 onTap: () {},
        //                                 child: Padding(
        //                                   padding: const EdgeInsets.only(
        //                                       right: 6.0, top: 6, bottom: 2),
        //                                   child: Row(
        //                                     children: [
        //                                       Padding(
        //                                         padding: const EdgeInsets.only(
        //                                             left: 8.0),
        //                                         child: Container(
        //                                           padding: EdgeInsets.only(
        //                                               right: 15),
        //                                           child: Icon(
        //                                             Icons
        //                                                 .phone_enabled_outlined,
        //                                             size: 30,
        //                                             color: Colors.white,
        //                                           ),
        //                                         ),
        //                                       ),
        //                                       Text(
        //                                         "    Call",
        //                                         style: TextStyle(
        //                                             fontSize: 14,
        //                                             color: Colors.white),
        //                                       )
        //                                     ],
        //                                   ),
        //                                 ),
        //                               ),
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                       SizedBox(
        //                         height: 3,
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           ),
        //         );
        //       },
        //     ),
        //   );
        // }),

        SizedBox(
          height: 20,
        ),
      ],
    );
  }

// Widget row(City item) {
//   return ListTile(
//     title: Text(item.cityName),
//   );
// }
}
