// To parse this JSON data, do
//
// final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
    DataModel({
        this.name,
        this.contactNo,
        this.location,
        this.price,
        this.addedNotes,
        this.verification,
    });

    String name;
    String contactNo;
    String location;
    String price;
    String addedNotes;
    String verification;

    factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        name: json["NAME"],
        contactNo: json["CONTACT_NO"],
        location: json["LOCATION"],
        price: json["PRICE"],
        addedNotes: json["ADDED NOTES"],
        verification: json["VERIFICATION"],
    );

    Map<String, dynamic> toJson() => {
        "NAME": name,
        "CONTACT_NO": contactNo,
        "LOCATION": location,
        "PRICE": price,
        "ADDED NOTES": addedNotes,
        "VERIFICATION": verification,
    };
}
