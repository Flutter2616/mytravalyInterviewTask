import 'dart:convert';

HotelModel hotelModelFromJson(String str) => HotelModel.fromJson(json.decode(str));

String hotelModelToJson(HotelModel data) => json.encode(data.toJson());

class HotelModel {
  String propertyName;
  int propertyStar;
  String propertyImage;
  String propertyCode;
  String propertyType;
  PropertyPoliciesAndAmmenities propertyPoliciesAndAmmenities;
  Price markedPrice;
  Price staticPrice;
  GoogleReview googleReview;
  String propertyUrl;
  PropertyAddress propertyAddress;

  HotelModel({
    required this.propertyName,
    required this.propertyStar,
    required this.propertyImage,
    required this.propertyCode,
    required this.propertyType,
    required this.propertyPoliciesAndAmmenities,
    required this.markedPrice,
    required this.staticPrice,
    required this.googleReview,
    required this.propertyUrl,
    required this.propertyAddress,
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) => HotelModel(
    propertyName: json["propertyName"]??"",
    propertyStar: json["propertyStar"]??0,
    propertyImage: json["propertyImage"]??"",
    propertyCode: json["propertyCode"]??"",
    propertyType: json["propertyType"]??"",
    propertyPoliciesAndAmmenities: PropertyPoliciesAndAmmenities.fromJson(json["propertyPoliciesAndAmmenities"]??{}),
    markedPrice: Price.fromJson(json["markedPrice"]??{}),
    staticPrice: Price.fromJson(json["staticPrice"]??{}),
    googleReview: GoogleReview.fromJson(json["googleReview"]??{}),
    propertyUrl: json["propertyUrl"]??"",
    propertyAddress: PropertyAddress.fromJson(json["propertyAddress"]??{}),
  );

  Map<String, dynamic> toJson() => {
    "propertyName": propertyName,
    "propertyStar": propertyStar,
    "propertyImage": propertyImage,
    "propertyCode": propertyCode,
    "propertyType": propertyType,
    "propertyPoliciesAndAmmenities": propertyPoliciesAndAmmenities.toJson(),
    "markedPrice": markedPrice.toJson(),
    "staticPrice": staticPrice.toJson(),
    "googleReview": googleReview.toJson(),
    "propertyUrl": propertyUrl,
    "propertyAddress": propertyAddress.toJson(),
  };
}

class GoogleReview {
  bool reviewPresent;
  GoogleReviewData data;

  GoogleReview({
    required this.reviewPresent,
    required this.data,
  });

  factory GoogleReview.fromJson(Map<String, dynamic> json) => GoogleReview(
    reviewPresent: json["reviewPresent"]??false,
    data: GoogleReviewData.fromJson(json["data"]??{}),
  );

  Map<String, dynamic> toJson() => {
    "reviewPresent": reviewPresent,
    "data": data.toJson(),
  };
}

class GoogleReviewData {
  double overallRating;
  int totalUserRating;
  int withoutDecimal;

  GoogleReviewData({
    required this.overallRating,
    required this.totalUserRating,
    required this.withoutDecimal,
  });

  factory GoogleReviewData.fromJson(Map<String, dynamic> json) => GoogleReviewData(
    overallRating: (json["overallRating"]??0.0)?.toDouble(),
    totalUserRating: json["totalUserRating"]??0,
    withoutDecimal: json["withoutDecimal"]??0,
  );

  Map<String, dynamic> toJson() => {
    "overallRating": overallRating,
    "totalUserRating": totalUserRating,
    "withoutDecimal": withoutDecimal,
  };
}

class Price {
  double amount;
  String displayAmount;
  String currencyAmount;
  String currencySymbol;

  Price({
    required this.amount,
    required this.displayAmount,
    required this.currencyAmount,
    required this.currencySymbol,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    amount: (json["amount"]??0.0)?.toDouble(),
    displayAmount: json["displayAmount"]??false,
    currencyAmount: json["currencyAmount"]??false,
    currencySymbol: json["currencySymbol"]??false,
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "displayAmount": displayAmount,
    "currencyAmount": currencyAmount,
    "currencySymbol": currencySymbol,
  };
}

class PropertyAddress {
  String street;
  String city;
  String state;
  String country;
  String zipcode;
  String mapAddress;
  double latitude;
  double longitude;

  PropertyAddress({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.zipcode,
    required this.mapAddress,
    required this.latitude,
    required this.longitude,
  });

  factory PropertyAddress.fromJson(Map<String, dynamic> json) => PropertyAddress(
    street: json["street"]??"",
    city: json["city"]??"",
    state: json["state"]??"",
    country: json["country"]??"",
    zipcode: json["zipcode"]??"",
    mapAddress: json["map_address"]??"",
    latitude: (json["latitude"]??0.0)?.toDouble(),
    longitude: (json["longitude"]??0.0)?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "street": street,
    "city": city,
    "state": state,
    "country": country,
    "zipcode": zipcode,
    "map_address": mapAddress,
    "latitude": latitude,
    "longitude": longitude,
  };
}

class PropertyPoliciesAndAmmenities {
  bool present;
  PropertyPoliciesAndAmmenitiesData data;

  PropertyPoliciesAndAmmenities({
    required this.present,
    required this.data,
  });

  factory PropertyPoliciesAndAmmenities.fromJson(Map<String, dynamic> json) => PropertyPoliciesAndAmmenities(
    present: json["present"]??false,
    data: PropertyPoliciesAndAmmenitiesData.fromJson(json["data"]??{}),
  );

  Map<String, dynamic> toJson() => {
    "present": present,
    "data": data.toJson(),
  };
}

class PropertyPoliciesAndAmmenitiesData {
  String cancelPolicy;
  String refundPolicy;
  String childPolicy;
  String damagePolicy;
  String propertyRestriction;
  bool petsAllowed;
  bool coupleFriendly;
  bool suitableForChildren;
  bool bachularsAllowed;
  bool freeWifi;
  bool freeCancellation;
  bool payAtHotel;
  bool payNow;
  DateTime lastUpdatedOn;

  PropertyPoliciesAndAmmenitiesData({
    required this.cancelPolicy,
    required this.refundPolicy,
    required this.childPolicy,
    required this.damagePolicy,
    required this.propertyRestriction,
    required this.petsAllowed,
    required this.coupleFriendly,
    required this.suitableForChildren,
    required this.bachularsAllowed,
    required this.freeWifi,
    required this.freeCancellation,
    required this.payAtHotel,
    required this.payNow,
    required this.lastUpdatedOn,
  });

  factory PropertyPoliciesAndAmmenitiesData.fromJson(Map<String, dynamic> json) => PropertyPoliciesAndAmmenitiesData(
    cancelPolicy: json["cancelPolicy"]??"",
    refundPolicy: json["refundPolicy"]??"",
    childPolicy: json["childPolicy"]??"",
    damagePolicy: json["damagePolicy"]??"",
    propertyRestriction: json["propertyRestriction"]??"",
    petsAllowed: json["petsAllowed"]??false,
    coupleFriendly: json["coupleFriendly"]??false,
    suitableForChildren: json["suitableForChildren"]??false,
    bachularsAllowed: json["bachularsAllowed"]??false,
    freeWifi: json["freeWifi"]??false,
    freeCancellation: json["freeCancellation"]??false,
    payAtHotel: json["payAtHotel"]??false,
    payNow: json["payNow"]??false,
    lastUpdatedOn: DateTime.parse(json["lastUpdatedOn"]),
  );

  Map<String, dynamic> toJson() => {
    "cancelPolicy": cancelPolicy,
    "refundPolicy": refundPolicy,
    "childPolicy": childPolicy,
    "damagePolicy": damagePolicy,
    "propertyRestriction": propertyRestriction,
    "petsAllowed": petsAllowed,
    "coupleFriendly": coupleFriendly,
    "suitableForChildren": suitableForChildren,
    "bachularsAllowed": bachularsAllowed,
    "freeWifi": freeWifi,
    "freeCancellation": freeCancellation,
    "payAtHotel": payAtHotel,
    "payNow": payNow,
    "lastUpdatedOn": lastUpdatedOn.toIso8601String(),
  };
}
