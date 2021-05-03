import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:real_services/Pages/Screens/add_agent_page.dart';
import 'package:real_services/Pages/Screens/add_brand_page.dart';
import 'package:real_services/Pages/Screens/add_company_page.dart';
import 'package:real_services/Pages/Screens/add_driver_page.dart';

import 'package:real_services/provider%20model/add_company_provider.dart';
import 'package:real_services/provider%20model/brand_model_provider.dart';
import 'package:real_services/provider%20model/driver_provider.dart';
import 'package:real_services/provider%20model/order_placement_provider.dart';

class WareHouseDispatchPage extends StatefulWidget {
  @override
  _WareHouseDispatchPageState createState() => _WareHouseDispatchPageState();
}

class _WareHouseDispatchPageState extends State<WareHouseDispatchPage> {
  bool isEnabled = false;
  var brandSelection;
  var companySelection;
  var vehicleSelection;

  TextEditingController destinationController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController frieghtController = TextEditingController();
  TextEditingController unloadingController = TextEditingController();

  Future<void> selectDate() async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;

        formatted = df.format(selectedDate);
        print(formatted);
      });
  }

  final df = new DateFormat('dd-MM-yyyy');
  DateTime selectedDate;
  var formatted;
  @override
  void initState() {
    Provider.of<BrandProvider>(context, listen: false).fetchData();
    Provider.of<CompanyProvider>(context, listen: false).fetchData();
    Provider.of<DriverProvider>(context, listen: false).fetchData();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      // Place for appBar
      appBar: AppBar(
        backgroundColor: Color(0xff575881),
      ),
      drawer: Drawer(
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WareHouseDispatchPage()),
                );
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddCompanyPage()),
                );
              },
              title: Text("ADD COMPANY"),
              leading: Image.asset(
                "assets/company.png",
                height: 20,
              ),
            ),
            // Title for AddBrand Page
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddBrandPage()),
                );
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddDriverPage()),
                );
              },
              title: Text("ADD DRIVER"),
              leading: Image.asset(
                "assets/driver.png",
                height: 20,
              ),
            ),
            // Title for Add Agent Page
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddAgentPage()),
                );
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
              "Warehouse Dispatch",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            )),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 70),
            child: Text(
              "Add Shipment",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          // Fields starts here

          SizedBox(
            height: 10,
          ),
          // date and date row
          Row(
            children: [
              // date column
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 80),
                    child: Text(
                      "Date",
                      style: TextStyle(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectDate();
                        print(formatted);
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 80),
                      child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * .4,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(formatted == null
                                ? df.format(DateTime.now())
                                : formatted),
                          )),
                    ),
                  ),
                ],
              ),
              // date column
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Text(
                      "Date",
                      style: TextStyle(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Container(
                          width: MediaQuery.of(context).size.width * .4,
                          color: Colors.white,
                          child: TextField()),
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 80),
                    child: Text(
                      "Company",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 80),
                    child: Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width * .4,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: DropdownButton<dynamic>(
                          isExpanded: true,
                          value: companySelection,
                          hint: Text('Select Company'),
                          items: Provider.of<CompanyProvider>(context)
                              .companyList
                              .map((item) {
                            return new DropdownMenuItem(
                                child: new Text(item["name"]),
                                value: item["id"].toString());
                          }).toList(),
                          onChanged: (newVal) {
                            setState(() {
                              companySelection = newVal;
                              print(companySelection);
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Text(
                      "Brand",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width * .4,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: DropdownButton<dynamic>(
                          isExpanded: true,
                          value: brandSelection,
                          hint: Text('Select Brand'),
                          items: Provider.of<BrandProvider>(context)
                              .brandlist
                              .map((item) {
                            return new DropdownMenuItem(
                                child: new Text(item["name"]),
                                value: item["id"].toString());
                          }).toList(),
                          onChanged: (newVal) {
                            setState(() {
                              brandSelection = newVal;
                              print(brandSelection);
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 80),
                    child: Text(
                      "Vehicle number",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 80),
                    child: Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width * .4,
                      child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: DropdownButton<dynamic>(
                            isExpanded: true,
                            value: vehicleSelection,
                            hint: Text('Select Vehicle'),
                            items: Provider.of<DriverProvider>(context)
                                .driverlist
                                .map((item) {
                              return new DropdownMenuItem(
                                  child: new Text(item["vihical_no"]),
                                  value: item["id"].toString());
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                vehicleSelection = newVal;

                                print(vehicleSelection);
                              });
                            },
                          )),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Text(
                      "Qunatity",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Container(
                        width: MediaQuery.of(context).size.width * .4,
                        color: Colors.white,
                        child: TextField(
                          controller: quantityController,
                        )),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 80),
                    child: Text(
                      "Rate",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 80),
                    child: Container(
                        width: MediaQuery.of(context).size.width * .4,
                        color: Colors.white,
                        child: TextField(
                          controller: rateController,
                        )),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Text(
                      "Freight",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Container(
                        width: MediaQuery.of(context).size.width * .4,
                        color: Colors.white,
                        child: TextField(
                          controller: frieghtController,
                        )),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 80),
                    child: Text(
                      "Unloading charges",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 80),
                    child: Container(
                        width: MediaQuery.of(context).size.width * .4,
                        color: Colors.white,
                        child: TextField(
                          controller: unloadingController,
                        )),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Text(
                      "Destination",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Container(
                        width: MediaQuery.of(context).size.width * .4,
                        color: Colors.white,
                        child: TextField(
                          controller: destinationController,
                        )),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),

          //Buttons
          Padding(
            padding: const EdgeInsets.only(right: 90),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonTheme(
                  minWidth: 120,
                  height: 40,
                  child: RaisedButton(
                    color: Color(0xff575881),
                    onPressed: () {
                      rateController.clear();
                      quantityController.clear();
                      unloadingController.clear();
                      destinationController.clear();
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
                      Provider.of<DispatchProvider>(context, listen: false)
                          .addDataDispath({
                        'Destination': destinationController.text,
                        'qty': quantityController.text,
                        'rate': rateController.text,
                        'Frieght': frieghtController.text,
                        'unloading': unloadingController.text,
                        'Driver': vehicleSelection.toString(),
                        'brand': brandSelection.toString(),
                        'company': companySelection.toString()
                      });

                      quantityController.clear();
                      rateController.clear();
                      frieghtController.clear();
                      unloadingController.clear();
                      destinationController.clear();
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
              "Shipments",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              child: Expanded(
                  child: Consumer<DispatchProvider>(
            builder: (context, modelcompany, _) => FutureBuilder(
                future: modelcompany.fetchDataDisptch(),
                builder: (context, snapshot) {
                  return ListView.builder(
                      addAutomaticKeepAlives: true,
                      addRepaintBoundaries: true,
                      shrinkWrap: true,
                      reverse: true,
                      itemCount: modelcompany.orderPlacementDispatchList.length,
                      itemBuilder: (BuildContext context, int index) {
                        var nameUpdatecontroller = TextEditingController();

                        return Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Company"),
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
                                                      .orderPlacementDispatchList[
                                                          index]["company"]
                                                          ["name"]
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
                                      Text("Brand"),
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
                                                      .orderPlacementDispatchList[
                                                          index]["brand"]
                                                          ["name"]
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
                                      Text("Vehicle Number"),
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
                                                      .orderPlacementDispatchList[
                                                          index]["brand"]
                                                          ["name"]
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
                                      Text("Quantity"),
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
                                                      .orderPlacementDispatchList[
                                                          index]["qty"]
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
                                              modelcompany
                                                      .orderPlacementDispatchList[
                                                  index]["id"];
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
                                                modelcompany.delData(modelcompany
                                                    .orderPlacementDispatchList[
                                                        index]['id']
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
          )))
        ],
      ),
    );
  }
}
