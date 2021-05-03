import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

class DispatchProvider extends ChangeNotifier {
  final httpClient = http.Client();
  List<dynamic> orderPlacementDispatchList = [];

  Future fetchDataDisptch() async {
    final Uri branduri =
        Uri.parse("https://apis.pythonanywhere.com/app/orderPlacement/");
    http.Response response = await httpClient.get(branduri);
    final Map parsedData = await jsonDecode(response.body);
    orderPlacementDispatchList = parsedData['data'];
  }

  Future delData(String id) async {
    final Uri branduri =
        Uri.parse("https://apis.pythonanywhere.com/app/orderPlacement/$id/");
    http.Response response = await httpClient.delete(branduri);
    print(response.body);
    return response.body;
  }

  // Post data
  Future addDataDispath(Map<String, dynamic> body) async {
    final Uri branduri =
        Uri.parse("https://apis.pythonanywhere.com/app/orderPlacement/");
    http.Response response = await httpClient.post(branduri, body: body);
    return response.body;
  }

  Future getApidata(var id) async {
    final url =
        Uri.parse("http://apis.pythonanywhere.com/app/orderStatusupdate/$id");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      return json.decode(response.body);
    }
  }
}
