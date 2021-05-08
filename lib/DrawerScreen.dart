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
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suuq_somali/main.dart';
import 'package:suuq_somali/property/PropertyPage.dart';
import 'AllAds/all_add_screen.dart';
import 'package:suuq_somali/widget/drawer_screen_two.dart';

import 'Change_passord/change_password.dart';
import 'Profile/my_profile.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {

  String name;
  String lastName;
  String email;
  String profileImage;

  Future loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString("first_name");
    lastName = prefs.getString("last_name");
    email = prefs.getString("email");
    profileImage = prefs.getString("photo");

    setState(() {});
  }

  String token = "loggedin_token";

  Future<SharedPreferences> getData() async {
    return await SharedPreferences.getInstance();
  }

  // ignore: missing_return
  Future<String> logOut() async {
    SharedPreferences sharedPreferces = await SharedPreferences.getInstance();
    String token = sharedPreferces.getString('loggedin_token');
    if (token != null) {
      await sharedPreferces.clear();
      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SplashScreen()));
      setState(() {});
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SplashScreen()));
      return token;
    }
  }

  //   signOut(SharedPreferences sharedPreferences) async {
  //   String token = sharedPreferences.getString('token');
  //   debugPrint('token is: $token');
  //   final response = await http.get(BaseURL.LOGOUT).then((value) async {
  //     await sharedPreferences.clear();
  //     Navigator.of(context).popUntil((route) => route.isFirst);
  //     Navigator.pop(context);

  //     Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  //   });
  //   return response;
  // }

  @override
  void initState() {
    super.initState();

    loadToken();
    //  logOut();

    //setState(() {});
  }


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
    return FutureBuilder(
      future: getData(),
      builder: (BuildContext cotext,snapshot){
        if(snapshot.hasData && snapshot.data.containsKey('loggedin_token')){
          return  GestureDetector(
            onPanUpdate: (details) {
              //on swiping left
              if (details.delta.dx < -6) {
                Provider.of<MenuController>(context, listen: true).toggle();
              }
            },
            child: Container(
              padding: EdgeInsets.only(
                  top: 70,
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
                  //   children: [
                  //     IconButton(onPressed: (){},icon: Icon(Icons.close,size:30,color: Colors.red,),),
                  //   ],
                  // ),

                  InkWell(
                    onTap: () {},
                    child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Container(
                            height: 50.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                image:
                                DecorationImage(image:  profileImage == null
                                    ? AssetImage("assets/images/person.png")
                                    : NetworkImage(
                                  "",
                                ),)),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Text(
                          "$name $lastName",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Sofia",
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "$email",
                          style: TextStyle(
                            color: Colors.white54,
                            fontFamily: "Sofia",
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
              SizedBox(height: 40,),
              //    Spacer(),
                  Column(
                    children: <Widget>[
                      _listText("Rent", EvaIcons.image),
                      _listText("Buy", EvaIcons.phone),
                      _listText("Contact", EvaIcons.settings)
                    ],
                  ),
                 // Spacer(),
                  SizedBox(height: 20,),

                  InkWell(
                      onTap: () {
                        Get.to(AllAddScreen(),transition: Transition.zoom);
                      },
                      child: _listText("All Ads", Icons.add_moderator),),
                  InkWell(
                      onTap: () {
                        Get.to(ProfilePage(),transition: Transition.zoom);
                      },
                      child: _listText("Profile", Icons.person_outline)),
                  InkWell(
                      onTap: () {
                        Get.to(ChangepasswordScreen(),transition: Transition.zoom);
                      },
                      child: _listText("Change Password", Icons.person_outline)),

                  InkWell(
                      onTap: () {
                        _dialogLogOut();
                      },
                      child: _listText("Logout", FontAwesomeIcons.lock,)),

                ],
              ),
            ),
          );
        }else{
          return MenuScreen2();
        }
      },
    );


  }
  _dialogLogOut() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(('Logout!')),
          content: Text(('Do you want to logout?')),
          actions: <Widget>[
            // ignore: deprecated_member_use
            FlatButton(
              child: Text(
                ('No'),
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop(false); //Will not exit the App
              },
            ),
            // ignore: deprecated_member_use
            FlatButton(
              child: Text(
                ('Yes'),
                style: TextStyle(color: Colors.indigo[800]),
              ),
              onPressed: () {
                logOut();
              },
            )
          ],
        );
      },
    );
  }

  Widget _listText(String _text, IconData _iconData) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30.0),
      child: Row(
        children: <Widget>[
          Container(
            height: 15.0,
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
