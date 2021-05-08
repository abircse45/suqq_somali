import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:suuq_somali/DrawerScreen.dart';
import 'package:suuq_somali/controller/property_controller.dart';
import 'package:suuq_somali/controller/filter_search_controller_property.dart';
import 'package:suuq_somali/models/all_ads_model.dart';
import 'package:suuq_somali/property/property_details.dart';
import 'package:suuq_somali/property/property_filter.dart';
import 'package:suuq_somali/utils/app_theme.dart';


class PropertyPage extends StatefulWidget {
  @override
  _PropertyPageState createState() => _PropertyPageState();
}

class _PropertyPageState extends State<PropertyPage>
    with TickerProviderStateMixin {
  MenuController menuController;

  @override
  void initState() {
    super.initState();

    menuController = new MenuController(
      vsync: this,
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    menuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => menuController,
      child: ScreenHomePage(
        menuScreen: MenuScreen(),
        contentScreen: Layout(
            contentBuilder: (cc) => Container(
                  color: Colors.grey[200],
                  child: Container(
                    color: Colors.grey[200],
                  ),
                )),
      ),
    );
  }
}

class ScreenHomePage extends StatefulWidget {
  final Widget menuScreen;
  final Layout contentScreen;

  ScreenHomePage({
    this.menuScreen,
    this.contentScreen,
  });

  @override
  _ScreenHomePageState createState() => _ScreenHomePageState();
}

class _ScreenHomePageState extends State<ScreenHomePage> {
  Curve scaleDownCurve = new Interval(0.0, 0.3, curve: Curves.easeOut);
  Curve scaleUpCurve = new Interval(0.0, 1.0, curve: Curves.easeOut);
  Curve slideOutCurve = new Interval(0.0, 1.0, curve: Curves.easeOut);
  Curve slideInCurve = new Interval(0.0, 1.0, curve: Curves.easeOut);
  var now = new DateTime.now();
  var formatter = new DateFormat('MM');

  createContentDisplay() {
    return zoomAndSlideContent(
      new Container(
        child: new Scaffold(
          backgroundColor: HexColor("#ededed"),

          // backgroundColor: Colors.white,

          // Calling variable appbar
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Color(0xFFFFFFFF),
            elevation: 1,
            centerTitle: true,
            title: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Text("Property",style: TextStyle(fontSize: 19,color: Colors.black),)
            ),
            // leading: new IconButton(
            //     icon: Icon(
            //       EvaIcons.menu2Outline,
            //       color: Colors.black,
            //     ),
            //     onPressed: () {
            //       Provider.of<MenuController>(context, listen: false).toggle();
            //     }),
            // actions: <Widget>[
            //   Padding(
            //     padding: const EdgeInsets.only(right: 10.0),
            //     child:
            //         InkWell(onTap: () {}, child: Icon(EvaIcons.personOutline)),
            //   ),
            // ],
          ),
          body: Obx(() {
            if (propertyController.loading.value) {
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
                showProperty(),
              ],
            );
          }),
        ),
      ),
    );
  }

  zoomAndSlideContent(Widget content) {
    var slidePercent, scalePercent;

    switch (Provider.of<MenuController>(context, listen: true).state) {
      case MenuState.closed:
        slidePercent = 0.0;
        scalePercent = 0.0;
        break;
      case MenuState.open:
        slidePercent = 1.0;
        scalePercent = 1.0;
        break;
      case MenuState.opening:
        slidePercent = slideOutCurve.transform(
            Provider.of<MenuController>(context, listen: true).percentOpen);
        scalePercent = scaleDownCurve.transform(
            Provider.of<MenuController>(context, listen: true).percentOpen);
        break;
      case MenuState.closing:
        slidePercent = slideInCurve.transform(
            Provider.of<MenuController>(context, listen: true).percentOpen);
        scalePercent = scaleUpCurve.transform(
            Provider.of<MenuController>(context, listen: true).percentOpen);
        break;
    }

    final slideAmount = 275.0 * slidePercent;
    final contentScale = 1.0 - (0.2 * scalePercent);
    final cornerRadius =
        16.0 * Provider.of<MenuController>(context, listen: true).percentOpen;

    return new Transform(
      transform: new Matrix4.translationValues(slideAmount, 0.0, 0.0)
        ..scale(contentScale, contentScale),
      alignment: Alignment.centerLeft,
      child: new Container(
        decoration: new BoxDecoration(
          boxShadow: [
            new BoxShadow(
              color: Colors.black12,
              offset: const Offset(0.0, 5.0),
              blurRadius: 15.0,
              spreadRadius: 10.0,
            ),
          ],
        ),
        child: new ClipRRect(
            borderRadius: new BorderRadius.circular(cornerRadius),
            child: content),
      ),
    );
  }

  final propertyController = Get.put(PropertyController());
  final searchController = Get.put(SearchController());

  bool isVisible = false;
  //List<String> datType = [];
  //String buycat_id = "173";
  String propertyRent = "173";
  String propertyBuy = "174";
  var currentSelectedValueRent = "173";
  // var currentSelectedValueBuy = "174";

  String selectArea;
  String selectProperty;
  String selectedRoom;
  String selectBathRooms;
  String selectedCarSpace;
  AutoCompleteTextField searchTextField;
  String selectedCity;
  bool isChange;

  GlobalKey<AutoCompleteTextFieldState<StateValue>> key = new GlobalKey();
  ScrollController _scrollController = ScrollController();

  fetchData() {
    for (int i = 0; i < 5; i++) {
      propertyController.getDataCalling();
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Scaffold(
            body: widget.menuScreen,
          ),
        ),
        createContentDisplay()
      ],
    );
  }

  Widget showProperty() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        // Padding(
        //   padding: const EdgeInsets.only(top: 12.0, left: 14),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       Text(
        //         "Featured Listing",
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
      //   Feature Listing....................


        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Text(
                "Featured Listing",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
         IconButton(
                icon: Icon(Icons.filter_list_outlined),
                onPressed: () {
                  Get.to(PropertyFilter(),transition: Transition.zoom);
                },

            ),
          ],
        ),

        Obx(() {
          if (propertyController.loading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            controller: _scrollController,
            shrinkWrap: true,
            primary: false,
            itemCount: propertyController.getProperty.value.featured.length,
            itemBuilder: (_, index) {
              var data = propertyController.getProperty.value.featured[index];
              return InkWell(
                onTap: (){
                  Get.to(
                      PropertyDetails(
                        image: data.photoUrl,
                        title: data.listingTitle,
                        price: data.price,
                        description: data.shortDesc,
                        listingAddress: data.listingAddr,
                        catNamePropertyForBuy: "${data.catName}",
                        propertyType: data.customFields['32'],
                        bathrooms: data.customFields['34'],
                        buildYear: data.customFields['39'],
                        enterHouseSize: data.customFields['38'],
                        rooms: data.customFields['33'],
                        carSpace: data.customFields['37'],
                      ),
                      transition: Transition.zoom);
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
                            borderRadius: BorderRadius.all(Radius.circular(3.0)),
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text("\$${data.price}",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  // Icon(Icons.favorite_border)
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0, top: 5),
                                child: Text(
                                  "${data.listingTitle}",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
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
                                                    Icons.person,
                                                    color: Colors.red,
                                                  ),
                                                  Expanded(child: Text("1 month ago")),
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
                                                    child: Text(
                                                        "Beds:${data.customFields['33']}"),
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
                                                  Expanded(
                                                    child: Text(
                                                        " Type: ${data.customFields['32'] ?? ""}"),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 4.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                                  Text(data.stateAbbr),
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
                                                    Text(
                                                        "Bath:${data.customFields['34']}"),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 25.0, right: 0),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.border_style,
                                                      color: Colors.red,
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                                left: 4.0),
                                                        child: Text(
                                                            "sq.ft${data.customFields['38'] ?? ""}"),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                ],
                              ),
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
        SizedBox(
          height: 20,
        ),
        // Explore The Latest Listings...
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
        //   if (propertyController.loading.value) {
        //     return Center(
        //       child: CircularProgressIndicator(),
        //     );
        //   }
        //   return Container(
        //     height: 332,
        //     //  width: 260,
        //     child: ListView.builder(
        //       shrinkWrap: true,
        //       scrollDirection: Axis.horizontal,
        //       itemCount: propertyController.getProperty.value.latest.length,
        //       itemBuilder: (_, index) {
        //         var latestData =
        //             propertyController.getProperty.value.latest[index];
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
        //                       DetailsLatestListing(
        //                         image: latestData.photoUrl,
        //                         title: latestData.listingTitle,
        //                         price: latestData.listingPrice,
        //                         description: latestData.shortDesc,
        //                         listingAddress: latestData.listingAddr,
        //                         catNamePropertyForBuy:
        //                             latestData.catName.toString(),
        //                         propertyType: latestData.customFields['32'],
        //                         bathrooms: latestData.customFields['34'],
        //                         buildYear: latestData.customFields['39'],
        //                         enterHouseSize: latestData.customFields['38'],
        //                         rooms: latestData.customFields['33'],
        //                         carSpace: latestData.customFields['37'],
        //                       ),
        //                       transition: Transition.zoom);
        //
        //                   //   Get.to(PropertyDetails(), transition: Transition.zoom);
        //                 },
        //                 child: Container(
        //                   height: 362,
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
        //                                       left: 0.0, right: 30),
        //                                   child: Container(
        //                                       decoration: BoxDecoration(
        //                                         color: Colors.red,
        //                                         borderRadius:
        //                                             BorderRadius.circular(0),
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
        //                         padding: const EdgeInsets.only(left: 8.0),
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
        //                                           Text("1 month ago"),
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
        //                                                 "Beds:${latestData.customFields['33']}"),
        //                                           ),
        //                                         ],
        //                                       ),
        //                                     ),
        //                                     SizedBox(
        //                                       height: 3,
        //                                     ),
        //                                     Padding(
        //                                       padding: const EdgeInsets.only(
        //                                           left: 4.0),
        //                                       child: Row(
        //                                         children: [
        //                                           Icon(
        //                                             Icons.keyboard,
        //                                             color: Colors.red,
        //                                           ),
        //                                           Text(
        //                                               "Type:${latestData.customFields['32']}"),
        //                                         ],
        //                                       ),
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
        //                                             left: 20.0, right: 5),
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
        //                                                 "Bath:${latestData.customFields['34']}"),
        //                                           ],
        //                                         ),
        //                                       ),
        //                                       SizedBox(
        //                                         height: 4,
        //                                       ),
        //                                       Padding(
        //                                         padding: const EdgeInsets.only(
        //                                             left: 2.0, right: 3),
        //                                         child: Row(
        //                                           children: [
        //                                             Icon(
        //                                               Icons.border_style,
        //                                               color: Colors.red,
        //                                             ),
        //                                             Padding(
        //                                               padding:
        //                                                   const EdgeInsets.only(
        //                                                       left: 4.0),
        //                                               child: Text(
        //                                                   "sq.ft${latestData.customFields['38']}"),
        //                                             ),
        //                                           ],
        //                                         ),
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
        //                       )
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
}

class itemCard extends StatelessWidget {
  String image, title;

  itemCard({this.image, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 10.0, right: 10.0, top: 8.0, bottom: 5.0),
      child: Container(
        height: 140.0,
        width: 400.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        child: Material(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFABABAB).withOpacity(0.7),
                  blurRadius: 4.0,
                  spreadRadius: 3.0,
                ),
              ],
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                color: Colors.black12.withOpacity(0.1),
              ),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    shadows: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.7),
                          blurRadius: 10.0,
                          spreadRadius: 2.0)
                    ],
                    color: Colors.white,
                    fontFamily: "Sofia",
                    fontWeight: FontWeight.w800,
                    fontSize: 39.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MenuController extends ChangeNotifier {
  final TickerProvider vsync;
  final AnimationController _animationController;
  MenuState state = MenuState.closed;

  MenuController({
    this.vsync,
  }) : _animationController = new AnimationController(vsync: vsync) {
    _animationController
      ..duration = const Duration(milliseconds: 250)
      ..addListener(() {
        notifyListeners();
      })
      ..addStatusListener((AnimationStatus status) {
        switch (status) {
          case AnimationStatus.forward:
            state = MenuState.opening;
            break;
          case AnimationStatus.reverse:
            state = MenuState.closing;
            break;
          case AnimationStatus.completed:
            state = MenuState.open;
            break;
          case AnimationStatus.dismissed:
            state = MenuState.closed;
            break;
        }
        notifyListeners();
      });
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  get percentOpen {
    return _animationController.value;
  }

  open() {
    _animationController.forward();
  }

  close() {
    _animationController.reverse();
  }

  toggle() {
    if (state == MenuState.open) {
      close();
    } else if (state == MenuState.closed) {
      open();
    }
  }
}

class Layout {
  final WidgetBuilder contentBuilder;

  Layout({
    this.contentBuilder,
  });
}

enum MenuState {
  closed,
  opening,
  open,
  closing,
}
