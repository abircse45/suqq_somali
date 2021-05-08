// To parse this JSON data, do
//
//     final filterPropertySearch = filterPropertySearchFromJson(jsonString);

import 'dart:convert';

FilterPropertySearch filterPropertySearchFromJson(String str) => FilterPropertySearch.fromJson(json.decode(str));

String filterPropertySearchToJson(FilterPropertySearch data) => json.encode(data.toJson());

class FilterPropertySearch {
  FilterPropertySearch({
    this.status,
    this.categories,
    this.listItems,
    this.customFields,
  });

  int status;
  List<dynamic> categories;
  List<ListItem> listItems;
  Map<String, CustomField> customFields;

  factory FilterPropertySearch.fromJson(Map<String, dynamic> json) => FilterPropertySearch(
    status: json["status"],
    categories: List<dynamic>.from(json["categories"].map((x) => x)),
    listItems: List<ListItem>.from(json["list_items"].map((x) => ListItem.fromJson(x))),
    customFields: Map.from(json["custom_fields"]).map((k, v) => MapEntry<String, CustomField>(k, CustomField.fromJson(v))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "categories": List<dynamic>.from(categories.map((x) => x)),
    "list_items": List<dynamic>.from(listItems.map((x) => x.toJson())),
    "custom_fields": Map.from(customFields).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
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
  String valuesList;
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
  String countryAbbr;
  String countryCall;
  String countryName;
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
  String stateAbbr;
  String stateSlug;
  dynamic tipText;
  String mainCatId;
  String mainCatSlug;
  int submissionDate;
  Map<String, String> customFields;

  factory ListItem.fromJson(Map<String, dynamic> json) => ListItem(
    listingId: json["listing_id"],
    address: json["address"],
    areaCode: json["area_code"],
    catName: json["cat_name"],
    catSlug: json["cat_slug"],
    cityName: json["city_name"],
    citySlug: json["city_slug"],
    countryAbbr: json["country_abbr"],
    countryCall: json["country_call"],
    countryName: json["country_name"],
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
    stateAbbr: json["state_abbr"],
    stateSlug: json["state_slug"],
    tipText: json["tip_text"],
    mainCatId: json["main_cat_id"],
    mainCatSlug: json["main_cat_slug"],
    submissionDate: json["submission_date"],
    customFields: Map.from(json["custom_fields"]).map((k, v) => MapEntry<String, String>(k, v)),
  );

  Map<String, dynamic> toJson() => {
    "listing_id": listingId,
    "address": address,
    "area_code": areaCode,
    "cat_name": catName,
    "cat_slug": catSlug,
    "city_name": cityName,
    "city_slug": citySlug,
    "country_abbr": countryAbbr,
    "country_call": countryCall,
    "country_name": countryName,
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
    "state_abbr": stateAbbr,
    "state_slug": stateSlug,
    "tip_text": tipText,
    "main_cat_id": mainCatId,
    "main_cat_slug": mainCatSlug,
    "submission_date": submissionDate,
    "custom_fields": Map.from(customFields).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}
