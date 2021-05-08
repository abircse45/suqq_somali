import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:suuq_somali/Top_Category/category_all_search_controller.dart';
import 'package:suuq_somali/models/all_ads_model.dart';

import 'package:get/get.dart';

typedef g = StateValue Function(StateValue);

class LocationSearch extends StatefulWidget {

  @override
  _LocationSearchState createState() => _LocationSearchState();
  g callback;
  LocationSearch(this.callback);

}

class _LocationSearchState extends State<LocationSearch> {
  final allLoc = Get.put(CategoryAllSearchController());
  // Future<List<ListItem>> getBlogListJsonData() async {
  //   String url = "https://suuq.cwprojects.xyz/api/results";
  //
  //   print("Url : $url");
  //   final response = await http.get(Uri.parse(url));
  //   try {
  //     if (response.statusCode == 200) {
  //       print("Response Popular Json Data :  ${response.body}");
  //       return AllSearch.fromJson(jsonDecode(response.body)).listItems;
  //     } else {
  //       throw Exception();
  //     }
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  String searchS;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Pick a Location"),
      ),
      body: ListView(
        shrinkWrap: true,
          primary: false,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: Color(0xFFE0E0E0),
                borderRadius: BorderRadius.all(Radius.circular(0)),
              ),
              child: TextField(
                onChanged: (value) {
                  setState(
                    () {
                      searchS = value;
                    },
                  );
                },
                cursorColor: Colors.grey,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 25,
                    ),
                    border: InputBorder.none,
                    hintText: "Search for a location",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0)),
              ),
            ),
             Obx(
                () {
                  if (allLoc.allSearchLoading.value) {
                    return Center(
                      child: SpinKitChasingDots(
                        color: Colors.red,
                        size: 35,
                      ),
                    );
                  }
                  return   ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: allLoc.getAllSearch.value.cities.length,
                      itemBuilder: (_, index) {
                        var location = allLoc.getAllSearch.value.cities[index];
                        if (searchS == null || searchS == "") {
                          return Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: ListTile(
                              onTap: (){
                               StateValue stateValue = StateValue(stateId: location.stateId,stateName: location.stateName,slug: location.slug,countryAbbr: null,countryId: location.countryId);
                               // Navigator.pop(context,location.stateName);
                                widget.callback(stateValue);
                                 // Get.to(SearchPage(cityName: location.stateName,));
                                 Navigator.pop(
                                     context);
                              },
                              title: Text(location.stateName),
                            ),
                          );
                        } else {
                          if (location.stateName
                              .toLowerCase()
                              .contains(searchS.toLowerCase())) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: ListTile(
                                onTap: () {
                                  StateValue stateValue = StateValue(stateId: location.stateId,stateName: location.stateName,slug: location.slug,countryAbbr: null,countryId: location.countryId);
                                  // Navigator.pop(context,location.stateName);
                                  widget.callback(stateValue);
                                  // Get.to(SearchPage(cityName: location.stateName,));
                                  Navigator.pop(
                                      context);
                                },
                                title: Text(location.stateName),
                              ),
                            );
                          }
                        }
                        return Container();
                      },

                  );
                },
              ),

              // FutureBuilder<List<ListItem>>(
              //   future: getBlogListJsonData(),
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       final list = snapshot.data;
              //       return ListView.builder(
              //         shrinkWrap: true,
              //         primary: false,
              //         itemCount: list.length,
              //         itemBuilder: (_, index) {
              //           final item = list[index];
              //           if (searchS == null || searchS == "") {
              //             return Padding(
              //               padding: const EdgeInsets.only(left: 8.0),
              //               child: ListTile(
              //                 onTap: () {
              //                   Get.to(SearchPage(cityName: item.cityName,));
              //                 },
              //                 title: Text(item.cityName),
              //               ),
              //             );
              //           } else {
              //             if (list[index]
              //                 .cityName
              //                 .toLowerCase()
              //                 .contains(searchS.toLowerCase())) {
              //               return Padding(
              //                 padding: const EdgeInsets.only(left: 8.0),
              //                 child: ListTile(
              //                   onTap: () {
              //                     Get.to(SearchPage(cityName: item.cityName,));
              //                   },
              //                   title: Text(item.cityName),
              //                 ),
              //               );
              //             }
              //           }
              //           return Container();
              //         },
              //       );
              //     } else
              //       return Center(
              //         child: SpinKitChasingDots(
              //           color: Colors.red,
              //           size: 30,
              //         ),
              //       );
              //   },
              // ),

          ],
        ),

    );
  }

}
