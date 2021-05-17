import 'package:flutter/material.dart';
import 'package:suuq_somali/DrawerScreen.dart';
import 'package:suuq_somali/Profile/constant.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black54),
        backgroundColor: HexColor("#dc3545"),
        title: Text("My Chats",style: TextStyle(fontSize: 16,color: Colors.white),),
        // title: Image.asset(
        //   "assets/images/suuq_logo.png",
        //   height: 90,
        //   width: 170,
        // ),
        //centerTitle: true,
        // actions: [
        //   IconButton(
        //       icon: Icon(
        //         Icons.notifications_outlined,
        //         size: 30,
        //       ),
        //       onPressed: () {}),
        // ],
      ),
    //  drawer: MenuScreen(),
      body:    Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Upcoming",style: TextStyle(fontSize: 18),),
            ],
          ),
        ),
      ),
    );


  }
}
