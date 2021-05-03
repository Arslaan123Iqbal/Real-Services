import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:real_services/provider%20model/customer_provider.dart';
import 'package:real_services/provider%20model/dispatch_enventory_provider.dart';
import 'package:real_services/provider%20model/warehouse_enventory_provider.dart';

// import '../../models/dispatch_model.dart';

class InventoryDispatch extends StatefulWidget {
  String vehicle;
  String slug;
  InventoryDispatch({this.slug, this.vehicle});

  @override
  _InventoryDispatchState createState() =>
      _InventoryDispatchState(vehicle, slug);
}

class _InventoryDispatchState extends State<InventoryDispatch> {
  String vehicle;
  String slug;
  _InventoryDispatchState(this.vehicle, this.slug);

  dynamic customerselection;
  dynamic slugselection;
  String slugfieldata;
  var error;
  var message;
  var qtyData;

  var formkey = GlobalKey<FormState>();
  var bittyController = TextEditingController();
  var destinationController = TextEditingController();
  var quantityController = TextEditingController();
  var rateController = TextEditingController();
  var frieghtController = TextEditingController();
  var unloadingController = TextEditingController();
  var customecontroller = TextEditingController();
  var vehiclecontroller = TextEditingController();
  var destinationcontroller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<WareHouseEnventoryProvider>(context, listen: false).fetchData();
    Provider.of<CustomerProvider>(context, listen: false).fetchCustomerData();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      Provider.of<WareHouseEnventoryProvider>(context).fetchWarehouseData(slug);
      Provider.of<WareHouseEnventoryProvider>(context).quantityData(slug);
      var qty = Provider.of<WareHouseEnventoryProvider>(context).qtyData;
      var data =
          Provider.of<WareHouseEnventoryProvider>(context).brand.toString();
      slugfieldata = data;
      qtyData = qty;
    });

    return Scaffold(
      backgroundColor: Color(0xffbfb28f),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "Inventory Dispatch",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
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
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    // Row element 1st
                    Text("Slug :"),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .09,
                    ),
                    // input field
                    Container(
                      height: 25.0,
                      width: 150.0,
                      color: Colors.white,
                      child: Container(
                        child: Text(slug),
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
              //Quantity
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
                    Text(Provider.of<WareHouseEnventoryProvider>(context)
                        .brand
                        .toString()),
                  ],
                ),
              ),
              // Text(slugselection),

              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    // Row element 1st
                    Text("Customer:"),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .09,
                    ),
                    // input field
                    DropdownButton<dynamic>(
                      value: customerselection,
                      items: Provider.of<CustomerProvider>(context)
                          .customerlist
                          .map((item) {
                        return new DropdownMenuItem(
                            child: new Text("${item["name"]}"),
                            value: item["id"]);
                      }).toList(),
                      onChanged: (newVal) {
                        setState(() {
                          customerselection = newVal;
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
                    Text("Vehicle:"),
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
                            controller: vehiclecontroller,
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: vehicle)),
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
                    Text("Fright"),
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
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    // Row element 1st
                    Text("Destination:"),
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
                  if (qtyData > 0 &&
                      int.parse(quantityController.text) <= qtyData) {
                    Provider.of<InventoryDispatchProvider>(context,
                            listen: false)
                        .addDataDispath({
                      "slug": slug.toString(),
                      "qty": quantityController.text,
                      "rate": rateController.text,
                      "destination": destinationController.text,
                      "frieght": frieghtController.text,
                      "unloading": unloadingController.text,
                      "vehical": vehiclecontroller.text.isNotEmpty
                          ? vehiclecontroller.text
                          : vehicle.toString(),
                      "customer": customerselection.toString(),
                      "brand": Provider.of<WareHouseEnventoryProvider>(context,
                              listen: false)
                          .brand_id
                          .toString(),
                    });
                    destinationController.clear();
                    quantityController.clear();
                    rateController.clear();
                    frieghtController.clear();
                    unloadingController.clear();
                  } else {
                    AlertDialog alert = AlertDialog(
                      title: Text(
                          "Availabel qty in warehouse is ${qtyData.toString()}"),
                      actions: [
                        new FlatButton(
                          child: new Text("Continue"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        });
                  }

                  {}
                },
                child: Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Container(
                    height: 20,
                    width: 120,
                    color: Color(0xffffffff),
                    child: Center(child: Text("Dispatch")),
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
            ],
          ),
        ),
      ),
    );
  }
}
