import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:real_services/provider%20model/add_company_provider.dart';
import 'package:real_services/provider%20model/driver_provider.dart';

class AddDriverPage extends StatefulWidget {
  @override
  _AddDriverPageState createState() => _AddDriverPageState();
}

class _AddDriverPageState extends State<AddDriverPage> {
  bool isEnabled = false;

  var nameController = TextEditingController();
  var vehicleController = TextEditingController();
  var contactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      // Place for appBar
      appBar: AppBar(
        backgroundColor: Color(0xff575881),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              // For home Tile
              Container(
                decoration: BoxDecoration(
                    color: Color(0xffF4F4F7),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: ListTile(
                  leading: Image.asset(
                    "assets/home.png",
                    height: 20,
                  ),
                  title: Text("Home"),
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              // Title for warehouse
              ListTile(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => WarehouseDispatch()),
                  // );
                },
                title: Text("WAREHOUSE DISPATCH"),
                leading: Image.asset(
                  "assets/warehouse.png",
                  height: 20,
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              // Title for Add Company
              ListTile(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => WarehouseDispatch()),
                  // );
                },
                title: Text("ADD COMPANY"),
                leading: Image.asset(
                  "assets/company.png",
                  height: 20,
                ),
              ),
              // Title for warehouse
              ListTile(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => WarehouseDispatch()),
                  // );
                },
                title: Text("ADD BRAND"),
                leading: Image.asset(
                  "assets/brand.png",
                  height: 20,
                ),
              ),
              // Title for warehouse
              ListTile(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => WarehouseDispatch()),
                  // );
                },
                title: Text("ADD DRIVER"),
                leading: Image.asset(
                  "assets/driver.png",
                  height: 20,
                ),
              ),
              // Title for warehouse
              ListTile(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => WarehouseDispatch()),
                  // );
                },
                title: Text("ADD AGENT"),
                leading: Image.asset(
                  "assets/agent.png",
                  height: 20,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container for title
          Container(
            color: Colors.white,
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: Center(
                child: Text(
              "Add Driver",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            )),
          ),
          SizedBox(
            height: 20,
          ),
          // Fields starts here
          Padding(
            padding: const EdgeInsets.only(left: 90),
            child: Text(
              "Add Driver",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),

          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 90),
            child: Text(
              "Driver Name",
              style: TextStyle(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 90, right: 190),
              child: Container(
                  color: Colors.white,
                  child: TextField(
                    controller: nameController,
                  ))),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 90),
            child: Text(
              "Vehicle Number",
              style: TextStyle(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 90, right: 190),
              child: Container(
                  color: Colors.white,
                  child: TextField(
                    controller: vehicleController,
                  ))),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 90),
            child: Text(
              "Phone Number",
              style: TextStyle(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 90, right: 190),
              child: Container(
                  color: Colors.white,
                  child: TextField(
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff575881)))),
                    controller: contactController,
                    keyboardType: TextInputType.number,
                  ))),
          SizedBox(
            height: 10,
          ),
          //Buttons
          Padding(
            padding: const EdgeInsets.only(right: 190),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonTheme(
                  minWidth: 120,
                  height: 40,
                  child: RaisedButton(
                    color: Color(0xff575881),
                    onPressed: () {
                      nameController.clear();
                      contactController.clear();
                      vehicleController.clear();
                    },
                    child: Text(
                      "Clear",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                ButtonTheme(
                  minWidth: 120,
                  height: 40,
                  child: RaisedButton(
                    color: Color(0xff575881),
                    onPressed: () {
                      if (nameController.text.isNotEmpty &&
                          vehicleController.text.isNotEmpty &&
                          contactController.text.isNotEmpty) {
                        Provider.of<DriverProvider>(context, listen: false)
                            .addDriver({
                          "name": nameController.text,
                          "vihical_no": vehicleController.text,
                          "contact": contactController.text
                        });
                        nameController.clear();
                        vehicleController.clear();
                        contactController.clear();
                      } else {
                        AlertDialog alertmsg = AlertDialog(
                          title: Text("Please fill all the fields"),
                          actions: [
                            new FlatButton(
                              child: new Text("OK"),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alertmsg;
                            });
                      }
                    },
                    child: Text(
                      "Add",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // Lists

          Padding(
            padding: const EdgeInsets.only(left: 70),
            child: Text(
              "Drivers",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              child: Expanded(
                  child: Consumer<DriverProvider>(
            builder: (context, modelcompany, _) => FutureBuilder(
                future: modelcompany.fetchData(),
                builder: (context, snapshot) {
                  return ListView.builder(
                      addAutomaticKeepAlives: true,
                      addRepaintBoundaries: true,
                      reverse: true,
                      itemCount: modelcompany.driverlist.length,
                      itemBuilder: (BuildContext context, int index) {
                        var nameUpdatecontroller = TextEditingController();
                        var conatctUpdatecontroller = TextEditingController();
                        var vehiclenumberUpdatecontroller =
                            TextEditingController();
                        return Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Driver Name"),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      isEnabled == false
                                          ? Container(
                                              color: Colors.white,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.19,
                                              child: Center(
                                                  child: Text(modelcompany
                                                      .driverlist[index]["name"]
                                                      .toString())),
                                            )
                                          : Container(
                                              color: Colors.white,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.19,
                                              child: TextField()),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Vehicle No:"),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      isEnabled == false
                                          ? Container(
                                              color: Colors.white,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.19,
                                              child: Center(
                                                  child: Text(modelcompany
                                                      .driverlist[index]
                                                          ['vihical_no']
                                                      .toString())),
                                            )
                                          : Container(
                                              color: Colors.white,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.19,
                                              child: TextField()),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Contact"),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      isEnabled == false
                                          ? Container(
                                              color: Colors.white,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.19,
                                              child: Center(
                                                  child: Text(modelcompany
                                                      .driverlist[index]
                                                          ['contact']
                                                      .toString())),
                                            )
                                          : Container(
                                              color: Colors.white,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.19,
                                              child: TextField()),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  isEnabled == false
                                      ? GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isEnabled = true;
                                              // ignore: unnecessary_statements
                                              modelcompany.driverlist[index]
                                                  ["id"];
                                            });
                                          },
                                          child: Image.asset(
                                            "assets/edit.png",
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.03,
                                          ),
                                        )
                                      : GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isEnabled = false;
                                            });
                                          },
                                          child: Image.asset(
                                            "assets/save.png",
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.03,
                                          ),
                                        ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        AlertDialog alert = AlertDialog(
                                          title: Text("Are you sure?"),
                                          actions: [
                                            new FlatButton(
                                              child: new Text("Delete"),
                                              onPressed: () {
                                                modelcompany.delData(
                                                    modelcompany
                                                        .driverlist[index]['id']
                                                        .toString());
                                                Navigator.pop(context);
                                              },
                                            ),
                                            new FlatButton(
                                              child: new Text("Cancel"),
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
                                      });
                                    },
                                    child: Image.asset(
                                      "assets/delete.png",
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                      width: MediaQuery.of(context).size.width *
                                          0.03,
                                    ),
                                  ),
                                  // buttons
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Divider(
                                color: Colors.white,
                              ),
                            ],
                          ),
                        );
                      });
                }),
          ))),
        ],
      ),
    );
  }
}
