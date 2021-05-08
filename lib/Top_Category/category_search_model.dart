// To parse this JSON data, do
//
//     final categorySearch = categorySearchFromJson(jsonString);

import 'dart:convert';

CategorySearch categorySearchFromJson(String str) => CategorySearch.fromJson(json.decode(str));

String categorySearchToJson(CategorySearch data) => json.encode(data.toJson());

class CategorySearch {
  CategorySearch({
    this.status,
    this.cities,
    this.states,
    this.categoriesTree,
    this.categories,
    this.customFields,
  });

  int status;
  List<City> cities;
  List<State> states;
  List<Categor> categoriesTree;
  List<Categor> categories;
  Map<String, CustomFieldValue> customFields;

  factory CategorySearch.fromJson(Map<String, dynamic> json) => CategorySearch(
    status: json["status"] == null ? null : json["status"],
    cities: json["cities"] == null ? null : List<City>.from(json["cities"].map((x) => City.fromJson(x))),
    states: json["states"] == null ? null : List<State>.from(json["states"].map((x) => State.fromJson(x))),
    categoriesTree: json["categories_tree"] == null ? null : List<Categor>.from(json["categories_tree"].map((x) => Categor.fromJson(x))),
    categories: json["categories"] == null ? null : List<Categor>.from(json["categories"].map((x) => Categor.fromJson(x))),
    customFields: json["custom_fields"] == null ? null : Map.from(json["custom_fields"]).map((k, v) => MapEntry<String, CustomFieldValue>(k, CustomFieldValue.fromJson(v))),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "cities": cities == null ? null : List<dynamic>.from(cities.map((x) => x.toJson())),
    "states": states == null ? null : List<dynamic>.from(states.map((x) => x.toJson())),
    "categories_tree": categoriesTree == null ? null : List<dynamic>.from(categoriesTree.map((x) => x.toJson())),
    "categories": categories == null ? null : List<dynamic>.from(categories.map((x) => x.toJson())),
    "custom_fields": customFields == null ? null : Map.from(customFields).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };
}

class Categor {
  Categor({
    this.catId,
    this.catName,
    this.catSlug,
    this.pluralName,
    this.parentId,
    this.catIcon,
    this.catLink,
    this.customFields,
    this.childs,
  });

  String catId;
  String catName;
  String catSlug;
  String pluralName;
  String parentId;
  Icon catIcon;
  String catLink;
  List<CategoryCustomField> customFields;
  List<Child> childs;

  factory Categor.fromJson(Map<String, dynamic> json) => Categor(
    catId: json["cat_id"] == null ? null : json["cat_id"],
    catName: json["cat_name"] == null ? null : json["cat_name"],
    catSlug: json["cat_slug"] == null ? null : json["cat_slug"],
    pluralName: json["plural_name"] == null ? null : json["plural_name"],
    parentId: json["parent_id"] == null ? null : json["parent_id"],
    catIcon: json["cat_icon"] == null ? null : iconValues.map[json["cat_icon"]],
    catLink: json["cat_link"] == null ? null : json["cat_link"],
    customFields: json["custom_fields"] == null ? null : List<CategoryCustomField>.from(json["custom_fields"].map((x) => CategoryCustomField.fromJson(x))),
    childs: json["childs"] == null ? null : List<Child>.from(json["childs"].map((x) => Child.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cat_id": catId == null ? null : catId,
    "cat_name": catName == null ? null : catName,
    "cat_slug": catSlug == null ? null : catSlug,
    "plural_name": pluralName == null ? null : pluralName,
    "parent_id": parentId == null ? null : parentId,
    "cat_icon": catIcon == null ? null : iconValues.reverse[catIcon],
    "cat_link": catLink == null ? null : catLink,
    "custom_fields": customFields == null ? null : List<dynamic>.from(customFields.map((x) => x.toJson())),
    "childs": childs == null ? null : List<dynamic>.from(childs.map((x) => x.toJson())),
  };
}

enum Icon { EMPTY, I_CLASS_FAS_FA_CAR_I, I_CLASS_FAS_FA_CAR_BATTERY_I, I_CLASS_FAS_FA_FILL_DRIP_I, I_CLASS_FAS_FA_CALENDAR_ALT_I, I_CLASS_FAS_FA_GAS_PUMP_I, I_CLASS_FAS_FA_BUILDING_I, I_CLASS_FAS_FA_BED_I, I_CLASS_FAS_FA_BATH_I, I_CLASS_FAS_FA_WAREHOUSE_I }

final iconValues = EnumValues({
  "": Icon.EMPTY,
  "<i class=\"fas fa-bath\"></i>": Icon.I_CLASS_FAS_FA_BATH_I,
  "<i class=\"fas fa-bed\"></i>": Icon.I_CLASS_FAS_FA_BED_I,
  "<i class=\"fas fa-building\"></i>": Icon.I_CLASS_FAS_FA_BUILDING_I,
  "<i class=\"fas fa-calendar-alt\"></i>": Icon.I_CLASS_FAS_FA_CALENDAR_ALT_I,
  "<i class=\"fas fa-car-battery\"></i>": Icon.I_CLASS_FAS_FA_CAR_BATTERY_I,
  "<i class=\"fas fa-car\"></i>": Icon.I_CLASS_FAS_FA_CAR_I,
  "<i class=\"fas fa-fill-drip\"></i>": Icon.I_CLASS_FAS_FA_FILL_DRIP_I,
  "<i class=\"fas fa-gas-pump\"></i>": Icon.I_CLASS_FAS_FA_GAS_PUMP_I,
  "<i class=\"fas fa-warehouse\"></i>": Icon.I_CLASS_FAS_FA_WAREHOUSE_I
});

class Child {
  Child({
    this.catId,
    this.catName,
    this.catSlug,
    this.pluralName,
    this.parentId,
    this.catIcon,
    this.catLink,
    this.customFields,
  });

  String catId;
  String catName;
  String catSlug;
  String pluralName;
  String parentId;
  CatIcon catIcon;
  String catLink;
  List<ChildCustomField> customFields;

  factory Child.fromJson(Map<String, dynamic> json) => Child(
    catId: json["cat_id"] == null ? null : json["cat_id"],
    catName: json["cat_name"] == null ? null : json["cat_name"],
    catSlug: json["cat_slug"] == null ? null : json["cat_slug"],
    pluralName: json["plural_name"] == null ? null : json["plural_name"],
    parentId: json["parent_id"] == null ? null : json["parent_id"],
    catIcon: json["cat_icon"] == null ? null : catIconValues.map[json["cat_icon"]],
    catLink: json["cat_link"] == null ? null : json["cat_link"],
    customFields: json["custom_fields"] == null ? null : List<ChildCustomField>.from(json["custom_fields"].map((x) => ChildCustomField.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cat_id": catId == null ? null : catId,
    "cat_name": catName == null ? null : catName,
    "cat_slug": catSlug == null ? null : catSlug,
    "plural_name": pluralName == null ? null : pluralName,
    "parent_id": parentId == null ? null : parentId,
    "cat_icon": catIcon == null ? null : catIconValues.reverse[catIcon],
    "cat_link": catLink == null ? null : catLink,
    "custom_fields": customFields == null ? null : List<dynamic>.from(customFields.map((x) => x.toJson())),
  };
}

enum CatIcon { EMPTY, I_CLASS_FA_FA_TRASH_I }

final catIconValues = EnumValues({
  "": CatIcon.EMPTY,
  "<i class=\"fa fa-trash\"></i>": CatIcon.I_CLASS_FA_FA_TRASH_I
});

class ChildCustomField {
  ChildCustomField({
    this.fieldId,
    this.catId,
    this.fieldName,
    this.trFieldName,
    this.fieldType,
    this.valuesList,
    this.trValuesList,
    this.tooltip,
    this.trTooltip,
    this.icon,
    this.required,
    this.searchable,
    this.fieldValue,
  });

  String fieldId;
  String catId;
  String fieldName;
  String trFieldName;
  FieldType fieldType;
  dynamic valuesList;
  String trValuesList;
  Tooltip tooltip;
  Tooltip trTooltip;
  Icon icon;
  String required;
  dynamic searchable;
  String fieldValue;

  factory ChildCustomField.fromJson(Map<String, dynamic> json) => ChildCustomField(
    fieldId: json["field_id"] == null ? null : json["field_id"],
    catId: json["cat_id"] == null ? null : json["cat_id"],
    fieldName: json["field_name"] == null ? null : json["field_name"],
    trFieldName: json["tr_field_name"] == null ? null : json["tr_field_name"],
    fieldType: json["field_type"] == null ? null : fieldTypeValues.map[json["field_type"]],
    valuesList: json["values_list"],
    trValuesList: json["tr_values_list"] == null ? null : json["tr_values_list"],
    tooltip: json["tooltip"] == null ? null : tooltipValues.map[json["tooltip"]],
    trTooltip: json["tr_tooltip"] == null ? null : tooltipValues.map[json["tr_tooltip"]],
    icon: json["icon"] == null ? null : iconValues.map[json["icon"]],
    required: json["required"] == null ? null : json["required"],
    searchable: json["searchable"],
    fieldValue: json["field_value"] == null ? null : json["field_value"],
  );

  Map<String, dynamic> toJson() => {
    "field_id": fieldId == null ? null : fieldId,
    "cat_id": catId == null ? null : catId,
    "field_name": fieldName == null ? null : fieldName,
    "tr_field_name": trFieldName == null ? null : trFieldName,
    "field_type": fieldType == null ? null : fieldTypeValues.reverse[fieldType],
    "values_list": valuesList,
    "tr_values_list": trValuesList == null ? null : trValuesList,
    "tooltip": tooltip == null ? null : tooltipValues.reverse[tooltip],
    "tr_tooltip": trTooltip == null ? null : tooltipValues.reverse[trTooltip],
    "icon": icon == null ? null : iconValues.reverse[icon],
    "required": required == null ? null : required,
    "searchable": searchable,
    "field_value": fieldValue == null ? null : fieldValue,
  };
}

enum FieldType { SELECT, TEXT, CHECKBOX }

final fieldTypeValues = EnumValues({
  "checkbox": FieldType.CHECKBOX,
  "select": FieldType.SELECT,
  "text": FieldType.TEXT
});

enum Tooltip { EMPTY, TYPE_OF_CAR, COLOR, TRANSMISSION, CAR_MODEL_YEAR, CURRENT_VEHICLE_MILEAGE }

final tooltipValues = EnumValues({
  "Car Model Year": Tooltip.CAR_MODEL_YEAR,
  "Color": Tooltip.COLOR,
  "Current vehicle mileage": Tooltip.CURRENT_VEHICLE_MILEAGE,
  "": Tooltip.EMPTY,
  "Transmission": Tooltip.TRANSMISSION,
  "Type of car": Tooltip.TYPE_OF_CAR
});

enum ValuesListEnum { EMPTY, DIESEL_PETROL_CNG_HYBRID_ELECTRIC_OCTANE_LPG_OTHER }

final valuesListEnumValues = EnumValues({
  "Diesel;Petrol;CNG;Hybrid;Electric;Octane;LPG;Other": ValuesListEnum.DIESEL_PETROL_CNG_HYBRID_ELECTRIC_OCTANE_LPG_OTHER,
  "": ValuesListEnum.EMPTY
});

class CategoryCustomField {
  CategoryCustomField({
    this.fieldId,
    this.catId,
    this.fieldName,
    this.trFieldName,
    this.fieldType,
    this.valuesList,
    this.trValuesList,
    this.tooltip,
    this.trTooltip,
    this.icon,
    this.required,
    this.searchable,
    this.fieldValue,
  });

  String fieldId;
  String catId;
  String fieldName;
  String trFieldName;
  FieldType fieldType;
  List<String> valuesList;
  String trValuesList;
  Tooltip tooltip;
  Tooltip trTooltip;
  Icon icon;
  String required;
  String searchable;
  String fieldValue;

  factory CategoryCustomField.fromJson(Map<String, dynamic> json) => CategoryCustomField(
    fieldId: json["field_id"] == null ? null : json["field_id"],
    catId: json["cat_id"] == null ? null : json["cat_id"],
    fieldName: json["field_name"] == null ? null : json["field_name"],
    trFieldName: json["tr_field_name"] == null ? null : json["tr_field_name"],
    fieldType: json["field_type"] == null ? null : fieldTypeValues.map[json["field_type"]],
    valuesList: json["values_list"] == null ? null : List<String>.from(json["values_list"].map((x) => x)),
    trValuesList: json["tr_values_list"] == null ? null : json["tr_values_list"],
    tooltip: json["tooltip"] == null ? null : tooltipValues.map[json["tooltip"]],
    trTooltip: json["tr_tooltip"] == null ? null : tooltipValues.map[json["tr_tooltip"]],
    icon: json["icon"] == null ? null : iconValues.map[json["icon"]],
    required: json["required"] == null ? null : json["required"],
    searchable: json["searchable"] == null ? null : json["searchable"],
    fieldValue: json["field_value"] == null ? null : json["field_value"],
  );

  Map<String, dynamic> toJson() => {
    "field_id": fieldId == null ? null : fieldId,
    "cat_id": catId == null ? null : catId,
    "field_name": fieldName == null ? null : fieldName,
    "tr_field_name": trFieldName == null ? null : trFieldName,
    "field_type": fieldType == null ? null : fieldTypeValues.reverse[fieldType],
    "values_list": valuesList == null ? null : List<dynamic>.from(valuesList.map((x) => x)),
    "tr_values_list": trValuesList == null ? null : trValuesList,
    "tooltip": tooltip == null ? null : tooltipValues.reverse[tooltip],
    "tr_tooltip": trTooltip == null ? null : tooltipValues.reverse[trTooltip],
    "icon": icon == null ? null : iconValues.reverse[icon],
    "required": required == null ? null : required,
    "searchable": searchable == null ? null : searchable,
    "field_value": fieldValue == null ? null : fieldValue,
  };
}

class City {
  City({
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

  factory City.fromJson(Map<String, dynamic> json) => City(
    stateId: json["state_id"] == null ? null : json["state_id"],
    stateName: json["state_name"] == null ? null : json["state_name"],
    stateAbbr: json["state_abbr"] == null ? null : json["state_abbr"],
    slug: json["slug"] == null ? null : json["slug"],
    countryAbbr: json["country_abbr"] == null ? null : countryAbbrValues.map[json["country_abbr"]],
    countryId: json["country_id"] == null ? null : json["country_id"],
  );

  Map<String, dynamic> toJson() => {
    "state_id": stateId == null ? null : stateId,
    "state_name": stateName == null ? null : stateName,
    "state_abbr": stateAbbr == null ? null : stateAbbr,
    "slug": slug == null ? null : slug,
    "country_abbr": countryAbbr == null ? null : countryAbbrValues.reverse[countryAbbr],
    "country_id": countryId == null ? null : countryId,
  };
}

enum CountryAbbr { SO }

final countryAbbrValues = EnumValues({
  "SO": CountryAbbr.SO
});

class CustomFieldValue {
  CustomFieldValue({
    this.fieldId,
    this.catId,
    this.fieldName,
    this.trFieldName,
    this.fieldType,
    this.valuesList,
    this.trValuesList,
    this.tooltip,
    this.trTooltip,
    this.icon,
    this.required,
    this.searchable,
    this.fieldValue,
  });

  String fieldId;
  dynamic catId;
  String fieldName;
  String trFieldName;
  String fieldType;
  dynamic valuesList;
  String trValuesList;
  Tooltip tooltip;
  Tooltip trTooltip;
  Icon icon;
  String required;
  dynamic searchable;
  String fieldValue;

  factory CustomFieldValue.fromJson(Map<String, dynamic> json) => CustomFieldValue(
    fieldId: json["field_id"] == null ? null : json["field_id"],
    catId: json["cat_id"],
    fieldName: json["field_name"] == null ? null : json["field_name"],
    trFieldName: json["tr_field_name"] == null ? null : json["tr_field_name"],
    fieldType: json["field_type"] == null ? null : json["field_type"],
    valuesList: json["values_list"],
    trValuesList: json["tr_values_list"] == null ? null : json["tr_values_list"],
    tooltip: json["tooltip"] == null ? null : tooltipValues.map[json["tooltip"]],
    trTooltip: json["tr_tooltip"] == null ? null : tooltipValues.map[json["tr_tooltip"]],
    icon: json["icon"] == null ? null : iconValues.map[json["icon"]],
    required: json["required"] == null ? null : json["required"],
    searchable: json["searchable"],
    fieldValue: json["field_value"] == null ? null : json["field_value"],
  );

  Map<String, dynamic> toJson() => {
    "field_id": fieldId == null ? null : fieldId,
    "cat_id": catId,
    "field_name": fieldName == null ? null : fieldName,
    "tr_field_name": trFieldName == null ? null : trFieldName,
    "field_type": fieldType == null ? null : fieldType,
    "values_list": valuesList,
    "tr_values_list": trValuesList == null ? null : trValuesList,
    "tooltip": tooltip == null ? null : tooltipValues.reverse[tooltip],
    "tr_tooltip": trTooltip == null ? null : tooltipValues.reverse[trTooltip],
    "icon": icon == null ? null : iconValues.reverse[icon],
    "required": required == null ? null : required,
    "searchable": searchable,
    "field_value": fieldValue == null ? null : fieldValue,
  };
}

class State {
  State({
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

  factory State.fromJson(Map<String, dynamic> json) => State(
    cityId: json["city_id"] == null ? null : json["city_id"],
    cityName: json["city_name"] == null ? null : json["city_name"],
    state: json["state"] == null ? null : json["state"],
    stateId: json["state_id"] == null ? null : json["state_id"],
    slug: json["slug"] == null ? null : json["slug"],
    lat: json["lat"] == null ? null : json["lat"],
    lng: json["lng"] == null ? null : json["lng"],
  );

  Map<String, dynamic> toJson() => {
    "city_id": cityId == null ? null : cityId,
    "city_name": cityName == null ? null : cityName,
    "state": state == null ? null : state,
    "state_id": stateId == null ? null : stateId,
    "slug": slug == null ? null : slug,
    "lat": lat == null ? null : lat,
    "lng": lng == null ? null : lng,
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
