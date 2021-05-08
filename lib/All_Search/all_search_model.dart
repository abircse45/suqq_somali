// To parse this JSON data, do
//
//     final allSearch = allSearchFromJson(jsonString);

import 'dart:convert';

AllSearch allSearchFromJson(String str) => AllSearch.fromJson(json.decode(str));

String allSearchToJson(AllSearch data) => json.encode(data.toJson());

class AllSearch {
  AllSearch({
    this.status,
    this.categories,
    this.listItems,
    this.customFields,
  });

  int status;
  List<dynamic> categories;
  List<ListItem> listItems;
  List<dynamic> customFields;

  factory AllSearch.fromJson(Map<String, dynamic> json) => AllSearch(
    status: json["status"],
    categories: List<dynamic>.from(json["categories"].map((x) => x)),
    listItems: List<ListItem>.from(json["list_items"].map((x) => ListItem.fromJson(x))),
   // customFields: List<dynamic>.from(json["custom_fields"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "categories": List<dynamic>.from(categories.map((x) => x)),
    "list_items": List<dynamic>.from(listItems.map((x) => x.toJson())),
   // "custom_fields": List<dynamic>.from(customFields.map((x) => x)),
  };
}

class ListItem {
  ListItem({
    this.listingId,
    this.address,
    this.areaCode,
    this.catName,
    this.catSlug,
    this.cityName,
    this.citySlug,
    this.countryAbbr,
    this.countryCall,
    this.countryName,
    this.isFeat,
    this.lat,
    this.listingLink,
    this.listingSlug,
    this.listingTitle,
    this.lng,
    this.mainPicUrl,
    this.phone,
    this.postalCode,
    this.price,
    this.rating,
    this.shortDesc,
    this.stateAbbr,
    this.stateSlug,
    this.tipText,
    this.mainCatId,
    this.mainCatSlug,
    this.submissionDate,
   // this.customFields,
  });

  String listingId;
  String address;
  String areaCode;
  String catName;
  String catSlug;
  String cityName;
  String citySlug;
  CountryAbbr countryAbbr;
  String countryCall;
  CountryName countryName;
  String isFeat;
  String lat;
  String listingLink;
  String listingSlug;
  String listingTitle;
  String lng;
  String mainPicUrl;
  String phone;
  String postalCode;
  String price;
  String rating;
  String shortDesc;
  StateAbbr stateAbbr;
  StateSlug stateSlug;
  String tipText;
  String mainCatId;
  String mainCatSlug;
  int submissionDate;
  //dynamic customFields;

  factory ListItem.fromJson(Map<String, dynamic> json) => ListItem(
    listingId: json["listing_id"],
    address: json["address"],
    areaCode: json["area_code"],
    catName: json["cat_name"],
    catSlug: json["cat_slug"],
    cityName: json["city_name"],
    citySlug: json["city_slug"],
    countryAbbr: countryAbbrValues.map[json["country_abbr"]],
    countryCall: json["country_call"],
    countryName: countryNameValues.map[json["country_name"]],
    isFeat: json["is_feat"],
    lat: json["lat"],
    listingLink: json["listing_link"],
    listingSlug: json["listing_slug"],
    listingTitle: json["listing_title"],
    lng: json["lng"],
    mainPicUrl: json["main_pic_url"],
    phone: json["phone"],
    postalCode: json["postal_code"],
    price: json["price"],
    rating: json["rating"],
    shortDesc: json["short_desc"],
    stateAbbr: stateAbbrValues.map[json["state_abbr"]],
    stateSlug: stateSlugValues.map[json["state_slug"]],
    tipText: json["tip_text"] == null ? null : json["tip_text"],
    mainCatId: json["main_cat_id"],
    mainCatSlug: json["main_cat_slug"],
    submissionDate: json["submission_date"],
    //customFields: json["custom_fields"],
  );

  Map<String, dynamic> toJson() => {
    "listing_id": listingId,
    "address": address,
    "area_code": areaCode,
    "cat_name": catName,
    "cat_slug": catSlug,
    "city_name": cityName,
    "city_slug": citySlug,
    "country_abbr": countryAbbrValues.reverse[countryAbbr],
    "country_call": countryCall,
    "country_name": countryNameValues.reverse[countryName],
    "is_feat": isFeat,
    "lat": lat,
    "listing_link": listingLink,
    "listing_slug": listingSlug,
    "listing_title": listingTitle,
    "lng": lng,
    "main_pic_url": mainPicUrl,
    "phone": phone,
    "postal_code": postalCode,
    "price": price,
    "rating": rating,
    "short_desc": shortDesc,
    "state_abbr": stateAbbrValues.reverse[stateAbbr],
    "state_slug": stateSlugValues.reverse[stateSlug],
    "tip_text": tipText == null ? null : tipText,
    "main_cat_id": mainCatId,
    "main_cat_slug": mainCatSlug,
    "submission_date": submissionDate,
   // "custom_fields": customFields,
  };
}

enum CountryAbbr { SO }

final countryAbbrValues = EnumValues({
  "SO": CountryAbbr.SO
});

enum CountryName { SOMALILAND }

final countryNameValues = EnumValues({
  "Somaliland": CountryName.SOMALILAND
});

enum StateAbbr { BERBERA, HARGEISA }

final stateAbbrValues = EnumValues({
  "Berbera": StateAbbr.BERBERA,
  "Hargeisa": StateAbbr.HARGEISA
});

enum StateSlug { BERBERA, HARGEISA }

final stateSlugValues = EnumValues({
  "berbera": StateSlug.BERBERA,
  "hargeisa": StateSlug.HARGEISA
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
