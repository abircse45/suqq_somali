// To parse this JSON data, do
//
//     final abir = abirFromJson(jsonString);

import 'dart:convert';

SubCategoryList abirFromJson(String str) => SubCategoryList.fromJson(json.decode(str));

String abirToJson(SubCategoryList data) => json.encode(data.toJson());

class SubCategoryList {
  SubCategoryList({
    this.status,

    this.listItems,
  });

  int status;

  List<ListItemAbir> listItems;

  factory SubCategoryList.fromJson(Map<String, dynamic> json) => SubCategoryList(
    status: json["status"],
    listItems: List<ListItemAbir>.from(json["list_items"].map((x) => ListItemAbir.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,

    "list_items": List<dynamic>.from(listItems.map((x) => x.toJson())),
  };
}






class ListItemAbir {
  ListItemAbir({
    this.listingId,
    this.address,
    this.areaCode,
    this.catIcon,
    this.catName,
    this.catSlug,
    this.cityName,
    this.citySlug,
    this.countryCall,
    this.countryName,
    this.isFeat,
    this.lat,
    this.listingLink,
    this.listingPrice,
    this.listingSlug,
    this.listingTitle,
    this.lng,
    this.mainPicUrl,
    this.phone,
    this.photoUrl,
    this.postalCode,
    this.rating,
    this.shortDesc,
    this.stateId,
    this.stateAbbr,
    this.stateSlug,
    this.mainCatId,
    this.mainCatSlug,
    this.submissionDate,
  });

  String listingId;
  String address;
  String areaCode;
  String catIcon;
  String catName;
  String catSlug;
  String cityName;
  String citySlug;
  String countryCall;
  String countryName;
  String isFeat;
  String lat;
  String listingLink;
  String listingPrice;
  String listingSlug;
  String listingTitle;
  String lng;
  String mainPicUrl;
  String phone;
  String photoUrl;
  String postalCode;
  String rating;
  String shortDesc;
  String stateId;
  String stateAbbr;
  String stateSlug;
  String mainCatId;
  String mainCatSlug;
  int submissionDate;

  factory ListItemAbir.fromJson(Map<String, dynamic> json) => ListItemAbir(
    listingId: json["listing_id"],
    address: json["address"],
    areaCode: json["area_code"],
    catIcon: json["cat_icon"],
    catName: json["cat_name"],
    catSlug: json["cat_slug"],
    cityName: json["city_name"],
    citySlug: json["city_slug"],
    countryCall: json["country_call"],
    countryName: json["country_name"],
    isFeat: json["is_feat"],
    lat: json["lat"],
    listingLink: json["listing_link"],
    listingPrice: json["listing_price"],
    listingSlug: json["listing_slug"],
    listingTitle: json["listing_title"],
    lng: json["lng"],
    mainPicUrl: json["main_pic_url"],
    phone: json["phone"],
    photoUrl: json["photo_url"],
    postalCode: json["postal_code"],
    rating: json["rating"],
    shortDesc: json["short_desc"],
    stateId: json["state_id"],
    stateAbbr: json["state_abbr"],
    stateSlug: json["state_slug"],
    mainCatId: json["main_cat_id"],
    mainCatSlug: json["main_cat_slug"],
    submissionDate: json["submission_date"],
  );

  Map<String, dynamic> toJson() => {
    "listing_id": listingId,
    "address": address,
    "area_code": areaCode,
    "cat_icon": catIcon,
    "cat_name": catName,
    "cat_slug": catSlug,
    "city_name": cityName,
    "city_slug": citySlug,
    "country_call": countryCall,
    "country_name": countryName,
    "is_feat": isFeat,
    "lat": lat,
    "listing_link": listingLink,
    "listing_price": listingPrice,
    "listing_slug": listingSlug,
    "listing_title": listingTitle,
    "lng": lng,
    "main_pic_url": mainPicUrl,
    "phone": phone,
    "photo_url": photoUrl,
    "postal_code": postalCode,
    "rating": rating,
    "short_desc": shortDesc,
    "state_id": stateId,
    "state_abbr": stateAbbr,
    "state_slug": stateSlug,
    "main_cat_id": mainCatId,
    "main_cat_slug": mainCatSlug,
    "submission_date": submissionDate,
  };
}

