import 'dart:convert';

WarehouseDispatchModel warehouseDispatchModelFromJson(String str) =>
    WarehouseDispatchModel.fromJson(json.decode(str));

String warehouseDispatchModelToJson(WarehouseDispatchModel data) =>
    json.encode(data.toJson());

class WarehouseDispatchModel {
  int id;
  String date;
  String slug;
  String destination;
  String orderStatus;
  int qty;
  int rate;
  int frieght;
  int unloading;
  int totalAmount;
  DriverDataModel driver;
  Company company;
  BrandModel brand;

  WarehouseDispatchModel(
      {this.id,
      this.date,
      this.slug,
      this.destination,
      this.qty,
      this.rate,
      this.frieght,
      this.unloading,
      this.totalAmount,
      this.driver,
      this.orderStatus,
      this.company,
      this.brand});

  WarehouseDispatchModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    slug = json['slug'];
    orderStatus = json['orderStatus'];
    destination = json['Destination'];
    qty = json['qty'];
    rate = json['rate'];
    frieght = json['Frieght'];
    unloading = json['unloading'];
    totalAmount = json['total_amount'];
    driver = json['Driver'] != null
        ? new DriverDataModel.fromJson(json['Driver'])
        : null;
    company =
        json['company'] != null ? new Company.fromJson(json['company']) : null;
    brand =
        json['brand'] != null ? new BrandModel.fromJson(json['brand']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['slug'] = this.slug;
    data['Destination'] = this.destination;
    data['qty'] = this.qty;
    data['orderStatus'] = this.orderStatus;
    data['rate'] = this.rate;
    data['Frieght'] = this.frieght;
    data['unloading'] = this.unloading;
    data['total_amount'] = this.totalAmount;
    if (this.driver != null) {
      data['Driver'] = this.driver.toJson();
    }
    if (this.company != null) {
      data['company'] = this.company.toJson();
    }
    if (this.brand != null) {
      data['brand'] = this.brand.toJson();
    }
    return data;
  }
}

DriverDataModel driverdatamodelModelFromJson(String str) =>
    DriverDataModel.fromJson(json.decode(str));

String driverdatamodelModelToJson(DriverDataModel data) =>
    json.encode(data.toJson());

class DriverDataModel {
  int id;
  String name;
  int vihicalNo;
  int contact;

  DriverDataModel({this.id, this.name, this.vihicalNo, this.contact});

  DriverDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    vihicalNo = json['vihical_no'];
    contact = json['contact'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['vihical_no'] = this.vihicalNo;
    data['contact'] = this.contact;
    return data;
  }
}

Company companyModelFromJson(String str) => Company.fromJson(json.decode(str));

String companyModelToJson(Company data) => json.encode(data.toJson());

class Company {
  int id;
  String name;
  int contact;
  int openingBalance;
  String date;

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

BrandModel userModelFromJson(String str) =>
    BrandModel.fromJson(json.decode(str));

String userModelToJson(BrandModel data) => json.encode(data.toJson());

class BrandModel {
  int id;
  String name;

  BrandModel({this.id, this.name});

  BrandModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
