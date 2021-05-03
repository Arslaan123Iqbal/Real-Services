import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

class CustomerRecoveryProvider extends ChangeNotifier {
  final httpClient = http.Client();
  List<dynamic> customerslist = [];

  Future fetchCustomerRecoveryData() async {
    final Uri customeruri =
        Uri.parse("https://apis.pythonanywhere.com/app/customerRecovery/");
    http.Response response = await httpClient.get(customeruri);
    final Map parsedData = await jsonDecode(response.body);
    customerslist = parsedData['data'];
    notifyListeners();
  }

  // Post data
  Future addCustomerRecoveryData(Map<String, dynamic> body) async {
    final Uri customeruri =
        Uri.parse("https://apis.pythonanywhere.com/app/customerRecovery/");
    http.Response response = await httpClient.post(customeruri, body: body);
    return response.body;
  }
}
