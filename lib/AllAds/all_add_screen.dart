import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:html_character_entities/html_character_entities.dart';
import 'package:suuq_somali/controller/all_ads_controller.dart';
import 'package:suuq_somali/utils/app_theme.dart';
import 'package:url_launcher/url_launcher.dart'as  UrlLauncher;

import 'all_ads_details_screen.dart';

class AllAddScreen extends StatelessWidget {
  final allAdsController = Get.put(AllAdsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#ededed"),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 1,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Image.asset(
            "assets/images/suuq_logo.png",
            height: 90,
            width: 170,
          ),
        ),
      ),
      body: Obx(() {
        if (allAdsController.allAdsLoading.value) {
          return  Center(
            child: SpinKitChasingDots(
              color: Colors.red,
              size: 50.0,
            ),
          );
        }
        return ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("All Ads",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Divider(
              thickness: 2,
              color: Colors.grey,
              indent: 12,
              endIndent: 5,
            ),
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: allAdsController.getAllAds.value.listItems.length,
              itemBuilder: (_, index) {
                var alladsData = allAdsController.getAllAds.value.listItems[index];
                return
                  InkWell(
                    onTap: (){
                      Get.to(AllAdsDetailsPage(
                        appBarTitle: alladsData.listingTitle,
                        image: alladsData.mainPicUrl,
                        title: alladsData.listingTitle,
                        price: alladsData.listingPrice,
                        description: alladsData.shortDesc,

                      ),transition: Transition.zoom);
                    },
                    child: Card(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                 Padding(
                                   padding: const EdgeInsets.only(top:32.0,left: 8),
                                   child: ClipRRect(
                                     borderRadius: BorderRadius.circular(5),
                                     child: Image.network(
                                        alladsData.mainPicUrl,
                                        height: 140,
                                        width: 120,
                                       fit: BoxFit.cover,

                                      ),
                                   ),
                                 ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left:5.0,top: 30),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left:9.0),
                                            child: Text(
                                                HtmlCharacterEntities.decode(alladsData.listingTitle,),
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left:9.0,top: 9),
                                            child: Text(
                                              "Sl. Sh.${alladsData.listingPrice}",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left:12.0),
                                            child: Text(
                                              alladsData.shortDesc,
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ),
                                          SizedBox(height: 8,),
                                          Padding(
                                            padding: const EdgeInsets.only(left:5.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Icon(Icons.add_location,color: Colors.red,size: 25,),
                                                SizedBox(width: 5,),
                                                Expanded(
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(right:4.0),
                                                    child: Text(
                                                      "${alladsData.address} , ${alladsData.address}",
                                                      style: TextStyle(fontSize: 13),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 8,),
                                          Padding(
                                            padding: const EdgeInsets.only(left:6.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Icon(Icons.app_settings_alt,color: Colors.red,size: 20,),
                                                SizedBox(width: 5,),
                                                Expanded(
                                                  child: Text(
                                                    "Name",
                                                    style: TextStyle(fontSize: 13),
                                                  ),
                                                ),
                                                SizedBox(height: 5,),
                                                Icon(Icons.aspect_ratio_rounded,color: Colors.red,size: 20,),
                                                SizedBox(width: 5,),
                                                SizedBox(height: 5,),
                                                Expanded(
                                                  child: Text(
                                                    "New",
                                                    style: TextStyle(fontSize: 13),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 5,),
                                       Row(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           Padding(
                                             padding: const EdgeInsets.only(
                                                 left: 5.0, right: 5.0),
                                             child: new ElevatedButton(
                                               onPressed: () {
                                               UrlLauncher.launch(
                                                     'tel:+${alladsData.phone.toString()}');
                                               },
                                               style: ButtonStyle(
                                                   backgroundColor:
                                                   MaterialStateProperty.all<Color>(
                                                       HexColor("#dc3545"))),
                                               child: Text("  Call  "),
                                             ),
                                           ),
                                           Padding(
                                             padding: const EdgeInsets.only(
                                                 left: 45.0, right: 5.0),
                                             child: new ElevatedButton(
                                               onPressed: () {
                                                 UrlLauncher.launch(
                                                     'mailto:info@suuqsomali.com');
                                               },
                                               style: ButtonStyle(
                                                   backgroundColor:
                                                   MaterialStateProperty.all<Color>(
                                                       HexColor("#dc3545"))),
                                               child: Text(" Email "),
                                             ),
                                           ),
                                         ],
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
                ),
                  );
              },
            ),
          ],
        );
      }),
    );
  }
}
