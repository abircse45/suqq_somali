// To parse this JSON data, do
//
//     final mobileCategory = mobileCategoryFromJson(jsonString);

import 'dart:convert';

MobileCategory mobileCategoryFromJson(String str) => MobileCategory.fromJson(json.decode(str));

String mobileCategoryToJson(MobileCategory data) => json.encode(data.toJson());

class MobileCategory {
  MobileCategory({
    this.status,
    this.listing,
  });

  int status;
  Listing listing;

  factory MobileCategory.fromJson(Map<String, dynamic> json) => MobileCategory(
    status: json["status"],
    listing: Listing.fromJson(json["listing"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "listing": listing.toJson(),
  };
}

class Listing {
  Listing({
    this.listingId,
    this.userid,
    this.lat,
    this.lng,
    this.listingTitle,
    this.slug,
    this.price,
    this.address,
    this.postalCode,
    this.cityId,
    this.stateId,
    this.countryCode,
    this.areaCode,
    this.phone,
    this.waCountryCode,
    this.waAreaCode,
    this.waPhone,
    this.mainPic,
    this.contactEmail,
    this.description,
    this.shortDesc,
    this.submissionDate,
    this.feat,
    this.featHome,
    this.plan,
    this.creditsUniqId,
    this.validUntil,
    this.status,
    this.paid,
    this.reviews,
    this.photos,
    this.customFields,
  });

  String listingId;
  String userid;
  String lat;
  String lng;
  String listingTitle;
  String slug;
  String price;
  String address;
  String postalCode;
  String cityId;
  String stateId;
  String countryCode;
  String areaCode;
  String phone;
  String waCountryCode;
  String waAreaCode;
  String waPhone;
  String mainPic;
  String contactEmail;
  String description;
  String shortDesc;
  DateTime submissionDate;
  String feat;
  String featHome;
  String plan;
  String creditsUniqId;
  DateTime validUntil;
  String status;
  String paid;
  List<dynamic> reviews;
  List<Photo> photos;
  CustomFields customFields;

  factory Listing.fromJson(Map<String, dynamic> json) => Listing(
    listingId: json["listing_id"],
    userid: json["userid"],
    lat: json["lat"],
    lng: json["lng"],
    listingTitle: json["listing_title"],
    slug: json["slug"],
    price: json["price"],
    address: json["address"],
    postalCode: json["postal_code"],
    cityId: json["city_id"],
    stateId: json["state_id"],
    countryCode: json["country_code"],
    areaCode: json["area_code"],
    phone: json["phone"],
    waCountryCode: json["wa_country_code"],
    waAreaCode: json["wa_area_code"],
    waPhone: json["wa_phone"],
    mainPic: json["main_pic"],
    contactEmail: json["contact_email"],
    description: json["description"],
    shortDesc: json["short_desc"],
    submissionDate: DateTime.parse(json["submission_date"]),
    feat: json["feat"],
    featHome: json["feat_home"],
    plan: json["plan"],
    creditsUniqId: json["credits_uniq_id"],
    validUntil: DateTime.parse(json["valid_until"]),
    status: json["status"],
    paid: json["paid"],
    reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
    photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
    customFields: CustomFields.fromJson(json["custom_fields"]),
  );

  Map<String, dynamic> toJson() => {
    "listing_id": listingId,
    "userid": userid,
    "lat": lat,
    "lng": lng,
    "listing_title": listingTitle,
    "slug": slug,
    "price": price,
    "address": address,
    "postal_code": postalCode,
    "city_id": cityId,
    "state_id": stateId,
    "country_code": countryCode,
    "area_code": areaCode,
    "phone": phone,
    "wa_country_code": waCountryCode,
    "wa_area_code": waAreaCode,
    "wa_phone": waPhone,
    "main_pic": mainPic,
    "contact_email": contactEmail,
    "description": description,
    "short_desc": shortDesc,
    "submission_date": submissionDate.toIso8601String(),
    "feat": feat,
    "feat_home": featHome,
    "plan": plan,
    "credits_uniq_id": creditsUniqId,
    "valid_until": validUntil.toIso8601String(),
    "status": status,
    "paid": paid,
    "reviews": List<dynamic>.from(reviews.map((x) => x)),
    "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
    "custom_fields": customFields.toJson(),
  };
}

class CustomFields {
  CustomFields({
    this.the31,
  });

  The31 the31;

  factory CustomFields.fromJson(Map<String, dynamic> json) => CustomFields(
    the31: The31.fromJson(json["31"]),
  );

  Map<String, dynamic> toJson() => {
    "31": the31.toJson(),
  };
}

class The31 {
  The31({
    this.fieldId,
    this.fieldName,
    this.fieldValue,
    this.fieldType,
    this.valuesList,
    this.tooltip,
    this.icon,
    this.required,
    this.fieldOrder,
    this.trFieldName,
    this.trValuesList,
    this.trFieldValue,
  });

  String fieldId;
  String fieldName;
  String fieldValue;
  String fieldType;
  String valuesList;
  String tooltip;
  String icon;
  String required;
  String fieldOrder;
  String trFieldName;
  String trValuesList;
  String trFieldValue;

  factory The31.fromJson(Map<String, dynamic> json) => The31(
    fieldId: json["field_id"],
    fieldName: json["field_name"],
    fieldValue: json["field_value"],
    fieldType: json["field_type"],
    valuesList: json["values_list"],
    tooltip: json["tooltip"],
    icon: json["icon"],
    required: json["required"],
    fieldOrder: json["field_order"],
    trFieldName: json["tr_field_name"],
    trValuesList: json["tr_values_list"],
    trFieldValue: json["tr_field_value"],
  );

  Map<String, dynamic> toJson() => {
    "field_id": fieldId,
    "field_name": fieldName,
    "field_value": fieldValue,
    "field_type": fieldType,
    "values_list": valuesList,
    "tooltip": tooltip,
    "icon": icon,
    "required": required,
    "field_order": fieldOrder,
    "tr_field_name": trFieldName,
    "tr_values_list": trValuesList,
    "tr_field_value": trFieldValue,
  };
}

class Photo {
  Photo({
    this.imgUrl,
    this.imgUrlThumb,
    this.dataTitle,
    this.source,
  });

  String imgUrl;
  String imgUrlThumb;
  String dataTitle;
  String source;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    imgUrl: json["img_url"],
    imgUrlThumb: json["img_url_thumb"],
    dataTitle: json["data_title"],
    source: json["source"],
  );

  Map<String, dynamic> toJson() => {
    "img_url": imgUrl,
    "img_url_thumb": imgUrlThumb,
    "data_title": dataTitle,
    "source": source,
  };
}
