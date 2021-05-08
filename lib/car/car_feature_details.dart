import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/route_manager.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:suuq_somali/property/conatct_us_details_property.dart';

class CarFeatureDetails extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final String description;
  final String listingAddress;
  final String catNamePropertyForBuy;
  final String typeOfCar;
  final String transmission;
  final String modelYear;
  final String color;
  final String condition;
  final String milage;
  const CarFeatureDetails(
      {Key key,
      this.image,
      this.title,
      this.price,
      this.description,
      this.listingAddress,
      this.catNamePropertyForBuy,
        this.typeOfCar,
        this.transmission,
        this.modelYear,
        this.color,
        this.condition,
        this.milage,


      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Card(
        elevation: 3,
        child: Container(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0, top: 15),
                child: Container(
                  height: 45,
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
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0, top: 15),
                child: Container(
                  height: 45,
                  width: 120,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.redAccent)),
                      child: Icon(Icons.phone_enabled_rounded)),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0.0,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Image.asset(
            "assets/images/suuq_logo.png",
            height: 90,
            width: 140,
          ),
        ),
        leading: new IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
            color: Colors.black,
          ),
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
            color: Colors.black,
          ),
        ],
      ),
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 250,
            child: Swiper(
              scrollDirection: Axis.horizontal,
              //  autoplay: true,
              itemBuilder: (BuildContext context, int index) {
                return Image.network(
                  image,
                  fit: BoxFit.fill,
                  height: 200,
                  width: 100,
                );
              },
              itemCount: image.length,
              // /   pagination: new SwiperPagination(),
              control: new SwiperControl(color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 15),
            child: Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 15),
            child: Text(
              "Sl. Sh ${price}",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 15),
            child: Text(
              "${catNamePropertyForBuy.toString()}",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 15),
            child: Text(
              description,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 15),
            child: Text(listingAddress),
          ),
       Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, top: 15, bottom: 8),
                        child: Text(
                          "More Details",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.person,
                                  color: Colors.red,
                                ),
                                Text(" Type of car:$typeOfCar"),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.tour,
                                  color: Colors.red,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(" Transmission:$transmission"),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.keyboard,
                                  color: Colors.red,
                                ),
                                Text(" Model Year:${modelYear ?? ""}"),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 4.0),
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
                                Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.red,
                                ),
                                Text("Color: $color"),
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, right: 5),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 3.0),
                                    child: Icon(
                                      Icons.adb_sharp,
                                      color: Colors.red,
                                    ),
                                  ),
                                  Text("Condition: ${condition ?? ""}"),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 2.0, right: 3),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.border_style,
                                    color: Colors.red,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: Text("Mileage: $milage"),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                ],
              ),
            ),

          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 15),
            child: Text(
              "Reviews",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/review.jpg",
                      height: 40,
                      width: 50,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                children: [
                  Text(
                    "Admin",
                    style: TextStyle(fontSize: 15),
                  ),
                  SmoothStarRating(
                      allowHalfRating: false,
                      onRated: (v) {},
                      starCount: 5,
                      rating: 3,
                      size: 20.0,
                      isReadOnly: true,
                      color: Colors.green,
                      borderColor: Colors.green,
                      spacing: 0.0),
                  Text(
                    "March 17, 2021",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            thickness: 2,
            indent: 10,
            endIndent: 10,
            color: Colors.grey,
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
