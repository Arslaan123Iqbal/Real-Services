import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:real_services/provider%20model/dispatch_enventory_provider.dart';
import 'package:real_services/provider%20model/warehouse_enventory_provider.dart';

class CheckPage extends StatefulWidget {
  @override
  _CheckPageState createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  var error;
  var check;
  var message;
  var slug;

  Future fetchWarehouseData() async {
    final url =
        Uri.parse("https://apis.pythonanywhere.com/app/dispatchEnventory/");
    final response = await http.get(url);
    var parsedJson = json.decode(response.body);

    var error = parsedJson["data"];
    var e = parsedJson["error"];

    var message = parsedJson["message"];

    print(message);
    print(e);
    setState(() {
      error = error;
      e = check;
      message = message;
      slug = slug.toString();
    });

    return error;
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    Provider.of<InventoryDispatchProvider>(context, listen: false)
        .errorDataDispatch();
    fetchWarehouseData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(Provider.of<InventoryDispatchProvider>(context)
              .message
              .toString()),
          Text(""),
        ],
      ),
    );
  }
}
