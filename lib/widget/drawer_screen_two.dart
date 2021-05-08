// import 'package:eva_icons_flutter/eva_icons_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:get/route_manager.dart';
// import 'package:provider/provider.dart';
// import 'package:suuq_somali/property/PropertyPage.dart';
// import 'package:suuq_somali/property/PropertyPage.dart';
// import 'package:suuq_somali/screen/all_add_screen.dart';
// import 'package:suuq_somali/screen/login_screen.dart';
// import 'package:suuq_somali/utils/drawer_menu.dart';
//
// class MenuScreen extends StatelessWidget {
//   final String imageUrl =
//       "https://celebritypets.net/wp-content/uploads/2016/12/Adriana-Lima.jpg";
//
//   final List<MenuItem> options = [
//     MenuItem(Icons.search, 'Search'),
//     MenuItem(Icons.shopping_basket, 'Performance'),
//     MenuItem(Icons.favorite, 'Leaderboard'),
//     MenuItem(Icons.code, 'Lessons'),
//     MenuItem(Icons.format_list_bulleted, 'Podcast'),
//     MenuItem(Icons.format_list_bulleted, 'Store'),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onPanUpdate: (details) {
//         //on swiping left
//         if (details.delta.dx < -6) {
//           Provider.of<MenuController>(context, listen: true).toggle();
//         }
//       },
//       child: Container(
//         padding: EdgeInsets.only(
//             top: 90,
//             left: 12,
//             bottom: 8,
//             right: MediaQuery.of(context).size.width / 2.9),
//         decoration: BoxDecoration(
//             gradient:
//                 LinearGradient(colors: [Color(0xFF000000), Color(0xFFFFFFFF)])),
//         child: Column(
//           children: <Widget>[
//             InkWell(
//               onTap: () {},
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.only(right: 15),
//                     child: Container(
//                       height: 50.0,
//                       width: 50.0,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(50.0)),
//                           image:
//                               DecorationImage(image: NetworkImage(imageUrl))),
//                     ),
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         'Dakota Jonson',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.w600,
//                           fontFamily: "Sofia",
//                           fontSize: 20,
//                         ),
//                       ),
//                       Text(
//                         'bijoy@gmail.com',
//                         style: TextStyle(
//                           color: Colors.white54,
//                           fontFamily: "Sofia",
//                           fontSize: 15,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Spacer(),
//             Column(
//               children: <Widget>[
//                 _listText("Rent", EvaIcons.image),
//                 _listText("Buy", EvaIcons.phone),
//                 _listText("Contact", EvaIcons.settings)
//               ],
//             ),
//             Spacer(),
//             InkWell(
//                 onTap: () {
//                   Get.to(AllAddScreen(),transition: Transition.zoom);
//                 },
//                 child: _listText("All Ads", Icons.adjust_sharp)),
//
//             InkWell(
//                 onTap: () {
//                 Get.to(LoginScreen(),transition: Transition.zoom);
//                 },
//                 child: _listText("Login", Icons.person_outline)),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _listText(String _text, IconData _iconData) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 30.0),
//       child: Row(
//         children: <Widget>[
//           Container(
//             height: 45.0,
//             width: 45.0,
//             decoration: BoxDecoration(),
//             child: Center(
//               child: Icon(
//                 _iconData,
//                 color: Colors.white70,
//               ),
//             ),
//           ),
//           SizedBox(
//             width: 20.0,
//           ),
//           Text(
//             _text,
//             style: TextStyle(
//                 fontFamily: "Sofia",
//                 fontWeight: FontWeight.w600,
//                 color: Colors.white.withOpacity(0.9),
//                 fontSize: 16.0),
//           )
//         ],
//       ),
//     );
//   }
// }
//
// class MenuItem {
//   String title;
//   IconData icon;
//
//   MenuItem(this.icon, this.title);
// }
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:suuq_somali/AllAds/all_add_screen.dart';
import 'package:suuq_somali/Login/login_screen.dart';
import 'package:suuq_somali/property/PropertyPage.dart';

class MenuScreen2 extends StatefulWidget {
  @override
  _MenuScreen2State createState() => _MenuScreen2State();
}

class _MenuScreen2State extends State<MenuScreen2> {
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  final String imageUrl =
      "https://celebritypets.net/wp-content/uploads/2016/12/Adriana-Lima.jpg";

  final List<MenuItem> options = [
    MenuItem(Icons.search, 'Search'),
    MenuItem(Icons.shopping_basket, 'Performance'),
    MenuItem(Icons.favorite, 'Leaderboard'),
    MenuItem(Icons.code, 'Lessons'),
    MenuItem(Icons.format_list_bulleted, 'Podcast'),
    MenuItem(Icons.format_list_bulleted, 'Store'),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        //on swiping left
        if (details.delta.dx < -6) {
          Provider.of<MenuController>(context, listen: true).toggle();
        }
      },
      child: Container(
        padding: EdgeInsets.only(
            top: 60,
            left: 12,
            bottom: 8,
            right: MediaQuery.of(context).size.width / 2.9),
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xFF000000), Color(0xFFFFFFFF)])),
        child: Column(
          children: <Widget>[
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   crossAxisAlignment: CrossAxisAlignment.end,
            //   children: [
            //     IconButton(onPressed: (){},icon: Icon(Icons.close,size:30,color: Colors.red,),),
            //   ],
            // ),

            InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/suuq_logo.png",
                    height: 100,
                    width: 200,
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.only(right: 15),
                  //   child: Container(
                  //     height: 50.0,
                  //     width: 50.0,
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  //         image:DecorationImage(image: AssetImage("assets/images/person.png"),),
                  //
                  //     ),
                  //   ),
                  // ),
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: <Widget>[
                  //     Text(
                  //       "bijoy",
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontWeight: FontWeight.w600,
                  //         fontFamily: "Sofia",
                  //         fontSize: 20,
                  //       ),
                  //     ),
                  //     Text(
                  //       "bijoy.codeware@gmail.com",
                  //       style: TextStyle(
                  //         color: Colors.white54,
                  //         fontFamily: "Sofia",
                  //         fontSize: 15,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
            //   Spacer(),
            SizedBox(
              height: 5,
            ),
            Column(
              children: <Widget>[
                _listText("Rent", EvaIcons.image),
                _listText("Buy", EvaIcons.phone),
                _listText("Contact", EvaIcons.settings)
              ],
            ),
            // Spacer(),
            InkWell(
                onTap: () {
                  Get.to(AllAddScreen(), transition: Transition.zoom);
                },
                child: _listText("All Ads", Icons.add_moderator)),


            InkWell(
                onTap: () {
                  Get.to(LoginScreen(), transition: Transition.zoom);
                },
                child: _listText("Login", Icons.login_outlined)),
          ],
        ),
      ),
    );
  }

  Widget _listText(String _text, IconData _iconData) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30.0),
      child: Row(
        children: <Widget>[
          Container(
            height: 45.0,
            width: 45.0,
            decoration: BoxDecoration(),
            child: Center(
              child: Icon(
                _iconData,
                color: Colors.white70,
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Text(
            _text,
            style: TextStyle(
                fontFamily: "Sofia",
                fontWeight: FontWeight.w600,
                color: Colors.white.withOpacity(0.9),
                fontSize: 16.0),
          )
        ],
      ),
    );
  }
}

class MenuItem {
  String title;
  IconData icon;

  MenuItem(this.icon, this.title);
}
