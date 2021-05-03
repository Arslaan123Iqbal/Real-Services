import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:real_services/provider%20model/add_company_provider.dart';
import 'package:real_services/update_screens/updateCompany.dart';

class ShowCompany extends StatefulWidget {
  @override
  _ShowCompanyState createState() => _ShowCompanyState();
}

class _ShowCompanyState extends State<ShowCompany> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  Future<Null> refreshList() async {
    refreshKey.currentState?.show();
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      Provider.of<CompanyProvider>(context, listen: false)
          .companyList
          .toString();
    });

    return null;
  }

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<CompanyProvider>(context, listen: false).fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffbfb28f),
        title: Text("Company"),
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
                          child: Text("Company Name",
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
                  Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.2,
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
                child: Consumer<CompanyProvider>(
              builder: (context, modelcompany, _) => FutureBuilder(
                  future: modelcompany.fetchData(),
                  builder: (context, snapshot) {
                    return RefreshIndicator(
                      key: refreshKey,
                      child: ListView.builder(
                          addAutomaticKeepAlives: true,
                          addRepaintBoundaries: true,
                          shrinkWrap: true,
                          itemCount: modelcompany.companyList.length,
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
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                      width: 40,
                                      color: Color(0xffbfb10),
                                      child: Center(
                                          child: Text(modelcompany
                                              .companyList[index]["id"]
                                              .toString())),
                                    ),
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
                                          0.2,
                                      color: Color(0xffbfb10),
                                      child: Center(
                                          child: Text(modelcompany
                                              .companyList[index]['name'])),
                                    ),
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
                                          0.2,
                                      color: Color(0xffbfb10),
                                      child: Center(
                                          child: Text(modelcompany
                                              .companyList[index]['contact']
                                              .toString())),
                                    ),
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
                                          0.2,
                                      color: Color(0xffbfb10),
                                      child: Center(
                                          child: Text(modelcompany
                                              .companyList[index]
                                                  ['opening_Balance']
                                              .toString())),
                                    ),
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
                                          0.2,
                                      color: Color(0xffbfb10),
                                      child: Center(
                                          child: Text(modelcompany
                                              .companyList[index]['date']
                                              .toString())),
                                    ),
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
                                          modelcompany.delData(modelcompany
                                              .companyList[index]['id']
                                              .toString());
                                          // print(model.brandlist[index]['id']
                                          //     .runtimeType);
                                        },
                                        child: Text("Delete"),
                                      )),
                                    ),
                                  ),
                                  RaisedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              updateCompanyWidget(
                                            context,
                                            modelcompany.companyList[index]
                                                ["id"],
                                            modelcompany.companyList[index]
                                                    ["name"]
                                                .toString(),
                                            modelcompany.companyList[index]
                                                    ["contact"]
                                                .toString(),
                                            modelcompany.companyList[index]
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
