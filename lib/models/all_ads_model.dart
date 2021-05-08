// To parse this JSON data, do
//
//     final allAds = allAdsFromJson(jsonString);

import 'dart:convert';

AllAds allAdsFromJson(String str) => AllAds.fromJson(json.decode(str));

String allAdsToJson(AllAds data) => json.encode(data.toJson());

class AllAds {
  AllAds({
    this.status,
    this.cities,
    this.states,
    this.customFields,
    this.listItems,
  });

  int status;
  Map<String, City> cities;
  Map<String, StateValue> states;
  List<dynamic> customFields;
  List<ListItem> listItems;

  factory AllAds.fromJson(Map<String, dynamic> json) => AllAds(
    status: json["status"],
    cities: Map.from(json["cities"]).map((k, v) => MapEntry<String, City>(k, City.fromJson(v))),
    states: Map.from(json["states"]).map((k, v) => MapEntry<String, StateValue>(k, StateValue.fromJson(v))),
    customFields: List<dynamic>.from(json["custom_fields"].map((x) => x)),
    listItems: List<ListItem>.from(json["list_items"].map((x) => ListItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "cities": Map.from(cities).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "states": Map.from(states).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "custom_fields": List<dynamic>.from(customFields.map((x) => x)),
    "list_items": List<dynamic>.from(listItems.map((x) => x.toJson())),
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
  StateEnum state;
  String stateId;
  String slug;
  String lat;
  String lng;

  factory City.fromJson(Map<String, dynamic> json) => City(
    cityId: json["city_id"],
    cityName: json["city_name"],
    state: stateEnumValues.map[json["state"]],
    stateId: json["state_id"],
    slug: json["slug"],
    lat: json["lat"],
    lng: json["lng"],
  );

  Map<String, dynamic> toJson() => {
    "city_id": cityId,
    "city_name": cityName,
    "state": stateEnumValues.reverse[state],
    "state_id": stateId,
    "slug": slug,
    "lat": lat,
    "lng": lng,
  };
}

enum StateEnum { BERBERA, HARGEISA }

final stateEnumValues = EnumValues({
  "Berbera": StateEnum.BERBERA,
  "Hargeisa": StateEnum.HARGEISA
});

class ListItem {
  ListItem({
    this.listingId,
    this.address,
    this.areaCode,
    this.catIcon,
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
  CatIcon catIcon;
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
  StateEnum stateAbbr;
  StateSlug stateSlug;
  String mainCatId;
  String mainCatSlug;
  int submissionDate;

  factory ListItem.fromJson(Map<String, dynamic> json) => ListItem(
    listingId: json["listing_id"],
    address: json["address"],
    areaCode: json["area_code"],
    catIcon: catIconValues.map[json["cat_icon"]],
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
    stateAbbr: stateEnumValues.map[json["state_abbr"]],
    stateSlug: stateSlugValues.map[json["state_slug"]],
    mainCatId: json["main_cat_id"],
    mainCatSlug: json["main_cat_slug"],
    submissionDate: json["submission_date"],
  );

  Map<String, dynamic> toJson() => {
    "listing_id": listingId,
    "address": address,
    "area_code": areaCode,
    "cat_icon": catIconValues.reverse[catIcon],
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
    "state_abbr": stateEnumValues.reverse[stateAbbr],
    "state_slug": stateSlugValues.reverse[stateSlug],
    "main_cat_id": mainCatId,
    "main_cat_slug": mainCatSlug,
    "submission_date": submissionDate,
  };
}

enum CatIcon { EMPTY, I_CLASS_FA_FA_TRASH_I, I_CLASS_FAS_FA_CAR_I }

final catIconValues = EnumValues({
  "": CatIcon.EMPTY,
  "<i class=\"fas fa-car\"></i>": CatIcon.I_CLASS_FAS_FA_CAR_I,
  "<i class=\"fa fa-trash\"></i>": CatIcon.I_CLASS_FA_FA_TRASH_I
});

enum CountryAbbr { SO }

final countryAbbrValues = EnumValues({
  "SO": CountryAbbr.SO
});

enum CountryName { SOMALILAND }

final countryNameValues = EnumValues({
  "Somaliland": CountryName.SOMALILAND
});

enum StateSlug { BERBERA, HARGEISA }

final stateSlugValues = EnumValues({
  "berbera": StateSlug.BERBERA,
  "hargeisa": StateSlug.HARGEISA
});

class StateValue {
  StateValue({
    this.stateId,
    this.stateName,
    this.stateAbbr,
    this.slug,
    this.countryAbbr,
    this.countryId,
  });

  String stateId;
  String stateName;
  String stateAbbr;
  String slug;
  CountryAbbr countryAbbr;
  String countryId;

  factory StateValue.fromJson(Map<String, dynamic> json) => StateValue(
    stateId: json["state_id"],
    stateName: json["state_name"],
    stateAbbr: json["state_abbr"],
    slug: json["slug"],
    countryAbbr: countryAbbrValues.map[json["country_abbr"]],
    countryId: json["country_id"],
  );

  Map<String, dynamic> toJson() => {
    "state_id": stateId,
    "state_name": stateName,
    "state_abbr": stateAbbr,
    "slug": slug,
    "country_abbr": countryAbbrValues.reverse[countryAbbr],
    "country_id": countryId,
  };
}

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
