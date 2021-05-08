// To parse this JSON data, do
//
//     final allCategoryList = allCategoryListFromJson(jsonString);

import 'dart:convert';

AllCategoryList allCategoryListFromJson(String str) => AllCategoryList.fromJson(json.decode(str));

String allCategoryListToJson(AllCategoryList data) => json.encode(data.toJson());

class AllCategoryList {
  AllCategoryList({
    this.status,
    this.categories,
    this.listItems,
    this.customFields,
  });

  int status;
  List<dynamic> categories;
  List<ListItem> listItems;
  CustomFieldsClass customFields;

  factory AllCategoryList.fromJson(Map<String, dynamic> json) => AllCategoryList(
    status: json["status"] == null ? null : json["status"],
    //categories: json["categories"] == null ? null : List<dynamic>.from(json["categories"].map((x) => x)),
    listItems: json["list_items"] == null ? null : List<ListItem>.from(json["list_items"].map((x) => ListItem.fromJson(x))),
   // customFields: json["custom_fields"] == null ? null : CustomFieldsClass.fromJson(json["custom_fields"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "categories": categories == null ? null : List<dynamic>.from(categories.map((x) => x)),
    "list_items": listItems == null ? null : List<dynamic>.from(listItems.map((x) => x.toJson())),
    "custom_fields": customFields == null ? null : customFields.toJson(),
  };
}

class CustomFieldsClass {
  CustomFieldsClass({
    this.the43,
  });

  The43 the43;

  factory CustomFieldsClass.fromJson(Map<String, dynamic> json) => CustomFieldsClass(
    the43: json["43"] == null ? null : The43.fromJson(json["43"]),
  );

  Map<String, dynamic> toJson() => {
    "43": the43 == null ? null : the43.toJson(),
  };
}

class The43 {
  The43({
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
  String valuesList;
  String tooltip;
  String icon;
  String required;
  String fieldOrder;
  String trFieldName;
  String trValuesList;

  factory The43.fromJson(Map<String, dynamic> json) => The43(
    fieldId: json["field_id"] == null ? null : json["field_id"],
    fieldName: json["field_name"] == null ? null : json["field_name"],
    fieldType: json["field_type"] == null ? null : json["field_type"],
    filterDisplay: json["filter_display"] == null ? null : json["filter_display"],
    valuesList: json["values_list"] == null ? null : json["values_list"],
    tooltip: json["tooltip"] == null ? null : json["tooltip"],
    icon: json["icon"] == null ? null : json["icon"],
    required: json["required"] == null ? null : json["required"],
    fieldOrder: json["field_order"] == null ? null : json["field_order"],
    trFieldName: json["tr_field_name"] == null ? null : json["tr_field_name"],
    trValuesList: json["tr_values_list"] == null ? null : json["tr_values_list"],
  );

  Map<String, dynamic> toJson() => {
    "field_id": fieldId == null ? null : fieldId,
    "field_name": fieldName == null ? null : fieldName,
    "field_type": fieldType == null ? null : fieldType,
    "filter_display": filterDisplay == null ? null : filterDisplay,
    "values_list": valuesList == null ? null : valuesList,
    "tooltip": tooltip == null ? null : tooltip,
    "icon": icon == null ? null : icon,
    "required": required == null ? null : required,
    "field_order": fieldOrder == null ? null : fieldOrder,
    "tr_field_name": trFieldName == null ? null : trFieldName,
    "tr_values_list": trValuesList == null ? null : trValuesList,
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
    this.customFields,
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
  dynamic customFields;

  factory ListItem.fromJson(Map<String, dynamic> json) => ListItem(
    listingId: json["listing_id"] == null ? null : json["listing_id"],
    address: json["address"] == null ? null : json["address"],
    areaCode: json["area_code"] == null ? null : json["area_code"],
    catName: json["cat_name"] == null ? null : json["cat_name"],
    catSlug: json["cat_slug"] == null ? null : json["cat_slug"],
    cityName: json["city_name"] == null ? null : json["city_name"],
    citySlug: json["city_slug"] == null ? null : json["city_slug"],
    countryAbbr: json["country_abbr"] == null ? null : countryAbbrValues.map[json["country_abbr"]],
    countryCall: json["country_call"] == null ? null : json["country_call"],
    countryName: json["country_name"] == null ? null : countryNameValues.map[json["country_name"]],
    isFeat: json["is_feat"] == null ? null : json["is_feat"],
    lat: json["lat"] == null ? null : json["lat"],
    listingLink: json["listing_link"] == null ? null : json["listing_link"],
    listingSlug: json["listing_slug"] == null ? null : json["listing_slug"],
    listingTitle: json["listing_title"] == null ? null : json["listing_title"],
    lng: json["lng"] == null ? null : json["lng"],
    mainPicUrl: json["main_pic_url"] == null ? null : json["main_pic_url"],
    phone: json["phone"] == null ? null : json["phone"],
    postalCode: json["postal_code"] == null ? null : json["postal_code"],
    price: json["price"] == null ? null : json["price"],
    rating: json["rating"] == null ? null : json["rating"],
    shortDesc: json["short_desc"] == null ? null : json["short_desc"],
    stateAbbr: json["state_abbr"] == null ? null : stateAbbrValues.map[json["state_abbr"]],
    stateSlug: json["state_slug"] == null ? null : stateSlugValues.map[json["state_slug"]],
    tipText: json["tip_text"] == null ? null : json["tip_text"],
    mainCatId: json["main_cat_id"] == null ? null : json["main_cat_id"],
    mainCatSlug: json["main_cat_slug"] == null ? null : json["main_cat_slug"],
    submissionDate: json["submission_date"] == null ? null : json["submission_date"],
    customFields: json["custom_fields"],
  );

  Map<String, dynamic> toJson() => {
    "listing_id": listingId == null ? null : listingId,
    "address": address == null ? null : address,
    "area_code": areaCode == null ? null : areaCode,
    "cat_name": catName == null ? null : catName,
    "cat_slug": catSlug == null ? null : catSlug,
    "city_name": cityName == null ? null : cityName,
    "city_slug": citySlug == null ? null : citySlug,
    "country_abbr": countryAbbr == null ? null : countryAbbrValues.reverse[countryAbbr],
    "country_call": countryCall == null ? null : countryCall,
    "country_name": countryName == null ? null : countryNameValues.reverse[countryName],
    "is_feat": isFeat == null ? null : isFeat,
    "lat": lat == null ? null : lat,
    "listing_link": listingLink == null ? null : listingLink,
    "listing_slug": listingSlug == null ? null : listingSlug,
    "listing_title": listingTitle == null ? null : listingTitle,
    "lng": lng == null ? null : lng,
    "main_pic_url": mainPicUrl == null ? null : mainPicUrl,
    "phone": phone == null ? null : phone,
    "postal_code": postalCode == null ? null : postalCode,
    "price": price == null ? null : price,
    "rating": rating == null ? null : rating,
    "short_desc": shortDesc == null ? null : shortDesc,
    "state_abbr": stateAbbr == null ? null : stateAbbrValues.reverse[stateAbbr],
    "state_slug": stateSlug == null ? null : stateSlugValues.reverse[stateSlug],
    "tip_text": tipText == null ? null : tipText,
    "main_cat_id": mainCatId == null ? null : mainCatId,
    "main_cat_slug": mainCatSlug == null ? null : mainCatSlug,
    "submission_date": submissionDate == null ? null : submissionDate,
    "custom_fields": customFields,
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
