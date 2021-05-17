import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suuq_somali/exception/no_data_available.dart';
import 'package:suuq_somali/models/my_listings_model.dart';
import 'package:http/http.dart' as http;
import 'package:suuq_somali/utils/app_theme.dart';

class MyListingScreen extends StatefulWidget {
  @override
  _MyListingScreenState createState() => _MyListingScreenState();
}

class _MyListingScreenState extends State<MyListingScreen> {



  Future <void> deleteImage(var image)async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var id = sharedPreferences.getString("id");
    var token = sharedPreferences.getString("loggedin_token");
    var headers = {"Accept": "application/json"};
    Map bodyMap = {
      "main_pic" : image,
      "userid": id,
      "token": token,
    };

    String url = 'https://suuq.cwprojects.xyz/user/process-remove-main-pic.php';
    print("Url : $url");
    print("id : $id");
    print("Token : $token");
    print("Image : $image");
    final response =
    await http.post(Uri.parse(url), body: bodyMap, headers: headers);
    try {
      if (response.statusCode == 200) {
        print("Response Data :  ${response.body}");

      } else {
        throw Exception();
      }
    } catch (e) {
      throw e;
    }
  }

  Future<List<Listing>> getListing() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var id = sharedPreferences.getString("id");
    var token = sharedPreferences.getString("loggedin_token");
    var headers = {"Accept": "application/json"};
    Map bodyMap = {
      "token": token,
      "userid": id,
    };

    String url = "https://suuq.cwprojects.xyz/api/user/my-listings";

    print("Url : $url");
    final response =
        await http.post(Uri.parse(url), body: bodyMap, headers: headers);
    try {
      if (response.statusCode == 200) {
        print("Response Data :  ${response.body}");
        return MyListingModel.fromJson(jsonDecode(response.body)).listings;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#ededed"),
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
      ),
      body: FutureBuilder<List<Listing>>(
        future: getListing(),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            final list = snapshot.data;
            return list != null
                ? ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: list.length,
                    itemBuilder: (_, index) {
                      return  Card(
                          color: Colors.white,
                          margin:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                          elevation: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                   Stack(
                                     children: [
                                       Card(
                                         elevation: 1,
                                         child: Padding(
                                           padding: const EdgeInsets.only(
                                               top: 32.0, left: 8),
                                           child: ClipRRect(
                                             borderRadius:
                                             BorderRadius.circular(5),
                                             child: Image.network(
                                               list[index].photoUrl,
                                               height: 130,
                                               width: 190,
                                               fit: BoxFit.cover,
                                             ),
                                           ),
                                         ),
                                       ),
                                       IconButton(icon: Icon(Icons.close,color: Colors.black,size: 30,), onPressed: (){
                                         deleteImage(list[index].listingLink);
                                         setState(() {

                                         });
                                       }),
                                     ],
                                   ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5.0, top: 30),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 9.0),
                                                  child: Text(
                                                    list[index].listingTitle,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.all(8),
                                                  margin: EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: Colors.blueGrey,
                                                  ),
                                                  child: Text(
                                                    list[index].status,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 12.0),
                                                  child: Text(
                                                    list[index].description,
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 8,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 12.0),
                                                  child: Text(
                                                    list[index]
                                                        .submissionDate
                                                        .toString(),
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),

                      );
                    },
                  )
                : NoDatAvailable();
          } else {
            return Center(
              child: SpinKitRing(
                color: Colors.red,
                size: 36,
              ),
            );
          }
        },
      ),
    );
  }
}
