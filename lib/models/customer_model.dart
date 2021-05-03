import 'dart:convert';

CustomerModel companyRecoverModelFromJson(String str) =>
    CustomerModel.fromJson(json.decode(str));

String companyRecoverModelToJson(CustomerModel data) =>
    json.encode(data.toJson());

class CustomerModel {
  int id;
  String name;
  int contact;
  double openingBalance;
  String date;

  CustomerModel(
      {this.id, this.name, this.contact, this.openingBalance, this.date});

  CustomerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    contact = json['contact'];
    openingBalance = json['opening_Balance'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['contact'] = this.contact;
    data['opening_Balance'] = this.openingBalance;
    data['date'] = this.date;
    return data;
  }
}
