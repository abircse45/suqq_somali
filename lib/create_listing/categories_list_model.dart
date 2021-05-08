// To parse this JSON data, do
//
//     final categoryListing = categoryListingFromJson(jsonString);

import 'dart:convert';

CategoryListing categoryListingFromJson(String str) =>
    CategoryListing.fromJson(json.decode(str));

String categoryListingToJson(CategoryListing data) =>
    json.encode(data.toJson());

class CategoryListing {
  CategoryListing({
    this.status,
    this.categoriesTree,
    this.categories,
    this.customFields,
  });

  int status;
  List<Categor> categoriesTree;
  List<Categor> categories;
  Map<String, CustomFieldValue> customFields;

  factory CategoryListing.fromJson(Map<String, dynamic> json) =>
      CategoryListing(
        status: json["status"],
        categoriesTree: List<Categor>.from(
            json["categories_tree"].map((x) => Categor.fromJson(x))),
        categories: List<Categor>.from(
            json["categories"].map((x) => Categor.fromJson(x))),
        // customFields: Map.from(json["custom_fields"]).map((k, v) =>
        //     MapEntry<String, CustomFieldValue>(
        //         k, CustomFieldValue.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "categories_tree":
            List<dynamic>.from(categoriesTree.map((x) => x.toJson())),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "custom_fields": Map.from(customFields)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class Categor {
  Categor({
    this.catId,
    this.catName,
    this.catSlug,
    this.pluralName,
    this.parentId,
    //this.catIcon,
    this.catLink,
    this.customFields,
    this.childs,
  });

  String catId;
  String catName;
  String catSlug;
  String pluralName;
  String parentId;
  //Icon catIcon;
  String catLink;
  List<CategoryCustomField> customFields;
  List<Child> childs;

  factory Categor.fromJson(Map<String, dynamic> json) => Categor(
        catId: json["cat_id"],
        catName: json["cat_name"],
        catSlug: json["cat_slug"],
        pluralName: json["plural_name"],
        parentId: json["parent_id"],
       // catIcon: iconValues.map[json["cat_icon"]],
        catLink: json["cat_link"],
        customFields: List<CategoryCustomField>.from(
            json["custom_fields"].map((x) => CategoryCustomField.fromJson(x))),
        childs: json["childs"] == null
            ? null
            : List<Child>.from(json["childs"].map((x) => Child.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cat_id": catId,
        "cat_name": catName,
        "cat_slug": catSlug,
        "plural_name": pluralName,
        "parent_id": parentId,
        //"cat_icon": iconValues.reverse[catIcon],
        "cat_link": catLink,
        "custom_fields":
            List<dynamic>.from(customFields.map((x) => x.toJson())),
        "childs": childs == null
            ? null
            : List<dynamic>.from(childs.map((x) => x.toJson())),
      };
}

// enum Icon {
//   EMPTY,
//   I_CLASS_FAS_FA_CAR_I,
//   I_CLASS_FAS_FA_CAR_BATTERY_I,
//   I_CLASS_FAS_FA_FILL_DRIP_I,
//   I_CLASS_FAS_FA_CALENDAR_ALT_I,
//   I_CLASS_FAS_FA_GAS_PUMP_I,
//   I_CLASS_FAS_FA_BUILDING_I,
//   I_CLASS_FAS_FA_BED_I,
//   I_CLASS_FAS_FA_BATH_I,
//   I_CLASS_FAS_FA_WAREHOUSE_I
// }

// final iconValues = EnumValues({
//   "": Icon.EMPTY,
//   "<i class=\"fas fa-bath\"></i>": Icon.I_CLASS_FAS_FA_BATH_I,
//   "<i class=\"fas fa-bed\"></i>": Icon.I_CLASS_FAS_FA_BED_I,
//   "<i class=\"fas fa-building\"></i>": Icon.I_CLASS_FAS_FA_BUILDING_I,
//   "<i class=\"fas fa-calendar-alt\"></i>": Icon.I_CLASS_FAS_FA_CALENDAR_ALT_I,
//   "<i class=\"fas fa-car-battery\"></i>": Icon.I_CLASS_FAS_FA_CAR_BATTERY_I,
//   "<i class=\"fas fa-car\"></i>": Icon.I_CLASS_FAS_FA_CAR_I,
//   "<i class=\"fas fa-fill-drip\"></i>": Icon.I_CLASS_FAS_FA_FILL_DRIP_I,
//   "<i class=\"fas fa-gas-pump\"></i>": Icon.I_CLASS_FAS_FA_GAS_PUMP_I,
//   "<i class=\"fas fa-warehouse\"></i>": Icon.I_CLASS_FAS_FA_WAREHOUSE_I
// });

class Child {
  Child({
    this.catId,
    this.catName,
    this.catSlug,
    this.pluralName,
    this.parentId,
   // this.catIcon,
    this.catLink,
    this.customFields,
  });

  String catId;
  String catName;
  String catSlug;
  String pluralName;
  String parentId;
  //CatIcon catIcon;
  String catLink;
  List<CustomFieldValue> customFields;

  factory Child.fromJson(Map<String, dynamic> json) => Child(
        catId: json["cat_id"],
        catName: json["cat_name"],
        catSlug: json["cat_slug"],
        pluralName: json["plural_name"],
        parentId: json["parent_id"],
       // catIcon: catIconValues.map[json["cat_icon"]],
        catLink: json["cat_link"],
        customFields: List<CustomFieldValue>.from(
            json["custom_fields"].map((x) => CustomFieldValue.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cat_id": catId,
        "cat_name": catName,
        "cat_slug": catSlug,
        "plural_name": pluralName,
        "parent_id": parentId,
      //  "cat_icon": catIconValues.reverse[catIcon],
        "cat_link": catLink,
        "custom_fields":
            List<dynamic>.from(customFields.map((x) => x.toJson())),
      };
}

//enum CatIcon { EMPTY, I_CLASS_FA_FA_TRASH_I }

// final catIconValues = EnumValues({
//   "": CatIcon.EMPTY,
//   "<i class=\"fa fa-trash\"></i>": CatIcon.I_CLASS_FA_FA_TRASH_I
// });

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
    //this.icon,
    this.required,
    this.searchable,
    this.fieldValue,
  });

  String fieldId;
  dynamic catId;
  String fieldName;
  String trFieldName;
  FieldType fieldType;
  dynamic valuesList;
  String trValuesList;
  Tooltip tooltip;
  Tooltip trTooltip;
  //Icon icon;
  String required;
  dynamic searchable;
  String fieldValue;

  factory CustomFieldValue.fromJson(Map<String, dynamic> json) =>
      CustomFieldValue(
        fieldId: json["field_id"],
        catId: json["cat_id"],
        fieldName: json["field_name"],
        trFieldName: json["tr_field_name"],
        fieldType: fieldTypeValues.map[json["field_type"]],
        valuesList: json["values_list"],
        trValuesList: json["tr_values_list"],
        tooltip: tooltipValues.map[json["tooltip"]],
        trTooltip: tooltipValues.map[json["tr_tooltip"]],
      //  icon: iconValues.map[json["icon"]],
        required: json["required"],
        searchable: json["searchable"],
        fieldValue: json["field_value"],
      );

  Map<String, dynamic> toJson() => {
        "field_id": fieldId,
        "cat_id": catId,
        "field_name": fieldName,
        "tr_field_name": trFieldName,
        "field_type": fieldTypeValues.reverse[fieldType],
        "values_list": valuesList,
        "tr_values_list": trValuesList,
        "tooltip": tooltipValues.reverse[tooltip],
        "tr_tooltip": tooltipValues.reverse[trTooltip],
      //  "icon": iconValues.reverse[icon],
        "required": required,
        "searchable": searchable,
        "field_value": fieldValue,
      };
}

enum FieldType { SELECT, TEXT, CHECKBOX, NUMBER }

final fieldTypeValues = EnumValues({
  "checkbox": FieldType.CHECKBOX,
  "number": FieldType.NUMBER,
  "select": FieldType.SELECT,
  "text": FieldType.TEXT
});

enum Tooltip {
  EMPTY,
  TYPE_OF_CAR,
  COLOR,
  TRANSMISSION,
  CAR_MODEL_YEAR,
  CURRENT_VEHICLE_MILEAGE
}

final tooltipValues = EnumValues({
  "Car Model Year": Tooltip.CAR_MODEL_YEAR,
  "Color": Tooltip.COLOR,
  "Current vehicle mileage": Tooltip.CURRENT_VEHICLE_MILEAGE,
  "": Tooltip.EMPTY,
  "Transmission": Tooltip.TRANSMISSION,
  "Type of car": Tooltip.TYPE_OF_CAR
});

enum ValuesListEnum {
  EMPTY,
  DIESEL_PETROL_CNG_HYBRID_ELECTRIC_OCTANE_LPG_OTHER
}

final valuesListEnumValues = EnumValues({
  "Diesel;Petrol;CNG;Hybrid;Electric;Octane;LPG;Other":
      ValuesListEnum.DIESEL_PETROL_CNG_HYBRID_ELECTRIC_OCTANE_LPG_OTHER,
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
    //this.icon,
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
  //Icon icon;
  String required;
  String searchable;
  String fieldValue;

  factory CategoryCustomField.fromJson(Map<String, dynamic> json) =>
      CategoryCustomField(
        fieldId: json["field_id"],
        catId: json["cat_id"],
        fieldName: json["field_name"],
        trFieldName: json["tr_field_name"],
        fieldType: fieldTypeValues.map[json["field_type"]],
        valuesList: List<String>.from(json["values_list"].map((x) => x)),
        trValuesList: json["tr_values_list"],
        tooltip: tooltipValues.map[json["tooltip"]],
        trTooltip: tooltipValues.map[json["tr_tooltip"]],
    //    icon: iconValues.map[json["icon"]],
        required: json["required"],
        searchable: json["searchable"],
        fieldValue: json["field_value"],
      );

  Map<String, dynamic> toJson() => {
        "field_id": fieldId,
        "cat_id": catId,
        "field_name": fieldName,
        "tr_field_name": trFieldName,
        "field_type": fieldTypeValues.reverse[fieldType],
        "values_list": List<dynamic>.from(valuesList.map((x) => x)),
        "tr_values_list": trValuesList,
        "tooltip": tooltipValues.reverse[tooltip],
        "tr_tooltip": tooltipValues.reverse[trTooltip],
       // "icon": iconValues.reverse[icon],
        "required": required,
        "searchable": searchable,
        "field_value": fieldValue,
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
