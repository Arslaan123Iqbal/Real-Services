import 'dart:convert';

CompanyRecoverModel companyRecoverModelFromJson(String str) =>
    CompanyRecoverModel.fromJson(json.decode(str));

String companyRecoverModelToJson(CompanyRecoverModel data) =>
    json.encode(data.toJson());

class CompanyRecoverModel {
  int id;
  var amountPaid;
  var agentOpening;
  String date;
  Company company;
  Agent agent;

  CompanyRecoverModel(
      {this.id,
      this.amountPaid,
      this.agentOpening,
      this.date,
      this.company,
      this.agent});

  CompanyRecoverModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amountPaid = json['amount_paid'];
    agentOpening = json['agent_opening'];
    date = json['date'];
    company =
        json['company'] != null ? new Company.fromJson(json['company']) : null;
    agent = json['agent'] != null ? new Agent.fromJson(json['agent']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['amount_paid'] = this.amountPaid;
    data['agent_opening'] = this.agentOpening;
    data['date'] = this.date;
    if (this.company != null) {
      data['company'] = this.company.toJson();
    }
    if (this.agent != null) {
      data['agent'] = this.agent.toJson();
    }
    return data;
  }
}

class Company {
  int id;
  var name;
  var contact;
  var openingBalance;
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

class Agent {
  int id;
  var name;
  var openingBalance;
  String date;

  Agent({this.id, this.name, this.openingBalance, this.date});

  Agent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    openingBalance = json['opening_balance'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['opening_balance'] = this.openingBalance;
    data['date'] = this.date;
    return data;
  }
}
