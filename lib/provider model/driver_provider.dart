import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DriverProvider with ChangeNotifier {
  final httpClient = http.Client();
  List<dynamic> driverlist = [];
//Getting Data
  Future fetchData() async {
    final Uri driveruri =
        Uri.parse('https://apis.pythonanywhere.com/app/driver/');
    http.Response response = await httpClient.get(driveruri);
    final Map parsedData = await jsonDecode(response.body);

    driverlist = (parsedData['data']);
    notifyListeners();
  }

  //Deleting Data
  Future delData(String id) async {
    final Uri branduri =
        Uri.parse("https://apis.pythonanywhere.com/app/driver/$id/");
    http.Response response = await httpClient.delete(branduri);
    print(response.body);
    return response.body;
  }

  //Posting Data
  Future addDriver(Map<String, dynamic> body) async {
    final Uri driveruri =
        Uri.parse("https://apis.pythonanywhere.com/app/driver/");
    http.Response response = await httpClient.post(driveruri, body: body);
    return response.body;
  }
}
