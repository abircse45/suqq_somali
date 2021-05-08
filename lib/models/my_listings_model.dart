// To parse this JSON data, do
//
//     final myListingModel = myListingModelFromJson(jsonString);

import 'dart:convert';

MyListingModel myListingModelFromJson(String str) => MyListingModel.fromJson(json.decode(str));

String myListingModelToJson(MyListingModel data) => json.encode(data.toJson());

class MyListingModel {
  MyListingModel({
    this.status,
    this.listings,
  });

  int status;
  List<Listing> listings;

  factory MyListingModel.fromJson(Map<String, dynamic> json) => MyListingModel(
    status: json["status"] == null ? null : json["status"],
    listings: json["listings"] == null ? null : List<Listing>.from(json["listings"].map((x) => Listing.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "listings": listings == null ? null : List<dynamic>.from(listings.map((x) => x.toJson())),
  };
}

class Listing {
  Listing({
    this.catSlug,
    this.cityId,
    this.cityName,
    this.citySlug,
    this.description,
    this.listingId,
    this.listingLink,
    this.listingSlug,
    this.listingTitle,
    this.photoUrl,
    this.stateId,
    this.stateSlug,
    this.status,
    this.submissionDate,
  });

  String catSlug;
  String cityId;
  String cityName;
  String citySlug;
  String description;
  String listingId;
  String listingLink;
  String listingSlug;
  String listingTitle;
  String photoUrl;
  String stateId;
  String stateSlug;
  String status;
  DateTime submissionDate;

  factory Listing.fromJson(Map<String, dynamic> json) => Listing(
    catSlug: json["cat_slug"] == null ? null : json["cat_slug"],
    cityId: json["city_id"] == null ? null : json["city_id"],
    cityName: json["city_name"] == null ? null : json["city_name"],
    citySlug: json["city_slug"] == null ? null : json["city_slug"],
    description: json["description"] == null ? null : json["description"],
    listingId: json["listing_id"] == null ? null : json["listing_id"],
    listingLink: json["listing_link"] == null ? null : json["listing_link"],
    listingSlug: json["listing_slug"] == null ? null : json["listing_slug"],
    listingTitle: json["listing_title"] == null ? null : json["listing_title"],
    photoUrl: json["photo_url"] == null ? null : json["photo_url"],
    stateId: json["state_id"] == null ? null : json["state_id"],
    stateSlug: json["state_slug"] == null ? null : json["state_slug"],
    status: json["status"] == null ? null : json["status"],
    submissionDate: json["submission_date"] == null ? null : DateTime.parse(json["submission_date"]),
  );

  Map<String, dynamic> toJson() => {
    "cat_slug": catSlug == null ? null : catSlug,
    "city_id": cityId == null ? null : cityId,
    "city_name": cityName == null ? null : cityName,
    "city_slug": citySlug == null ? null : citySlug,
    "description": description == null ? null : description,
    "listing_id": listingId == null ? null : listingId,
    "listing_link": listingLink == null ? null : listingLink,
    "listing_slug": listingSlug == null ? null : listingSlug,
    "listing_title": listingTitle == null ? null : listingTitle,
    "photo_url": photoUrl == null ? null : photoUrl,
    "state_id": stateId == null ? null : stateId,
    "state_slug": stateSlug == null ? null : stateSlug,
    "status": status == null ? null : status,
    "submission_date": submissionDate == null ? null : submissionDate.toIso8601String(),
  };
}
