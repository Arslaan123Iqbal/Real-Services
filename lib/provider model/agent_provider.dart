import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

class AgentProvider extends ChangeNotifier {
  final httpClient = http.Client();
  List<dynamic> agentlist = [];

  Future fetchAgentData() async {
    final Uri customeruri =
        Uri.parse("https://apis.pythonanywhere.com/app/agent/");
    http.Response response = await httpClient.get(customeruri);
    final Map parsedData = await jsonDecode(response.body);
    agentlist = parsedData['data'];

    notifyListeners();
  }

  Future delData(String id) async {
    final Uri branduri =
        Uri.parse("https://apis.pythonanywhere.com/app/agent/$id/");
    http.Response response = await httpClient.delete(branduri);
    print(response.body);
    return response.body;
  }

  // Post data
  Future addAgentData(Map<String, dynamic> body) async {
    final Uri customeruri =
        Uri.parse("https://apis.pythonanywhere.com/app/agent/");
    http.Response response = await httpClient.post(customeruri, body: body);
    return response.body;
  }
}
