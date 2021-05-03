import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class BrandProvider extends ChangeNotifier {
  final httpClient = http.Client();
  List brandlist = [];

  Future fetchData() async {
    final Uri branduri =
        Uri.parse("https://apis.pythonanywhere.com/app/brand/");
    http.Response response = await httpClient.get(branduri);
    final Map parsedData = await jsonDecode(response.body);
    brandlist = parsedData['data'];
    notifyListeners();
  }
  //Delete Data

  Future delData(String id) async {
    final Uri branduri =
        Uri.parse("https://apis.pythonanywhere.com/app/brand/$id/");
    http.Response response = await httpClient.delete(branduri);
    print(response.body);
    return response.body;
  }

  // update data
  Future updatedata(Map<String, dynamic> body, var id) async {
    final Uri branduri =
        Uri.parse("https://apis.pythonanywhere.com/app/brand/$id/");
    http.Response response = await httpClient.put(branduri, body: body);
    print(response.body);
    return response.body;
  }

  // Post data
  Future addData(Map<String, dynamic> body) async {
    final Uri branduri =
        Uri.parse("https://apis.pythonanywhere.com/app/brand/");
    http.Response response = await httpClient.post(branduri, body: body);
    return response.body;
  }
}
