import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:real_services/provider%20model/add_company_provider.dart';

class AddCompanyPage extends StatefulWidget {
  @override
  _AddCompanyPageState createState() => _AddCompanyPageState();
}

class _AddCompanyPageState extends State<AddCompanyPage> {
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

  var nameController = TextEditingController();
  var contactController = TextEditingController();
  var openingbalController = TextEditingController();
  List<bool> list = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  final df = new DateFormat('dd-MM-yyyy');
  DateTime selectedDate;
  var formatted;
  @override
  Widget build(BuildContext context) {
    var companyList =
        Provider.of<CompanyProvider>(context, listen: false).companyList.length;

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
              "Add Company",
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
              "Add Company",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 90),
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
              padding: const EdgeInsets.only(left: 90, right: 200),
              child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(formatted == null
                        ? df.format(DateTime.now())
                        : formatted),
                  )),
            ),
          ),

          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 90),
            child: Text(
              "Company Name",
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
              "Party Phone Number",
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
                    controller: contactController,
                    keyboardType: TextInputType.number,
                  ))),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 90),
            child: Text(
              "Opening Balance",
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
                    controller: openingbalController,
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
                      openingbalController.clear();
                      print(companyList);
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
                          contactController.text.isNotEmpty &&
                          openingbalController.text.isNotEmpty) {
                        Provider.of<CompanyProvider>(context, listen: false)
                            .addData({
                          "name": nameController.text,
                          "contact": contactController.text,
                          "opening_Balance": openingbalController.text,
                          // "date": formatted.toString()
                        });
                        nameController.clear();
                        contactController.clear();
                        openingbalController.clear();
                        print(formatted);
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
              "Companies",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              child: Expanded(
                  child: Consumer<CompanyProvider>(
            builder: (context, modelcompany, _) => FutureBuilder(
                future: modelcompany.fetchData(),
                builder: (context, snapshot) {
                  return ListView.builder(
                      addAutomaticKeepAlives: true,
                      addRepaintBoundaries: true,
                      shrinkWrap: true,
                      reverse: true,
                      itemCount: modelcompany.companyList.length,
                      itemBuilder: (BuildContext context, int index) {
                        var dateUpdatecontroller = TextEditingController(
                            text: modelcompany.companyList[index]["date"]);
                        var nameUpdatecontroller = TextEditingController();
                        var conatctUpdatecontroller = TextEditingController();
                        var openingbalanceUpdatecontroller =
                            TextEditingController();
                        //print(list);
                        bool isEnabled = list[index];
                        print("isEnableINIT ${isEnabled}");
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
                                      Text("Date"),
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
                                                      .companyList[index]
                                                          ["date"]
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
                                              child: TextField())
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
                                      Text("Company Name"),
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
                                                      .companyList[index]
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
                                      Text("Party Phone No:"),
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
                                                      .companyList[index]
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
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Balance"),
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
                                                      .companyList[index]
                                                          ['opening_Balance']
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
                                              list[index] = isEnabled;
                                              //print(list);
                                              print(
                                                  "onEditTapped ${isEnabled}");
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
                                              print(
                                                  "onSaveTapped ${isEnabled}");
                                              list[index] = isEnabled;
                                              print(isEnabled);
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
                                                        .companyList[index]
                                                            ['id']
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
