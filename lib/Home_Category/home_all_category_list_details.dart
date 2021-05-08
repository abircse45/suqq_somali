import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeAllCategoryListDetails extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final String description;

  const HomeAllCategoryListDetails(
      {Key key, this.image, this.title, this.price, this.description})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              "Sl. Sh ${price}",
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("More Details",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Condition :",style: TextStyle(fontSize: 20),),
          ),
        ],
      ),
    );
  }
}
