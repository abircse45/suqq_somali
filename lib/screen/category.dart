import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:suuq_somali/Home_Category/anything_screen_clone.dart';
import 'package:suuq_somali/Top_Category/searchList_category.dart';
import 'package:suuq_somali/utils/app_theme.dart';
import '../DrawerScreen.dart';

class MarketScreen extends StatelessWidget {
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
          IconButton(
              icon: Icon(
                Icons.notifications_outlined,
                size: 30,
              ),
              onPressed: () {}),
        ],
      ),
      drawer: MenuScreen(),
      body:    SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 38.0),
              child: Row(
                children: [
                  // Expanded(
                  //   child: IntrinsicHeight(
                  //     child: GestureDetector(
                  //       onTap: () {},
                  //       child: Row(
                  //         children: [
                  //           Icon(
                  //             Icons.add_location,
                  //             color: Colors.lightGreen,
                  //           ),
                  //           Text(
                  //             " Location",
                  //             style: TextStyle(fontSize: 15),
                  //           ),
                  //           VerticalDivider(
                  //             color: Colors.grey[800],
                  //             width: 50,
                  //             thickness: 0.2,
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Expanded(
                    child: IntrinsicHeight(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(
                            SearchListCategory(),
                            transition: Transition.zoom,
                          );
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.category_sharp,
                              color: Colors.lightGreen,
                            ),
                            Text(
                              " Category",
                              style: TextStyle(fontSize: 15),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                      right: 38.0,
                    ),
                    child: IconButton(
                        icon: Icon(Icons.filter_list_outlined,
                            color: Colors.lightGreen),
                        onPressed: () {}),
                  ),
                ],
              ),
            ),
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
