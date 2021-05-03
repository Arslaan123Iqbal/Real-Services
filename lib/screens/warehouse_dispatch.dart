import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'package:real_services/provider%20model/order_placement_provider.dart';
import 'package:real_services/provider%20model/add_company_provider.dart';
import 'package:real_services/provider%20model/brand_model_provider.dart';
import 'package:real_services/provider%20model/driver_provider.dart';
import 'package:real_services/provider%20model/warehouse_enventory_provider.dart';

import 'inventoryDispatch.dart';

class WarehouseDispatch extends StatefulWidget {
  @override
  _WarehouseDispatchState createState() => _WarehouseDispatchState();
}

class _WarehouseDispatchState extends State<WarehouseDispatch> {
  ScrollController scrollController = ScrollController();
  final httpClient = http.Client();
  Future deldataorderplacement(String id) async {
    final Uri branduri =
        Uri.parse("https://apis.pythonanywhere.com/app/orderPlacement/$id/");
    http.Response response = await httpClient.delete(branduri);
    print(response.body);
    return response.body;
  }

  var refreshKey = GlobalKey<RefreshIndicatorState>();
  Future<Null> refreshList() async {
    refreshKey.currentState?.show();
    await Future.delayed(Duration(milliseconds: 20));

    setState(() {
      Provider.of<DispatchProvider>(context, listen: false)
          .orderPlacementDispatchList
          .reversed;
    });

    return null;
  }

  bool isEnabled = false;

  enableButton() {
    setState(() {
      isEnabled = true;
    });
  }

  disableButton() {
    setState(() {
      isEnabled = false;
    });
  }

  showRecieved() {
    Text('Recieved');
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

  String mySelection;
  String companyslection;
  String driverSelection;
  // Text editig variables
  var formkey = GlobalKey<FormState>();
  // TextEditingController slugController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController frieghtController = TextEditingController();
  TextEditingController unloadingController = TextEditingController();
  TextEditingController orderstatuscontroller = TextEditingController();
  VoidCallback continueCallBack;

  @override
  void initState() {
    Provider.of<BrandProvider>(context, listen: false).fetchData();
    Provider.of<CompanyProvider>(context, listen: false).fetchData();
    Provider.of<DriverProvider>(context, listen: false).fetchData();
    refreshList();
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        Provider.of<DispatchProvider>(context, listen: false)
            .fetchDataDisptch();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffbfb28f),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              "Order Placement",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 30),
            // Row for Expense title
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Row(
                children: [
                  // Row element 1st
                  Text("Date:"),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .08,
                  ),
                  // input field
                  Container(
                    height: 25.0,
                    width: 150.0,
                    color: Colors.white,
                    child: Container(
                      child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: DateTime.now().toString())),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                  ),
                  Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Container(
                      height: 20,
                      width: 60,
                      color: Color(0xffffffff),
                      child: Center(child: Text("Press")),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),

            SizedBox(
              height: 10,
            ),
            //Brand name
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  // Row element 1st
                  Text("Brand:"),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .09,
                  ),
                  // input field
                  DropdownButton<dynamic>(
                    value: mySelection,
                    hint: Text('Click Here'),
                    items: Provider.of<BrandProvider>(context)
                        .brandlist
                        .map((item) {
                      return new DropdownMenuItem(
                          child: new Text(item["name"]),
                          value: item["id"].toString());
                    }).toList(),
                    onChanged: (newVal) {
                      setState(() {
                        mySelection = newVal;
                        print(mySelection);
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            //Company
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Row element 1st
                  Text("Company:"),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .09,
                  ),
                  // input field drop down menu
                  DropdownButton<dynamic>(
                    value: companyslection,
                    hint: Text('Click Here'),
                    items: Provider.of<CompanyProvider>(context)
                        .companyList
                        .map((item) {
                      return new DropdownMenuItem(
                          child: new Text(item["name"]),
                          value: item["id"].toString());
                    }).toList(),
                    onChanged: (newVal) {
                      setState(() {
                        companyslection = newVal;
                        print(companyslection);
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //Driver
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Driver drop menu
                  Text('driver'),
                  DropdownButton<dynamic>(
                    value: driverSelection,
                    hint: Text('Click Here'),
                    items: Provider.of<DriverProvider>(context)
                        .driverlist
                        .map((item) {
                      return new DropdownMenuItem(
                          child: new Text(item["name"]),
                          value: item["id"].toString());
                    }).toList(),
                    onChanged: (newVal) {
                      setState(() {
                        driverSelection = newVal;

                        print(driverSelection);
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //Quantity
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  // Row element 1st
                  Text("Qty:"),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .09,
                  ),
                  // input field
                  Container(
                    height: 25.0,
                    width: 150.0,
                    color: Colors.white,
                    child: Container(
                      child: TextField(
                          controller: quantityController,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "")),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //Rate
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  // Row element 1st
                  Text("Rate:"),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .09,
                  ),
                  // input field
                  Container(
                    height: 25.0,
                    width: 150.0,
                    color: Colors.white,
                    child: Container(
                      child: TextField(
                          controller: rateController,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "")),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),

            SizedBox(
              height: 10,
            ),
            //Driver
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  // Row element 1st
                  Text("Frieght"),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .09,
                  ),
                  // input field
                  Container(
                    height: 25.0,
                    width: 150.0,
                    color: Colors.white,
                    child: Container(
                      child: TextField(
                          controller: frieghtController,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "")),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //Driver
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  // Row element 1st
                  Text("Unloading:"),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .09,
                  ),

                  // input field
                  Container(
                    height: 25.0,
                    width: 150.0,
                    color: Colors.white,
                    child: Container(
                      child: TextField(
                          controller: unloadingController,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "")),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Destination
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Row(
                children: [
                  // Row element 1st
                  Text("Destination:"),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .04,
                  ),
                  // input field
                  Container(
                    height: 25.0,
                    width: 150.0,
                    color: Colors.white,
                    child: Container(
                      child: TextField(
                          controller: destinationController,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "")),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Row Expense date

            SizedBox(
              height: 10,
            ),
            // Row for opening balance

            // Button
            GestureDetector(
              onTap: () {
                Provider.of<DispatchProvider>(context, listen: false)
                    .addDataDispath({
                  'Destination': destinationController.text,
                  'qty': quantityController.text,
                  'rate': rateController.text,
                  'Frieght': frieghtController.text,
                  'unloading': unloadingController.text,
                  'Driver': driverSelection.toString(),
                  'brand': mySelection.toString(),
                  'company': companyslection.toString()
                });

                // slugController.clear();
                quantityController.clear();
                rateController.clear();
                orderstatuscontroller.clear();
                frieghtController.clear();
                unloadingController.clear();
                destinationController.clear();
              },
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Container(
                  height: 20,
                  width: 120,
                  color: Color(0xffffffff),
                  child: Center(child: Text("Order Placement")),
                ),
              ),
            ),
            //Back to HomePage
            Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: Container(
                    height: 20,
                    width: 60,
                    color: Color(0xffffffff),
                    child: Center(child: Text("Back")),
                  ),
                ),
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),

                // Title Row
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Container(
                          height: 40,
                          width: 40,
                          color: Color(0xffbfb28f),
                          child: Center(
                              child: Text("Sr No",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.2,
                          color: Color(0xffbfb28f),
                          child: Center(
                              child: Text("slug",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.2,
                          color: Color(0xffbfb28f),
                          child: Center(
                              child: Text("Destination",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.2,
                          color: Color(0xffbfb28f),
                          child: Center(
                              child: Text("Qty",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.2,
                          color: Color(0xffbfb28f),
                          child: Center(
                              child: Text("Rate",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.2,
                          color: Color(0xffbfb28f),
                          child: Center(
                              child: Text("Freight",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.2,
                          color: Color(0xffbfb28f),
                          child: Center(
                              child: Text("Unloading",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.2,
                          color: Color(0xffbfb28f),
                          child: Center(
                              child: Text("Brand",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.2,
                          color: Color(0xffbfb28f),
                          child: Center(
                              child: Text("Order Status",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.2,
                          color: Color(0xffbfb28f),
                          child: Center(
                              child: Text("Delete",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                        ),
                      ),
                    ],
                  ),
                ),
                // List view row

                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Consumer<DispatchProvider>(
                    builder: (context, modelcompany, _) => FutureBuilder(
                        future: modelcompany.fetchDataDisptch(),
                        builder: (context, snapshot) {
                          return RefreshIndicator(
                            key: refreshKey,
                            child: ListView.builder(
                                reverse: true,
                                addAutomaticKeepAlives: true,
                                addRepaintBoundaries: true,
                                shrinkWrap: true,
                                itemCount: modelcompany
                                    .orderPlacementDispatchList.reversed.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black)),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.1,
                                            width: 40,
                                            color: Color(0xffbfb10),
                                            child: Center(
                                                child: Text(modelcompany
                                                    .orderPlacementDispatchList[
                                                        index]["id"]
                                                    .toString())),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black)),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.1,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.2,
                                            color: Color(0xffbfb10),
                                            child: Center(
                                                child: Text(modelcompany
                                                        .orderPlacementDispatchList[
                                                    index]['slug'])),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black)),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.1,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.2,
                                            color: Color(0xffbfb10),
                                            child: Center(
                                                child: Text(modelcompany
                                                        .orderPlacementDispatchList[
                                                    index]['Destination'])),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black)),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.1,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.2,
                                            color: Color(0xffbfb10),
                                            child: Center(
                                                child: Text(modelcompany
                                                    .orderPlacementDispatchList[
                                                        index]['qty']
                                                    .toString())),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black)),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.1,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.2,
                                            color: Color(0xffbfb10),
                                            child: Center(
                                                child: Text(modelcompany
                                                    .orderPlacementDispatchList[
                                                        index]['rate']
                                                    .toString())),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black)),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.1,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.2,
                                            color: Color(0xffbfb10),
                                            child: Center(
                                                child: Text(modelcompany
                                                    .orderPlacementDispatchList[
                                                        index]['Frieght']
                                                    .toString())),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black)),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.1,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.2,
                                            color: Color(0xffbfb10),
                                            child: Center(
                                                child: Text(modelcompany
                                                    .orderPlacementDispatchList[
                                                        index]['unloading']
                                                    .toString())),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black)),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.1,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.2,
                                            color: Color(0xffbfb10),
                                            child: Center(
                                                child: Text(modelcompany
                                                    .orderPlacementDispatchList[
                                                        index]['brand']["name"]
                                                    .toString())),
                                          ),
                                        ),
                                        modelcompany.orderPlacementDispatchList[
                                                    index]['orderStatus'] ==
                                                "Received"
                                            ? RaisedButton(
                                                onPressed: () => {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          InventoryDispatch(
                                                        slug: modelcompany
                                                                .orderPlacementDispatchList[
                                                            index]["slug"],
                                                        vehicle: modelcompany
                                                                    .orderPlacementDispatchList[
                                                                index]["Driver"]
                                                            ["vihical_no"],
                                                      ),
                                                    ),
                                                  )
                                                },
                                                child: Text("Dispatch"),
                                              )
                                            : Text("Dispatch"),

                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black)),
                                          child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.1,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.2,
                                              color: Color(0xffbfb10),
                                              child: Center(
                                                  child: modelcompany.orderPlacementDispatchList[
                                                                  index]
                                                              ["orderStatus"] ==
                                                          "Pending"
                                                      ? Row(
                                                          children: [
                                                            RaisedButton(
                                                              child: Text(
                                                                  'Recieved'),
                                                              textColor:
                                                                  Colors.white,
                                                              elevation: 7.0,
                                                              color:
                                                                  Colors.blue,
                                                              onPressed: () {
                                                                setState(() {
                                                                  this.getApidata(modelcompany
                                                                      .orderPlacementDispatchList[
                                                                          index]
                                                                          ['id']
                                                                      .toString());
                                                                });
                                                              },
                                                            ),
                                                          ],
                                                        )
                                                      : null)),
                                        ),
                                        //Delete Button
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black)),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.1,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            color: Color(0xffbfb10),
                                            child: Center(
                                                child: Row(
                                              children: [
                                                RaisedButton(
                                                  child: Text('Delete'),
                                                  textColor: Colors.white,
                                                  elevation: 7.0,
                                                  color: Colors.blue,
                                                  onPressed: () {
                                                    setState(() {
                                                      this.deldataorderplacement(
                                                          modelcompany
                                                              .orderPlacementDispatchList[
                                                                  index]['id']
                                                              .toString());
                                                      AlertDialog alert =
                                                          AlertDialog(
                                                        title: Text(
                                                            "it is going to be recieved"),
                                                        actions: [
                                                          new FlatButton(
                                                            child: new Text(
                                                                "Continue"),
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                          ),
                                                        ],
                                                      );
                                                      showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return alert;
                                                          });
                                                    });
                                                  },
                                                ),
                                              ],
                                            )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                            onRefresh: refreshList,
                          );
                        }),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
