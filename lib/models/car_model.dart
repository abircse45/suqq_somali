// To parse this JSON data, do
//
//     final car = carFromJson(jsonString);

import 'dart:convert';

Car carFromJson(String str) => Car.fromJson(json.decode(str));

String carToJson(Car data) => json.encode(data.toJson());

class Car {
  Car({
    this.status,
    this.featured,
    this.latest,
    this.cities,
    this.customFields,
  });

  int status;
  List<Featured> featured;
  List<Featured> latest;
  List<City> cities;
  Map<String, CustomField> customFields;

  factory Car.fromJson(Map<String, dynamic> json) => Car(
    status: json["status"],
    featured: List<Featured>.from(json["featured"].map((x) => Featured.fromJson(x))),
    latest: List<Featured>.from(json["latest"].map((x) => Featured.fromJson(x))),
    cities: List<City>.from(json["cities"].map((x) => City.fromJson(x))),
    customFields: Map.from(json["custom_fields"]).map((k, v) => MapEntry<String, CustomField>(k, CustomField.fromJson(v))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "featured": List<dynamic>.from(featured.map((x) => x.toJson())),
    "latest": List<dynamic>.from(latest.map((x) => x.toJson())),
    "cities": List<dynamic>.from(cities.map((x) => x.toJson())),
    "custom_fields": Map.from(customFields).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };
}

class City {
  City({
    this.cityId,
    this.cityName,
    this.state,
    this.stateId,
    this.slug,
    this.lat,
    this.lng,
  });

  String cityId;
  String cityName;
  String state;
  String stateId;
  String slug;
  String lat;
  String lng;

  factory City.fromJson(Map<String, dynamic> json) => City(
    cityId: json["city_id"],
    cityName: json["city_name"],
    state: json["state"],
    stateId: json["state_id"],
    slug: json["slug"],
    lat: json["lat"],
    lng: json["lng"],
  );

  Map<String, dynamic> toJson() => {
    "city_id": cityId,
    "city_name": cityName,
    "state": state,
    "state_id": stateId,
    "slug": slug,
    "lat": lat,
    "lng": lng,
  };
}

class CustomField {
  CustomField({
    this.fieldId,
    this.fieldName,
    this.fieldType,
    this.filterDisplay,
    this.valuesList,
    this.tooltip,
    this.icon,
    this.required,
    this.fieldOrder,
    this.trFieldName,
    this.trValuesList,
  });

  String fieldId;
  String fieldName;
  String fieldType;
  String filterDisplay;
  dynamic valuesList;
  String tooltip;
  String icon;
  String required;
  String fieldOrder;
  String trFieldName;
  String trValuesList;

  factory CustomField.fromJson(Map<String, dynamic> json) => CustomField(
    fieldId: json["field_id"],
    fieldName: json["field_name"],
    fieldType: json["field_type"],
    filterDisplay: json["filter_display"],
    valuesList: json["values_list"],
    tooltip: json["tooltip"],
    icon: json["icon"],
    required: json["required"],
    fieldOrder: json["field_order"],
    trFieldName: json["tr_field_name"],
    trValuesList: json["tr_values_list"],
  );

  Map<String, dynamic> toJson() => {
    "field_id": fieldId,
    "field_name": fieldName,
    "field_type": fieldType,
    "filter_display": filterDisplay,
    "values_list": valuesList,
    "tooltip": tooltip,
    "icon": icon,
    "required": required,
    "field_order": fieldOrder,
    "tr_field_name": trFieldName,
    "tr_values_list": trValuesList,
  };
}

class Featured {
  Featured({
    this.avgRating,
    this.catBg,
    this.catIcon,
    this.catName,
    this.catSlug,
    this.cityName,
    this.citySlug,
    this.listingAddr,
    this.price,
    this.listingId,
    this.listingLink,
    this.listingSlug,
    this.listingTitle,
    this.photoUrl,
    this.profilePic,
    this.shortDesc,
    this.stateAbbr,
    this.stateSlug,
    this.submissionDate,
    this.customFields,
    this.listingPrice,
    this.isFeat,
  });

  String avgRating;
  String catBg;
  String catIcon;
  String catName;
  String catSlug;
  String cityName;
  String citySlug;
  String listingAddr;
  String price;
  String listingId;
  String listingLink;
  String listingSlug;
  String listingTitle;
  String photoUrl;
  String profilePic;
  String shortDesc;
  String stateAbbr;
  String stateSlug;
  int submissionDate;
  Map<String, String> customFields;
  String listingPrice;
  bool isFeat;

  factory Featured.fromJson(Map<String, dynamic> json) => Featured(
    avgRating: json["avg_rating"],
    catBg: json["cat_bg"],
    catIcon: json["cat_icon"],
    catName: json["cat_name"],
    catSlug: json["cat_slug"],
    cityName: json["city_name"],
    citySlug: json["city_slug"],
    listingAddr: json["listing_addr"],
    price: json["price"] == null ? null : json["price"],
    listingId: json["listing_id"],
    listingLink: json["listing_link"],
    listingSlug: json["listing_slug"],
    listingTitle: json["listing_title"],
    photoUrl: json["photo_url"],
    profilePic: json["profile_pic"],
    shortDesc: json["short_desc"],
    stateAbbr: json["state_abbr"],
    stateSlug: json["state_slug"],
    submissionDate: json["submission_date"],
    customFields: Map.from(json["custom_fields"]).map((k, v) => MapEntry<String, String>(k, v)),
    listingPrice: json["listing_price"] == null ? null : json["listing_price"],
    isFeat: json["is_feat"] == null ? null : json["is_feat"],
  );

  Map<String, dynamic> toJson() => {
    "avg_rating": avgRating,
    "cat_bg": catBg,
    "cat_icon": catIcon,
    "cat_name": catName,
    "cat_slug": catSlug,
    "city_name": cityName,
    "city_slug": citySlug,
    "listing_addr": listingAddr,
    "price": price == null ? null : price,
    "listing_id": listingId,
    "listing_link": listingLink,
    "listing_slug": listingSlug,
    "listing_title": listingTitle,
    "photo_url": photoUrl,
    "profile_pic": profilePic,
    "short_desc": shortDesc,
    "state_abbr": stateAbbr,
    "state_slug": stateSlug,
    "submission_date": submissionDate,
    "custom_fields": Map.from(customFields).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "listing_price": listingPrice == null ? null : listingPrice,
    "is_feat": isFeat == null ? null : isFeat,
  };
}
