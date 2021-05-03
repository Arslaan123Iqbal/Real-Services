import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SearchApi with ChangeNotifier {
  final httpClient = http.Client();
  List<dynamic> searchDispatchInventory = [];
//Getting Data
  Future fetchsearchData(String query) async {
    final Uri driveruri =
        Uri.parse('https://apis.pythonanywhere.com/app/dispatchEnventory/');
    http.Response response = await httpClient.get(driveruri);
    final Map parsedData = await jsonDecode(response.body);
    searchDispatchInventory = parsedData['data'];
    print(searchDispatchInventory);
    searchDispatchInventory.where((dispatch) {
      final titleLower = dispatch["customer"]['name'].toLowerCase().toString();
      final authorLower = dispatch["id"].toLowerCase().toString();
      final searchLower = query.toLowerCase();
      return titleLower.contains(searchLower) ||
          authorLower.contains(searchLower);
    }).toList();
  }
}
