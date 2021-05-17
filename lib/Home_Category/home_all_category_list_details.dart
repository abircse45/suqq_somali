import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:suuq_somali/Profile/constant.dart';

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
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: HexColor("#dc3545"),
        elevation: 1,
        centerTitle: true,
        title: Text(title,style: TextStyle(fontSize: 15,color: Colors.white),),
      ),
      body: ListView(
        shrinkWrap: true,
        primary: false,
        children: [
          Container(
            height: 200,
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
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 15),
            child: Text(
              "\$${price}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 12.0,
              top: 15,
            ),
            child: Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(height: 15,),

          Padding(
            padding: const EdgeInsets.only(left:12.0),
            child: Text("More Details",style: TextStyle(fontSize: 18),),
          )


        ],
      ),
    );
  }
}
