import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suuq_somali/Bottom_search/search_page.dart';
import 'package:suuq_somali/Chat/chat_page.dart';
import 'package:suuq_somali/DrawerScreen.dart';
import 'package:suuq_somali/Login/login_screen.dart';
import 'package:suuq_somali/Profile/my_profile.dart';
import 'package:suuq_somali/Profile/user_profile.dart';
import 'package:suuq_somali/create_listing/create_listing_item_tile.dart';

import 'category.dart';

class TabBarScreen extends StatefulWidget {
  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  int _currentIndex = 0;
  var token;

  Future checkLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString("loggedin_token");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _getNavigationButton(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: () {
            Get.to(CreateListingItem());
          },
          child: Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: MenuScreen(),
      body: _screenItem(),
    );
  }

  Widget _getNavigationButton() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black12, width: 1.0),
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(25.0),
              topRight: const Radius.circular(25.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      _currentIndex = 0;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        color: _currentIndex == 0 ? Colors.red : Colors.black,
                        size: 30,
                      ),
                      SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _currentIndex = 1;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search,
                        color: _currentIndex == 1 ? Colors.red : Colors.black,
                        size: 30,
                      ),
                      SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      _currentIndex = 2;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.chat_outlined,
                        color: _currentIndex == 2 ? Colors.red : Colors.black,
                        size: 30,
                      ),
                      SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _currentIndex = 3;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person_outline,
                        color: _currentIndex == 3 ? Colors.red : Colors.black,
                        size: 30,
                      ),
                      SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _screenItem() {
    return IndexedStack(
      index: _currentIndex,
      children: [
        MarketScreen(),
        SearchPage(),
        ChatPage(),
        token == null ? LoginScreen() : UserProfile(),
      ],
    );
  }
}
