import 'dart:convert';

import 'package:real_services/models/add_brand_model.dart';

InventoryDispatchModel inventoryDispatchModelFromJson(String str) =>
    InventoryDispatchModel.fromJson(json.decode(str));

String inventoryDispatchModelToJson(InventoryDispatchModel data) =>
    json.encode(data.toJson());

class InventoryDispatchModel {
  int id;

  int qty;
  double rate;
  String destination;
  double frieght;
  double unloading;
  String vehical;
  double totalAmount;
  CustomerModel customer;
  BrandModel brand;

  InventoryDispatchModel(
      {this.id,
      this.qty,
      this.rate,
      this.destination,
      this.frieght,
      this.unloading,
      this.vehical,
      this.totalAmount,
      this.customer,
      this.brand});

  InventoryDispatchModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    qty = json['qty'];
    rate = json['rate'];
    destination = json['destination'];
    frieght = json['frieght'];
    unloading = json['unloading'];
    vehical = json['vehical'];
    totalAmount = json['totalAmount'];
    customer = json['customer'] != null
        ? new CustomerModel.fromJson(json['customer'])
        : null;
    brand =
        json['brand'] != null ? new BrandModel.fromJson(json['brand']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;

    data['qty'] = this.qty;
    data['rate'] = this.rate;
    data['destination'] = this.destination;
    data['frieght'] = this.frieght;
    data['unloading'] = this.unloading;
    data['vehical'] = this.vehical;
    data['totalAmount'] = this.totalAmount;
    if (this.customer != null) {
      data['customer'] = this.customer.toJson();
    }
    if (this.brand != null) {
      data['brand'] = this.brand.toJson();
    }
    return data;
  }
}

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

BrandModel brandModelFromJson(String str) =>
    BrandModel.fromJson(json.decode(str));

String brandModelToJson(BrandModel data) => json.encode(data.toJson());

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
