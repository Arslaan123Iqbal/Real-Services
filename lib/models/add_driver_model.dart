import 'dart:convert';

DriverDataModel driverdatamodelModelFromJson(String str) =>
    DriverDataModel.fromJson(json.decode(str));

String driverdatamodelModelToJson(DriverDataModel data) =>
    json.encode(data.toJson());

class DriverDataModel {
  int id;
  String name;
  String vihicalNo;
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
