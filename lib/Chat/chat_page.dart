import 'package:flutter/material.dart';
import 'package:suuq_somali/DrawerScreen.dart';

class ChatPage extends StatelessWidget {
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
