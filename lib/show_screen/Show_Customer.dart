import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:real_services/provider%20model/customer_provider.dart';
import 'package:real_services/update_screens/updateCustomer.dart';

class ShowCustomer extends StatefulWidget {
  @override
  _ShowCustomerState createState() => _ShowCustomerState();
}

class _ShowCustomerState extends State<ShowCustomer> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<CustomerProvider>(context, listen: false).fetchCustomerData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffbfb28f),
        title: Text("Customer"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        //main column
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),

            // Title Row
            Row(
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
                        child: Text("Customer Name",
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
                        child: Text("Contact",
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
                        child: Text("Opening Balance",
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
                        child: Text("Date",
                            style: TextStyle(fontWeight: FontWeight.bold))),
                  ),
                ),
              ],
            ),
            // List view row
            Expanded(
                child: Consumer<CustomerProvider>(
              builder: (context, modelcustomer, _) => FutureBuilder(
                  future: modelcustomer.fetchCustomerData(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                        itemCount: modelcustomer.customerlist.length,
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
                                            .customerlist[index]["id"]
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
                                            .customerlist[index]['name'])),
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
                                            .customerlist[index]['contact']
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
                                            .customerlist[index]
                                                ['opening_Balance']
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
                                            .customerlist[index]['date']
                                            .toString())),
                                  ),
                                ),
                                RaisedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            updateCustomerWidget(
                                          context,
                                          modelcustomer.customerlist[index]
                                              ["id"],
                                          modelcustomer.customerlist[index]
                                                  ["name"]
                                              .toString(),
                                          modelcustomer.customerlist[index]
                                                  ["contact"]
                                              .toString(),
                                          modelcustomer.customerlist[index]
                                                  ["opening_Balance"]
                                              .toString(),
                                        ),
                                      ),
                                    );
                                    // // print(model.brandlist[index]['id']);
                                    // updateBrandwidget(context,
                                    //     model.brandlist[index]["id"]);
                                    // print(model.brandlist[index]['id']
                                    //     .runtimeType);
                                  },
                                  child: Text("Update"),
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
}
