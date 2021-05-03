import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:real_services/provider%20model/driver_provider.dart';

class ShowDriver extends StatefulWidget {
  @override
  _ShowDriverState createState() => _ShowDriverState();
}

class _ShowDriverState extends State<ShowDriver> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  Future<Null> refreshList() async {
    refreshKey.currentState?.show();
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      Provider.of<DriverProvider>(context, listen: false).driverlist.toString();
    });

    return null;
  }

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<DriverProvider>(context, listen: false).fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffbfb28f),
        title: Text("Drivers"),
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
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
                      width: MediaQuery.of(context).size.width * 0.3,
                      color: Color(0xffbfb28f),
                      child: Center(
                          child: Text("Driver Name",
                              style: TextStyle(fontWeight: FontWeight.bold))),
                    ),
                  ),
                  Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Container(
                      height: 40,
                      width: 70,
                      color: Color(0xffbfb28f),
                      child: Center(
                          child: Text("Vehicle Number",
                              style: TextStyle(fontWeight: FontWeight.bold))),
                    ),
                  ),
                  Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Container(
                      height: 40,
                      width: 70,
                      color: Color(0xffbfb28f),
                      child: Center(child: Text("Contact Number")),
                    ),
                  ),
                  Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.3,
                      color: Color(0xffbfb28f),
                      child: Center(
                          child: Text("Action",
                              style: TextStyle(fontWeight: FontWeight.bold))),
                    ),
                  ),
                ],
              ),
            ),
            // List view row
            Expanded(
                child: Consumer<DriverProvider>(
              builder: (context, drivermodel, _) => FutureBuilder(
                  future: drivermodel.fetchData(),
                  builder: (context, snapshot) {
                    return RefreshIndicator(
                      key: refreshKey,
                      child: ListView.builder(
                          itemCount: drivermodel.driverlist.length,
                          itemBuilder: (BuildContext context, int index) {
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black)),
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      color: Color(0xffbfb10),
                                      child: Center(
                                          child: Text(
                                              drivermodel.driverlist[index]
                                                      ['id']
                                                  .toString(),
                                              style: TextStyle(fontSize: 12))),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black)),
                                    child: Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      color: Color(0xffbfb10),
                                      child: Center(
                                          child: Text(
                                              drivermodel.driverlist[index]
                                                  ['name'],
                                              style: TextStyle(fontSize: 13))),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black)),
                                    child: Container(
                                        height: 40,
                                        width: 70,
                                        color: Color(0xffbfb10),
                                        child: Center(
                                            child: Text(
                                                drivermodel.driverlist[index]
                                                        ['vihical_no']
                                                    .toString(),
                                                style:
                                                    TextStyle(fontSize: 13)))),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black)),
                                    child: Container(
                                        height: 40,
                                        width: 70,
                                        color: Color(0xffbfb10),
                                        child: Center(
                                            child: Text(
                                                drivermodel.driverlist[index]
                                                        ['contact']
                                                    .toString(),
                                                style:
                                                    TextStyle(fontSize: 13)))),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black)),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      color: Color(0xffbfb10),
                                      child: Center(
                                          child: RaisedButton(
                                        onPressed: () {
                                          // // print(model.brandlist[index]['id']);
                                          drivermodel.delData(drivermodel
                                              .driverlist[index]['id']
                                              .toString());
                                          // print(model.brandlist[index]['id']
                                          //     .runtimeType);
                                        },
                                        child: Text("Delete"),
                                      )),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                      onRefresh: refreshList,
                    );
                  }),
            ))
          ],
        ),
      ),
    );
  }
}
