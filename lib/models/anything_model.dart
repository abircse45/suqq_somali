// To parse this JSON data, do
//
//     final anything = anythingFromJson(jsonString);

import 'dart:convert';

Anything anythingFromJson(String str) => Anything.fromJson(json.decode(str));

String anythingToJson(Anything data) => json.encode(data.toJson());

class Anything {
  Anything({
    this.status,
    this.cats,
  });

  int status;
  List<Cat> cats;

  factory Anything.fromJson(Map<String, dynamic> json) => Anything(
    status: json["status"],
    cats: List<Cat>.from(json["cats"].map((x) => Cat.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "cats": List<dynamic>.from(cats.map((x) => x.toJson())),
  };
}

class Cat {
  Cat({
    this.catId,
    this.catName,
    this.catSlug,
    this.catPlural,
    this.catIcon,
    this.catOrder,
    this.catImg,
  });

  String catId;
  String catName;
  String catSlug;
  String catPlural;
  String catIcon;
  String catOrder;
  String catImg;

  factory Cat.fromJson(Map<String, dynamic> json) => Cat(
    catId: json["cat_id"],
    catName: json["cat_name"],
    catSlug: json["cat_slug"],
    catPlural: json["cat_plural"],
    catIcon: json["cat_icon"],
    catOrder: json["cat_order"],
    catImg: json["cat_img"],
  );

  Map<String, dynamic> toJson() => {
    "cat_id": catId,
    "cat_name": catName,
    "cat_slug": catSlug,
    "cat_plural": catPlural,
    "cat_icon": catIcon,
    "cat_order": catOrder,
    "cat_img": catImg,
  };
}
