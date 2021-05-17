import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:suuq_somali/property/conatct_us_details_property.dart';
import 'package:suuq_somali/utils/app_theme.dart';
import 'package:suuq_somali/widget/report_ad_page.dart';

class PropertyDetails extends StatefulWidget {
  final String image;
  final String title;
  final String price;
  final String description;
  final String listingAddress;
  final String catNamePropertyForBuy;
  final String propertyType;
  final String bathrooms;
  final String buildYear;
  final String enterHouseSize;
  final String rooms;
  final String carSpace;
  final String location;
  final int submissionDate;

  const PropertyDetails({
    Key key,
    this.image,
    this.title,
    this.price,
    this.description,
    this.listingAddress,
    this.catNamePropertyForBuy,
    this.propertyType,
    this.bathrooms,
    this.buildYear,
    this.enterHouseSize,
    this.rooms,
    this.carSpace,
    this.location,
    this.submissionDate,
  }) : super(key: key);

  @override
  _PropertyDetailsState createState() => _PropertyDetailsState();
}

class _PropertyDetailsState extends State<PropertyDetails> {
  var now = new DateTime.now();
  var formatter = new DateFormat('MM');
  String readTimestamp(int timestamp) {
    var now = new DateTime.now();
    var format = new DateFormat('HH:mm a');
    var date = new DateTime.fromMicrosecondsSinceEpoch(timestamp);
    var diff = date.difference(now);
    var time = '';

    if (diff.inSeconds <= 0 ||
        diff.inSeconds > 0 && diff.inMinutes == 0 ||
        diff.inMinutes > 0 && diff.inHours == 0 ||
        diff.inHours > 0 && diff.inDays == 0) {
      time = format.format(date); // Doesn't get called when it should be
    } else {
      time =
          diff.inDays.toString() + 'DAYS AGO'; // Gets call and it's wrong date
    }

    return time;
  }

  DateTime convertTimeStampToDateTime(int timeStamp) {
    var dateToTimeStamp = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    return dateToTimeStamp;
  }

  String convertTimeStampToHumanDate(int timeStamp) {
    var dateToTimeStamp = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    return DateFormat('dd/MM/yyyy').format(dateToTimeStamp);
  }

  String convertTimeStampToHumanHour(int timeStamp) {
    var dateToTimeStamp = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    return DateFormat('HH:mm').format(dateToTimeStamp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 4, right: 3),
                child: Container(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(ContactUsScreen(), transition: Transition.zoom);
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black)),
                    child: Text(
                      "Contact Seller",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(),
                child: Container(
                  padding: const EdgeInsets.only(left: 4, right: 3),
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.redAccent)),
                      child: Icon(Icons.phone_enabled_rounded)),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: HexColor("#dc3545"),
        elevation: 1,
        title: Text(
          "Details",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        leading: new IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
            color: Colors.white,
          ),
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
            color: Colors.white,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.grey[200]),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(color: Colors.black12),
                  alignment: Alignment.center,
                  height: 200,
                  width: 300,
                  child: Swiper(
                    scrollDirection: Axis.horizontal,
                    //  autoplay: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.network(
                            widget.image,
                            fit: BoxFit.cover,
                            height: 200,
                            width: 300,
                          ),

                          Padding(
                            padding:
                                const EdgeInsets.only(top: 138.0, left: 150),
                            child: Image.asset(
                              "assets/images/spp.png",
                              cacheHeight: 40,
                              color: Colors.white,
                            ),
                          ),

                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.end,
                          //   crossAxisAlignment: CrossAxisAlignment.end,
                          //   children: [
                          //     Padding(
                          //       padding: const EdgeInsets.only(top:155.0,right: 90),
                          //       child: Image.asset("assets/images/spp.png",height: 40,color: Colors.white,),
                          //     ),
                          //   ],
                          // ),
                        ],
                      );
                    },
                    itemCount: widget.image.length,
                    // /   pagination: new SwiperPagination(),
                    control: new SwiperControl(color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 15),
              child: Text(
                widget.title,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 15),
                  child: Text(
                    " Posted on ${convertTimeStampToHumanDate(widget.submissionDate)} ${readTimestamp(widget.submissionDate)}",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 15),
              child: Text(
                widget.location.toString(),
                maxLines: 2,
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Divider(
                indent: 10,
                endIndent: 20,
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 10),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "\$ ${widget.price}",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: "           Negotiable",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Divider(
                indent: 10,
                endIndent: 20,
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 6),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Row(
                      children: [

                        Text(
                            " Property Type :           ${widget.propertyType}"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0, top: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                              "Bathrooms                    ${widget.bathrooms}"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0, top: 3),
                    child: Row(
                      children: [

                        Text(
                            " Enter House Size:                       ${widget.enterHouseSize ?? ""}"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0, top: 8),
                    child: Column(
                      // mainAxisAlignment:
                      //     MainAxisAlignment.start,
                      // crossAxisAlignment:
                      //     CrossAxisAlignment.start,
                      children: [
                        Row(
                          // mainAxisAlignment:
                          //     MainAxisAlignment.start,
                          // crossAxisAlignment:
                          //     CrossAxisAlignment.start,
                          children: [

                            Text(
                                "  Rooms:                           ${widget.rooms}"),
                          ],
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Row(
                          children: [

                            Text(
                                "  Car Space:                      ${widget.carSpace}"),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 2.0, right: 3, top: 8),
                          child: Row(
                            children: [

                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                    " Build Year:                     ${widget.buildYear}"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Divider(
                indent: 10,
                endIndent: 20,
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 10),
              child: Text(
                "Type : ${widget.catNamePropertyForBuy.toString()}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 10),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "Description",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black)),
                  TextSpan(
                      text: "        ${widget.description}",
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 15, right: 15),
              child: Text(widget.listingAddress),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Divider(
                indent: 10,
                endIndent: 20,
                thickness: 1,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.close),
                SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(ReportAddScreen(), transition: Transition.zoom);
                  },
                  child: Container(
                    child: Text(
                      "Report This Ad",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Divider(
                indent: 10,
                endIndent: 20,
                thickness: 1,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/ddd.png",
                  height: 30,
                ),
                SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: () {
                    _dialougeStaySafe();
                  },
                  child: Container(
                    child: Text(
                      "Stay safe on Suuq!",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }

  _dialougeStaySafe() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            ('Stay safe on Suuq.com'),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      ". ",
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      "Always meet the seller in person",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      ". ",
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      "Don't pay for anything untill you have\n seen what you are getting",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Text(
                        ". ",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Text(
                      "Don't send or write money to anyone\n you don't know.",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    "Watch out for:",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      ". ",
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      "Unrealistic prices",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      ". ",
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      "Extra fees",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      ". ",
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      "Request for advanced payment",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 1.0),
                      child: Text(
                        ". ",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Text(
                      "request for personal information.",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
               // Row(
               //   mainAxisAlignment: MainAxisAlignment.center,
               //   crossAxisAlignment: CrossAxisAlignment.center,
               //   children: [
               //     GestureDetector(
               //       child: Container(
               //         child: Text(
               //           "More on staying safe  ",
               //           style: TextStyle(fontSize: 14,color: Colors.red),
               //         ),
               //       ),
               //     ),
               //     Icon(Icons.arrow_forward_ios_rounded,color: Colors.red,size: 20,),
               //   ],
               // )
              ],
            ),
          ),
        );
      },
    );
  }
}
