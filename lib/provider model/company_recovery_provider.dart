import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class CompanyRecoveryProvider with ChangeNotifier {
  final httpClient = http.Client();
  List<dynamic> brandlist = [];

  Future fetchData() async {
    final Uri branduri =
        Uri.parse("https://apis.pythonanywhere.com/app/companyRecovery/");
    http.Response response = await httpClient.get(branduri);
    final Map parsedData = await jsonDecode(response.body);
    brandlist = parsedData['data'];
    notifyListeners();
  }

  Future addCompanyRecoveryData(Map<String, dynamic> body) async {
    final Uri customeruri =
        Uri.parse("https://apis.pythonanywhere.com/app/companyRecovery/");
    http.Response response = await httpClient.post(customeruri, body: body);
    return response.body;
  }
}
