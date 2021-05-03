import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

class InventoryDispatchProvider extends ChangeNotifier {
  final httpClient = http.Client();
  List<dynamic> dispatchInventorylist = [];
  bool error;
  String message;
  Future fetchDataDisptch() async {
    final Uri branduri =
        Uri.parse("https://apis.pythonanywhere.com/app/dispatchEnventory/");
    http.Response response = await httpClient.get(branduri);
    final Map parsedData = await jsonDecode(response.body);
    dispatchInventorylist = (parsedData['data']);
    notifyListeners();
  }

  // Future errorDataDisptch() async {
  //   final Uri branduri =
  //       Uri.parse("https://apis.pythonanywhere.com/app/dispatchEnventory/");
  //   http.Response response = await httpClient.get(branduri);
  //   final Map parsedData = await jsonDecode(response.body);
  //   var error = parsedData['error'];
  //   error = error;
  //   print(error.toString());
  //   return error;
  // }

  Future errorDataDispatch() async {
    final url =
        Uri.parse("https://apis.pythonanywhere.com/app/dispatchEnventory/");
    final response = await http.get(url);
    var parsedJson = json.decode(response.body);
    var error = parsedJson["error"];
    var message = parsedJson["message"];

    // If server returns an OK response, parse the JSON.
    error = error;
    message = message;
    print(error);
    print(message);
    notifyListeners();
  }

  // Future messageDataDisptch() async {
  //   final Uri branduri =
  //       Uri.parse("https://apis.pythonanywhere.com/app/dispatchEnventory/");
  //   http.Response response = await httpClient.get(branduri);
  //   final Map parsedData = await jsonDecode(response.body);
  //   var message = parsedData['message'];
  //   print(message.toString());
  //   message = message;
  //   return message;
  // }

  // Post data
  Future addDataDispath(Map<String, dynamic> body) async {
    final Uri branduri =
        Uri.parse("https://apis.pythonanywhere.com/app/dispatchEnventory/");
    http.Response response = await httpClient.post(branduri, body: body);
    return response.body;
  }
}
