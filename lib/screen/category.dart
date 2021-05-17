import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/route_manager.dart';
import 'package:suuq_somali/All_Search/All_search_controller.dart';
import 'package:suuq_somali/Bottom_search/bottom_all_search.dart';
import 'package:suuq_somali/Home_Category/anything_screen_clone.dart';
import 'package:suuq_somali/classes/language.dart';
import 'package:suuq_somali/localization/language_constants.dart';
import 'package:suuq_somali/utils/app_theme.dart';
import '../DrawerScreen.dart';
import '../main.dart';
import 'package:get/get.dart';

class MarketScreen extends StatefulWidget {
  @override
  _MarketScreenState createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }

  void _showSuccessDialog() {
    showTimePicker(context: context, initialTime: TimeOfDay.now());
  }
  final searchData = Get.put(ChangeAllSearchController());
  String searchS;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black54),
        backgroundColor: Colors.white,
        title: Image.asset(
          "assets/images/suuq_logo.png",
          height: 90,
          width: 170,
        ),
        centerTitle: true,
        actions: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: DropdownButton<Language>(
          //     underline: SizedBox(),
          //     icon: Icon(
          //       Icons.language,
          //       color: Colors.red,
          //     ),
          //     onChanged: (Language language) {
          //       _changeLanguage(language);
          //     },
          //     items: Language.languageList()
          //         .map<DropdownMenuItem<Language>>(
          //           (e) => DropdownMenuItem<Language>(
          //         value: e,
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceAround,
          //           children: <Widget>[
          //
          //             Text(e.name)
          //           ],
          //         ),
          //       ),
          //     )
          //         .toList(),
          //   ),
          // ),
        ],
      ),
      drawer: MenuScreen(),
      body:    SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 6, top: 10),
              child: Container(
                height: 50,
                child: TextField(
                  textInputAction: TextInputAction.done,
                  //   FocusNode: focusNode,
                 // autofocus: true,
                  onChanged: (val) {
                    setState(() {
                     searchS = val;
                    });
                  },
                  onSubmitted: (val) {
                    setState(() {
                      // searchData.getDataCalling(searchS);
                      // Get.to(Search(),transition: Transition.zoom);
                      // searchData.allSearchLoading(true);
                    });
                  },
                  decoration: InputDecoration(
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            searchData.getDataCalling(searchS);
                            Get.to(Search(),transition: Transition.zoom);

                            searchData.allSearchLoading(true);
                          });
                          Padding(
                            padding: const EdgeInsets.only(top: 38.0),
                            child: Center(
                              child: SpinKitRing(
                                color: Colors.red,
                                size: 30,
                              ),
                            ),
                          );
                        },
                        child: Icon(Icons.search),
                      ),
                    ),
                    hintText: "Search",
                    contentPadding: EdgeInsets.only(top: 8, left: 20),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.only(left: 38.0),
            //   child: Row(
            //     children: [
            //       // Expanded(
            //       //   child: IntrinsicHeight(
            //       //     child: GestureDetector(
            //       //       onTap: () {},
            //       //       child: Row(
            //       //         children: [
            //       //           Icon(
            //       //             Icons.add_location,
            //       //             color: Colors.lightGreen,
            //       //           ),
            //       //           Text(
            //       //             " Location",
            //       //             style: TextStyle(fontSize: 15),
            //       //           ),
            //       //           VerticalDivider(
            //       //             color: Colors.grey[800],
            //       //             width: 50,
            //       //             thickness: 0.2,
            //       //           ),
            //       //         ],
            //       //       ),
            //       //     ),
            //       //   ),
            //       // ),
            //       Expanded(
            //         child: IntrinsicHeight(
            //           child: GestureDetector(
            //             onTap: () {
            //               Get.to(
            //                 SearchListCategory(),
            //                 transition: Transition.zoom,
            //               );
            //             },
            //             child: Row(
            //               children: [
            //                 Icon(
            //                   Icons.category_sharp,
            //                   color: Colors.lightGreen,
            //                 ),
            //                 Text(
            //                 " Category",
            //                   style: TextStyle(fontSize: 15),
            //                 ),
            //
            //               ],
            //             ),
            //           ),
            //         ),
            //       ),
            //
            //       Padding(
            //         padding: const EdgeInsets.only(
            //           right: 38.0,
            //         ),
            //         child: IconButton(
            //             icon: Icon(Icons.filter_list_outlined,
            //                 color: Colors.lightGreen),
            //             onPressed: () {}),
            //       ),
            //     ],
            //   ),
            // ),
            Divider(
              thickness: 1,
            ),
            Container(
              color: HexColor("#ededed"),
              height: MediaQuery.of(context).size.height,
              child: DefaultTabController(
                // initialIndex: 1,
                length: 3,
                child: Scaffold(
                  backgroundColor: HexColor("#ededed"),
                  appBar: AppBar(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    toolbarHeight: 50,
                    bottom: TabBar(
                      unselectedLabelColor: Colors.black,
                      labelColor: Colors.red,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.red,
                      indicatorWeight: 2,
                      labelStyle: TextStyle(fontSize: 15),
                      tabs: <Widget>[
                        Tab(
                          text: "Categories",
                          // child: Container(
                          //   child: Text(
                          //     "Categories",
                          //     style: TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.bold),
                          //   ),
                          // ),
                        ),
                        Tab(
                          text: "Ads",
                          // child: Text(
                          //   "Ads",
                          //   style: TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.bold),
                          // ),
                        ),
                        Tab(
                          text: "Viewed",
                          // child: Text(
                          //   "Viewed",
                          //   style: TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.bold),
                          // ),
                        ),
                      ],
                    ),
                  ),
                  body: TabBarView(
                    children: <Widget>[
                      AnythingPageClone(),
                      Center(
                        child: Text('Upcoming',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      ),
                      Center(
                        child: Text('Upcoming',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
