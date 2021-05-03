import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class WareHouseEnventoryProvider with ChangeNotifier {
  var brand;
  var brand_id;
  var qtyData;
  final httpClient = http.Client();
  var warehouselist = [];
  var warehouse = [];
  Future fetchData() async {
    final Uri customeruri =
        Uri.parse("https://apis.pythonanywhere.com/app/wareHouse/");
    http.Response response = await httpClient.get(customeruri);
    print("Respoinse${response.toString()}");
    final Map parsedData = await jsonDecode(response.body);
    // print("parsing the data  $parsedData");
    print(parsedData.runtimeType);
    warehouselist = parsedData['data'] as List;
    notifyListeners();
  }

  Future fetchWarehouseData(String slug) async {
    final url =
        Uri.parse("https://apis.pythonanywhere.com/app/getwareHouse/$slug");
    final response = await http.get(url);
    var parsedJson = json.decode(response.body);
    var name = parsedJson["data"]["brand"]["name"];
    var id = parsedJson["data"]["brand"]["id"];

    // If server returns an OK response, parse the JSON.
    brand = name;
    brand_id = id;

    notifyListeners();
  }

  Future quantityData(String slug) async {
    final url =
        Uri.parse("https://apis.pythonanywhere.com/app/getwareHouse/$slug");
    final response = await http.get(url);
    var parsedJson = json.decode(response.body);
    var qty = parsedJson["data"]["qty"];

    // If server returns an OK response, parse the JSON.
    qtyData = qty;
    // print(qty);
    notifyListeners();
  }

//https://apis.pythonanywhere.com/app/getwareHouse/slug
  // Post data
  Future addData(Map<String, dynamic> body) async {
    final Uri customeruri =
        Uri.parse("https://apis.pythonanywhere.com/app/wareHouse/");
    http.Response response = await httpClient.post(customeruri, body: body);

    return response.body;
  }
}
