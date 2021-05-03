import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

class CustomerProvider extends ChangeNotifier {
  final httpClient = http.Client();
  List<dynamic> customerlist = [];

  Future fetchCustomerData() async {
    final Uri customeruri =
        Uri.parse("https://apis.pythonanywhere.com/app/customer/");
    http.Response response = await httpClient.get(customeruri);
    final Map parsedData = await jsonDecode(response.body);
    customerlist = parsedData['data'];
    notifyListeners();
  }

  // update data
  Future updatedata(Map<String, dynamic> body, var id) async {
    final Uri branduri =
        Uri.parse("https://apis.pythonanywhere.com/app/customer/$id/");
    http.Response response = await httpClient.put(branduri, body: body);
    print(response.body);
    return response.body;
  }

  // Post data
  Future addCustomerData(Map<String, dynamic> body) async {
    final Uri customeruri =
        Uri.parse("https://apis.pythonanywhere.com/app/customer/");
    http.Response response = await httpClient.post(customeruri, body: body);
    return response.body;
  }
}
