import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:real_services/provider%20model/warehouse_enventory_provider.dart';

class ShowWarehouse extends StatefulWidget {
  @override
  _ShowWarehouseState createState() => _ShowWarehouseState();
}

class _ShowWarehouseState extends State<ShowWarehouse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffbfb28f),
        title: Text("Warehouse"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp),
          onPressed: () {},
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
                          child: Text("Brand",
                              style: TextStyle(fontWeight: FontWeight.bold))),
                    ),
                  ),
                ],
              ),
            ),
            // List view row
            Expanded(
                child: Consumer<WareHouseEnventoryProvider>(
              builder: (context, modelcustomer, _) => FutureBuilder(
                  future: modelcustomer.fetchData(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                        itemCount: modelcustomer.warehouselist.length,
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
                                            .warehouselist[index]["id"]
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
                                            .warehouselist[index]['slug'])),
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
                                            .warehouselist[index]['qty']
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
                                            .warehouselist[index]['rate']
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
                                            .warehouselist[index]['brand']
                                                ['name']
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
}
