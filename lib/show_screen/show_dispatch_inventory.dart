import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:real_services/provider%20model/dispatch_enventory_provider.dart';
import 'package:real_services/provider%20model/search_provider.dart';
import 'package:real_services/widget/search_widget.dart';

class ShowDispatchInventory extends StatefulWidget {
  @override
  _ShowDispatchInventoryState createState() => _ShowDispatchInventoryState();
}

class _ShowDispatchInventoryState extends State<ShowDispatchInventory> {
  List<dynamic> books = [];
  String query = '';
  Timer debouncer;

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final books = await Provider.of<SearchApi>(context, listen: false)
        .fetchsearchData(query);

    setState(() => this.books = books);
  }

  List<dynamic> customer = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffbfb28f),
        title: Text("Dispatch inventory"),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_sharp), onPressed: () {}),
      ),
      body: Container(
        //main column
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildSearch(),
            Container(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search by Customer",
                ),
                onChanged: (text) {
                  text = text.toLowerCase();
                  setState(() {
                    customer = customer.where((customer) {
                      var customername = customer["id"].toString();
                      return customername.contains(text);
                    });
                  });
                },
              ),
            ),
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
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Container(
                      height: 40,
                      width: 40,
                      color: Color(0xffbfb28f),
                      child: Center(
                          child: Text("Sr No",
                              style: TextStyle(fontWeight: FontWeight.bold))),
                    ),
                  ),
                  Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.2,
                      color: Color(0xffbfb28f),
                      child: Center(
                          child: Text("Slug",
                              style: TextStyle(fontWeight: FontWeight.bold))),
                    ),
                  ),
                  Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.2,
                      color: Color(0xffbfb28f),
                      child: Center(
                          child: Text("Qty",
                              style: TextStyle(fontWeight: FontWeight.bold))),
                    ),
                  ),
                  Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.2,
                      color: Color(0xffbfb28f),
                      child: Center(
                          child: Text("Rate",
                              style: TextStyle(fontWeight: FontWeight.bold))),
                    ),
                  ),
                  Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.2,
                      color: Color(0xffbfb28f),
                      child: Center(
                          child: Text("Destination",
                              style: TextStyle(fontWeight: FontWeight.bold))),
                    ),
                  ),
                  Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.2,
                      color: Color(0xffbfb28f),
                      child: Center(
                          child: Text("Freight",
                              style: TextStyle(fontWeight: FontWeight.bold))),
                    ),
                  ),
                  Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.2,
                      color: Color(0xffbfb28f),
                      child: Center(
                          child: Text("Unloading",
                              style: TextStyle(fontWeight: FontWeight.bold))),
                    ),
                  ),
                  Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.2,
                      color: Color(0xffbfb28f),
                      child: Center(
                          child: Text("Vehicle",
                              style: TextStyle(fontWeight: FontWeight.bold))),
                    ),
                  ),
                  Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.2,
                      color: Color(0xffbfb28f),
                      child: Center(
                          child: Text("Total Amount",
                              style: TextStyle(fontWeight: FontWeight.bold))),
                    ),
                  ),
                  Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.2,
                      color: Color(0xffbfb28f),
                      child: Center(
                          child: Text("Customer",
                              style: TextStyle(fontWeight: FontWeight.bold))),
                    ),
                  ),
                  Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.2,
                      color: Color(0xffbfb28f),
                      child: Center(
                          child: Text("Brand",
                              style: TextStyle(fontWeight: FontWeight.bold))),
                    ),
                  ),
                ],
              ),
            ),
            // List view row
            Expanded(
                child: Consumer<InventoryDispatchProvider>(
              builder: (context, modelcustomer, _) => FutureBuilder(
                  future: modelcustomer.fetchDataDisptch(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                        itemCount: modelcustomer.dispatchInventorylist.length,
                        itemBuilder: (BuildContext context, int index) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    width: 40,
                                    color: Color(0xffbfb10),
                                    child: Center(
                                        child: Text(modelcustomer
                                            .dispatchInventorylist[index]["id"]
                                            .toString())),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    color: Color(0xffbfb10),
                                    child: Center(
                                        child: Text(modelcustomer
                                                .dispatchInventorylist[index]
                                            ['slug'])),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    color: Color(0xffbfb10),
                                    child: Center(
                                        child: Text(modelcustomer
                                            .dispatchInventorylist[index]['qty']
                                            .toString())),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    color: Color(0xffbfb10),
                                    child: Center(
                                        child: Text(modelcustomer
                                            .dispatchInventorylist[index]
                                                ['rate']
                                            .toString())),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    color: Color(0xffbfb10),
                                    child: Center(
                                        child: Text(modelcustomer
                                            .dispatchInventorylist[index]
                                                ['destination']
                                            .toString())),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    color: Color(0xffbfb10),
                                    child: Center(
                                        child: Text(modelcustomer
                                            .dispatchInventorylist[index]
                                                ['frieght']
                                            .toString())),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    color: Color(0xffbfb10),
                                    child: Center(
                                        child: Text(modelcustomer
                                            .dispatchInventorylist[index]
                                                ['unloading']
                                            .toString())),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    color: Color(0xffbfb10),
                                    child: Center(
                                        child: Text(modelcustomer
                                            .dispatchInventorylist[index]
                                                ['vehical']
                                            .toString())),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    color: Color(0xffbfb10),
                                    child: Center(
                                        child: Text(modelcustomer
                                            .dispatchInventorylist[index]
                                                ['totalAmount']
                                            .toString())),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    color: Color(0xffbfb10),
                                    child: Center(
                                        child: Text(modelcustomer
                                            .dispatchInventorylist[index]
                                                ['customer']['name']
                                            .toString())),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    color: Color(0xffbfb10),
                                    child: Center(
                                        child: Text(modelcustomer
                                            .dispatchInventorylist[index]
                                                ['brand']['name']
                                            .toString())),
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  }),
            ))
          ],
        ),
      ),
    );
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Title or Author Name',
        onChanged: searchBook,
      );

  Future searchBook(String query) async => debounce(() async {
        final books = await Provider.of<SearchApi>(context, listen: false)
            .fetchsearchData(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.books = books;
        });
      });
}
