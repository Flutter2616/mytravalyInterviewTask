// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  bool present;
  int totalNumberOfResult;
  AutoCompleteList autoCompleteList;

  SearchModel({
    required this.present,
    required this.totalNumberOfResult,
    required this.autoCompleteList,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    present: json["present"]??false,
    totalNumberOfResult: json["totalNumberOfResult"]??0,
    autoCompleteList: AutoCompleteList.fromJson(json["autoCompleteList"]??{}),
  );

  Map<String, dynamic> toJson() => {
    "present": present,
    "totalNumberOfResult": totalNumberOfResult,
    "autoCompleteList": autoCompleteList.toJson(),
  };
}

class AutoCompleteList {
  ByPropertyName byPropertyName;
  By byStreet;
  By byCity;
  By byState;
  ByCountry byCountry;

  AutoCompleteList({
    required this.byPropertyName,
    required this.byStreet,
    required this.byCity,
    required this.byState,
    required this.byCountry,
  });

  factory AutoCompleteList.fromJson(Map<String, dynamic> json) => AutoCompleteList(
    byPropertyName: ByPropertyName.fromJson(json["byPropertyName"]??{}),
    byStreet: By.fromJson(json["byStreet"]??{}),
    byCity: By.fromJson(json["byCity"]??{}),
    byState: By.fromJson(json["byState"]??{}),
    byCountry: ByCountry.fromJson(json["byCountry"]??{}),
  );

  Map<String, dynamic> toJson() => {
    "byPropertyName": byPropertyName.toJson(),
    "byStreet": byStreet.toJson(),
    "byCity": byCity.toJson(),
    "byState": byState.toJson(),
    "byCountry": byCountry.toJson(),
  };
}

class By {
  bool present;
  List<ByCityListOfResult> listOfResult;
  int numberOfResult;

  By({
    required this.present,
    required this.listOfResult,
    required this.numberOfResult,
  });

  factory By.fromJson(Map<String, dynamic> json) => By(
    present: json["present"]??false,
    listOfResult: List<ByCityListOfResult>.from((json["listOfResult"]??[]).map((x) => ByCityListOfResult.fromJson(x))),
    numberOfResult: json["numberOfResult"]??0,
  );

  Map<String, dynamic> toJson() => {
    "present": present,
    "listOfResult": List<dynamic>.from(listOfResult.map((x) => x.toJson())),
    "numberOfResult": numberOfResult,
  };
}

class ByCityListOfResult {
  String valueToDisplay;
  PurpleAddress address;
  SearchArray searchArray;

  ByCityListOfResult({
    required this.valueToDisplay,
    required this.address,
    required this.searchArray,
  });

  factory ByCityListOfResult.fromJson(Map<String, dynamic> json) => ByCityListOfResult(
    valueToDisplay: json["valueToDisplay"]??"",
    address: PurpleAddress.fromJson(json["address"]??{}),
    searchArray: SearchArray.fromJson(json["searchArray"]??{}),
  );

  Map<String, dynamic> toJson() => {
    "valueToDisplay": valueToDisplay,
    "address": address.toJson(),
    "searchArray": searchArray.toJson(),
  };
}

class PurpleAddress {
  String city;
  String state;
  String country;
  String street;

  PurpleAddress({
    required this.city,
    required this.state,
    required this.country,
    required this.street,
  });

  factory PurpleAddress.fromJson(Map<String, dynamic> json) => PurpleAddress(
    city: json["city"]??"",
    state: json["state"]??"",
    country: json["country"]??"",
    street: json["street"]??"",
  );

  Map<String, dynamic> toJson() => {
    "city": city,
    "state": state,
    "country": country,
    "street": street,
  };
}

class SearchArray {
  String type;
  List<String> query;

  SearchArray({
    required this.type,
    required this.query,
  });

  factory SearchArray.fromJson(Map<String, dynamic> json) => SearchArray(
    type: json["type"]??"",
    query: List<String>.from((json["query"]??[]).map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "query": List<dynamic>.from(query.map((x) => x)),
  };
}

class ByCountry {
  bool present;
  List<ByCountryListOfResult> listOfResult;
  int numberOfResult;

  ByCountry({
    required this.present,
    required this.listOfResult,
    required this.numberOfResult,
  });

  factory ByCountry.fromJson(Map<String, dynamic> json) => ByCountry(
    present: json["present"]??false,
    listOfResult: List<ByCountryListOfResult>.from((json["listOfResult"]??[]).map((x) => ByCountryListOfResult.fromJson(x))),
    numberOfResult: json["numberOfResult"]??0,
  );

  Map<String, dynamic> toJson() => {
    "present": present,
    "listOfResult": List<dynamic>.from(listOfResult.map((x) => x.toJson())),
    "numberOfResult": numberOfResult,
  };
}

class ByCountryListOfResult {
  String valueToDisplay;
  FluffyAddress address;
  SearchArray searchArray;

  ByCountryListOfResult({
    required this.valueToDisplay,
    required this.address,
    required this.searchArray,
  });

  factory ByCountryListOfResult.fromJson(Map<String, dynamic> json) => ByCountryListOfResult(
    valueToDisplay: json["valueToDisplay"]??"",
    address: FluffyAddress.fromJson(json["address"]??{}),
    searchArray: SearchArray.fromJson(json["searchArray"]??{}),
  );

  Map<String, dynamic> toJson() => {
    "valueToDisplay": valueToDisplay,
    "address": address.toJson(),
    "searchArray": searchArray.toJson(),
  };
}

class FluffyAddress {
  String country;

  FluffyAddress({
    required this.country,
  });

  factory FluffyAddress.fromJson(Map<String, dynamic> json) => FluffyAddress(
    country: json["country"]??"",
  );

  Map<String, dynamic> toJson() => {
    "country": country,
  };
}

class ByPropertyName {
  bool present;
  List<ByPropertyNameListOfResult> listOfResult;
  int numberOfResult;

  ByPropertyName({
    required this.present,
    required this.listOfResult,
    required this.numberOfResult,
  });

  factory ByPropertyName.fromJson(Map<String, dynamic> json) => ByPropertyName(
    present: json["present"]??false,
    listOfResult: List<ByPropertyNameListOfResult>.from((json["listOfResult"]??[]).map((x) => ByPropertyNameListOfResult.fromJson(x))),
    numberOfResult: json["numberOfResult"]??0,
  );

  Map<String, dynamic> toJson() => {
    "present": present,
    "listOfResult": List<dynamic>.from(listOfResult.map((x) => x.toJson())),
    "numberOfResult": numberOfResult,
  };
}

class ByPropertyNameListOfResult {
  String valueToDisplay;
  String propertyName;
  TentacledAddress address;
  SearchArray searchArray;

  ByPropertyNameListOfResult({
    required this.valueToDisplay,
    required this.propertyName,
    required this.address,
    required this.searchArray,
  });

  factory ByPropertyNameListOfResult.fromJson(Map<String, dynamic> json) => ByPropertyNameListOfResult(
    valueToDisplay: json["valueToDisplay"]??"",
    propertyName: json["propertyName"]??"",
    address: TentacledAddress.fromJson(json["address"]??{}),
    searchArray: SearchArray.fromJson(json["searchArray"]??{}),
  );

  Map<String, dynamic> toJson() => {
    "valueToDisplay": valueToDisplay,
    "propertyName": propertyName,
    "address": address.toJson(),
    "searchArray": searchArray.toJson(),
  };
}

class TentacledAddress {
  String city;
  String state;

  TentacledAddress({
    required this.city,
    required this.state,
  });

  factory TentacledAddress.fromJson(Map<String, dynamic> json) => TentacledAddress(
    city: json["city"]??"",
    state: json["state"]??"",
  );

  Map<String, dynamic> toJson() => {
    "city": city,
    "state": state,
  };
}
