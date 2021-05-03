import 'dart:convert';

WarehouseEnventoryModel warehouseEventoryModelFromJson(String str) =>
    WarehouseEnventoryModel.fromJson(json.decode(str));

String warehouseEventoryModelToJson(WarehouseEnventoryModel data) =>
    json.encode(data.toJson());

class WarehouseEnventoryModel {
  int id;
  var date;
  var slug;
  var qty;
  var rate;
  BrandModel brand;

  WarehouseEnventoryModel(
      {this.id, this.date, this.slug, this.qty, this.rate, this.brand});

  WarehouseEnventoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    slug = json['slug'];
    qty = json['qty'];
    rate = json['rate'];
    brand =
        json['brand'] != null ? new BrandModel.fromJson(json['brand']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['slug'] = this.slug;
    data['qty'] = this.qty;
    data['rate'] = this.rate;
    if (this.brand != null) {
      data['brand'] = this.brand.toJson();
    }
    return data;
  }
}

BrandModel brandModelFromJson(String str) =>
    BrandModel.fromJson(json.decode(str));

String brandModelToJson(BrandModel data) => json.encode(data.toJson());

class BrandModel {
  int id;
  var name;

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
