import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:real_services/provider%20model/agent_provider.dart';

class ShowAgent extends StatefulWidget {
  @override
  _ShowAgentState createState() => _ShowAgentState();
}

class _ShowAgentState extends State<ShowAgent> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<AgentProvider>(context, listen: false).fetchAgentData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffbfb28f),
        title: Text("Agents"),
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
                          child: Text("Agent Name",
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
                          child: Text("Opening Balance",
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
                      child: Center(child: Text("Date")),
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
                child: Consumer<AgentProvider>(
              builder: (context, drivermodel, _) => FutureBuilder(
                  future: drivermodel.fetchAgentData(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                        itemCount: drivermodel.agentlist.length,
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
                                    height: 40,
                                    width: 40,
                                    color: Color(0xffbfb10),
                                    child: Center(
                                        child: Text(
                                            drivermodel.agentlist[index]['id']
                                                .toString(),
                                            style: TextStyle(fontSize: 12))),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)),
                                  child: Container(
                                    height: 40,
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    color: Color(0xffbfb10),
                                    child: Center(
                                        child: Text(
                                            drivermodel.agentlist[index]
                                                ['name'],
                                            style: TextStyle(fontSize: 13))),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)),
                                  child: Container(
                                      height: 40,
                                      width: 70,
                                      color: Color(0xffbfb10),
                                      child: Center(
                                          child: Text(
                                              drivermodel.agentlist[index]
                                                      ['opening_balance']
                                                  .toString(),
                                              style: TextStyle(fontSize: 13)))),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)),
                                  child: Container(
                                      height: 40,
                                      width: 70,
                                      color: Color(0xffbfb10),
                                      child: Center(
                                          child: Text(
                                              drivermodel.agentlist[index]
                                                      ['date']
                                                  .toString(),
                                              style: TextStyle(fontSize: 13)))),
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
