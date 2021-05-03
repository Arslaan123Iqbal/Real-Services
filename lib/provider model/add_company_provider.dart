import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:real_services/models/add_company_model.dart';

class CompanyProvider with ChangeNotifier {
  final httpClient = http.Client();
  List<dynamic> companyList = [];

  Future fetchData() async {
    final Uri companyduri =
        Uri.parse("https://apis.pythonanywhere.com/app/company/");
    http.Response response = await httpClient.get(companyduri);
    final Map parsedData = await jsonDecode(response.body);
    companyList = parsedData['data'];
    companyList.add(false);
    return companyList;
  }

  Future delData(String id) async {
    final Uri branduri =
        Uri.parse("https://apis.pythonanywhere.com/app/company/$id/");
    http.Response response = await httpClient.delete(branduri);
    print(response.body);
    return response.body;
  }

  //updata data
  Future updatedata(Map<String, dynamic> body, var id) async {
    final Uri branduri =
        Uri.parse("https://apis.pythonanywhere.com/app/company/$id/");
    http.Response response = await httpClient.put(branduri, body: body);
    print(response.body);
    return response.body;
  }

  // Post data
  Future addData(Map<String, dynamic> body) async {
    final Uri companyuri =
        Uri.parse("https://apis.pythonanywhere.com/app/company/");
    http.Response response = await httpClient.post(companyuri, body: body);
    return response.body;
  }
}
