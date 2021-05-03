import 'dart:convert';

Company companyModelFromJson(String str) => Company.fromJson(json.decode(str));

String companyModelToJson(Company data) => json.encode(data.toJson());

class Company {
  int id;
  var name;
  var contact;
  var openingBalance;
  var date;

  Company({this.id, this.name, this.contact, this.openingBalance, this.date});

  Company.fromJson(Map<String, dynamic> json) {
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
