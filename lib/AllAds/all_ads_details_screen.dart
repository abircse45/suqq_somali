import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:html_character_entities/html_character_entities.dart';
import 'package:suuq_somali/Profile/constant.dart';

class AllAdsDetailsPage extends StatelessWidget {
  final String image;
  final String appBarTitle;
  final String title;
  final String price;
  final String description;

  const AllAdsDetailsPage(
      {Key key, this.image,this.appBarTitle, this.title, this.price, this.description})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: HexColor("#dc3545"),
        elevation: 1,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Text(
            HtmlCharacterEntities.decode(appBarTitle,),
            style: TextStyle(
                fontSize: 18,
                color: Colors.white,
               ),
          ),)
        ),

      body: ListView(
        shrinkWrap: true,
        primary: false,
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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 15),
            child: Text(
              "\$ $price",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 12.0,
              top: 15,
            ),
            child: Text(
              description,
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(height: 15,),


        ],
      ),
    );
  }
}
