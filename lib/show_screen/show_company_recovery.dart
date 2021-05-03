import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:real_services/provider%20model/company_recovery_provider.dart';

class ShowCompanyRecovery extends StatefulWidget {
  @override
  _ShowCompanyRecoveryState createState() => _ShowCompanyRecoveryState();
}

class _ShowCompanyRecoveryState extends State<ShowCompanyRecovery> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  Future<Null> refreshList() async {
    refreshKey.currentState?.show();
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      Provider.of<CompanyRecoveryProvider>(context, listen: false)
          .brandlist
          .toString();
    });

    return null;
  }

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<CompanyRecoveryProvider>(context, listen: false).fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffbfb28f),
        title: Text("Company Recovery"),
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
                          child: Text("Amount paid",
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
                          child: Text("Agent opening",
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
                          child: Text("Comapny",
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
                          child: Text("Agent",
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
            ),
            // List view row
            Expanded(
                child: Consumer<CompanyRecoveryProvider>(
              builder: (context, modelcompany, _) => FutureBuilder(
                  future: modelcompany.fetchData(),
                  builder: (context, snapshot) {
                    return RefreshIndicator(
                      key: refreshKey,
                      child: ListView.builder(
                          addAutomaticKeepAlives: true,
                          addRepaintBoundaries: true,
                          shrinkWrap: true,
                          itemCount: modelcompany.brandlist.length,
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
                                              .brandlist[index]["id"]
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
                                              .brandlist[index]['amount_paid']
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
                                              .brandlist[index]['agent_opening']
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
                                              .brandlist[index]['company']
                                                  ['name']
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
                                              .brandlist[index]['agent']['name']
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
                                              .brandlist[index]['date']
                                              .toString())),
                                    ),
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
