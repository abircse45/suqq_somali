import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suuq_somali/Change_passord/change_password.dart';
import 'package:suuq_somali/DrawerScreen.dart';
import 'package:get/route_manager.dart';
import 'package:suuq_somali/View_listing/my_listing.dart';
import '../main.dart';
import 'constant.dart';
import 'my_profile.dart';


class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String firstName;
  String lastName;
  String email;
  String profileImage;
  int id = 0;
  String singInText = "Please Sign In for continue";

  Future<String> getUserData() async {
    print("Get usewr daTA");
    // set User Data....>>>>
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    firstName = sharedPreferences.getString('first_name');
    lastName = sharedPreferences.getString('last_name');
    email = sharedPreferences.getString('email');
    //profileImage = sharedPreferences.getString("photo");

    print("SharedData>>>>${sharedPreferences.getString('firstName')}");

    setState(() {});
  }

  String token;

  // Future<String> getToken() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   profileImage = sharedPreferences.getString("photo");
  //   // token = sharedPreferences.getString("token");
  // }

  Future<String> logOut() async {
    SharedPreferences sharedPreferces = await SharedPreferences.getInstance();
    String token = sharedPreferces.getString('loggedin_token');
    if (token != null) {
      await sharedPreferces.clear();
      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SplashScreen()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SplashScreen()));
      return token;
    }
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  //  getToken();
    // logOut();
  }

  // FutureOr onGoBack(dynamic value) {
  //   getToken();
  //   getUserData();
  //   reloadProfileScreen();
  //   setState(() {});
  // }

  // void navigateSecondPage(String from) {
  //   Route route =
  //       MaterialPageRoute(builder: (context) => LoginWidget(type: from));
  //   Navigator.push(context, route).then(onGoBack);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black54),
        backgroundColor: HexColor("#dc3545"),
        title: Text("Account",style: TextStyle(fontSize: 17,color: Colors.white),),
        // title: Image.asset(
        //   "assets/images/suuq_logo.png",
        //   height: 90,
        //   width: 170,
        // ),
    //    centerTitle: true,
actions: [
  IconButton(icon: Icon(Icons.settings,color: Colors.white,size: 25,), onPressed: (){
    Get.to(ChangepasswordScreen(),transition: Transition.zoom);
  })
],
      ),
     // drawer: MenuScreen(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[400]
              ),
              height: 60,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left:28.0,top: 18),
                child: Text( "$firstName $lastName",style: TextStyle(fontSize: 18),),
              ),

            ),
            // Row(
            //   children: [
            //     Column(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Padding(
            //           padding: const EdgeInsets.only(left: 18.0),
            //           child: Text(
            //             "$firstName $lastName",
            //             style: TextStyle(
            //                 fontSize: 18, fontWeight: FontWeight.bold,fontFamily: "Droid Serif"),
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.only(left: 18.0, top: 4),
            //           child: Text(
            //             "$email",
            //             style: TextStyle(fontSize: 17,fontFamily: "Droid Serif"),
            //           ),
            //         ),
            //         //Spacer(),
            //       ],
            //     ),
            //     Spacer(),
            //     Padding(
            //       padding: const EdgeInsets.only(right: 18.0, top: 10),
            //       child: CircleAvatar(
            //         backgroundColor: Colors.black,
            //         radius: 35.0,
            //         child: Center(
            //           child: CircleAvatar(
            //             backgroundColor: Colors.white,
            //             radius: 32.0,
            //             backgroundImage: profileImage == null
            //                 ? AssetImage("assets/images/person.png")
            //                 : NetworkImage(
            //               "https://vromonbuzz.com/" + "$profileImage",
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),

            Divider(
              thickness: 1,
              indent: 17,
              endIndent: 17,
            ),
            Card(
              elevation: 0,
              child: ListTile(
                onTap: () {
              Get.to(ProfilePage(),transition: Transition.zoom);
                },
                title: Text(
                  "My Profile",
                  style: TextStyle(fontSize: 18,fontFamily: "Droid Serif"),
                ),
                trailing: Icon(Icons.person_outline),
              ),
            ),
            Divider(
              thickness: 1,
              indent: 17,
              endIndent: 17,
            ),
            Card(
              elevation: 0,
              child: ListTile(
                onTap: () {
                  Get.to(MyListingScreen(),transition: Transition.zoom);
                },
                title: Text(
                  "Listing",
                  style: TextStyle(fontSize: 18,fontFamily: "Droid Serif"),
                ),
                trailing: Icon(Icons.list),
              ),
            ),

            Divider(
              thickness: 1,
              indent: 17,
              endIndent: 17,
            ),
            Card(
              elevation: 0,
              child: ListTile(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => ChangepasswordScreen()));
                },
                title: Text(
                  "Review",
                  style: TextStyle(fontSize: 18,fontFamily: "Droid Serif"),
                ),
                trailing: Icon(Icons.lock_outlined),
              ),
            ),
            Divider(
              thickness: 1,
              indent: 17,
              endIndent: 17,
            ),
            Card(
              elevation: 0,
              child: ListTile(
                onTap: () {

                },
                title: Text(
                  "Favourite",
                  style: TextStyle(fontSize: 18,fontFamily: "Droid Serif"),
                ),
                trailing: Icon(Icons.favorite_border),
              ),
            ),
            Divider(
              thickness: 1,
              indent: 17,
              endIndent: 17,
            ),
            Card(
              elevation: 0,
              child: ListTile(
                onTap: () {

                },
                title: Text(
                  "Stay Safe",
                  style: TextStyle(fontSize: 18,fontFamily: "Droid Serif"),
                ),
                trailing: Icon(Icons.sanitizer),
              ),
            ),
            // Card(
            //   elevation: 0,
            //   child: ListTile(
            //     onTap: () {
            //       Navigator.push(context,
            //           MaterialPageRoute(builder: (context) => MyDocuments()));
            //     },
            //     title: Text(
            //       "My Document",
            //       style: TextStyle(fontSize: 18),
            //     ),
            //     trailing: Icon(Icons.description_sharp),
            //   ),
            // ),
            Divider(
              thickness: 1,
              indent: 17,
              endIndent: 17,
            ),
            Card(
              elevation: 0,
              child: ListTile(
                onTap: () {
                  _dialogLogOut();
                },
                title: Text(
                  "Log Out",
                  style: TextStyle(fontSize: 18,fontFamily: "Droid Serif"),
                ),
                trailing: Icon(Icons.logout),
              ),
            ),
            Divider(
              thickness: 1,
              indent: 17,
              endIndent: 17,
            ),
          ],
        ),
      ),
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
            FlatButton(
              child: Text(
                ('No'),
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop(false); //Will not exit the App
              },
            ),
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


}
