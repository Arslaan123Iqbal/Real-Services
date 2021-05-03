import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:real_services/provider%20model/add_company_provider.dart';
import 'package:real_services/provider%20model/agent_provider.dart';

import 'package:real_services/show_screen/show_agent.dart';

class AddAgent extends StatefulWidget {
  @override
  _AddAgentState createState() => _AddAgentState();
}

class _AddAgentState extends State<AddAgent> {
  var formkey = GlobalKey<FormState>();
  var nameController = TextEditingController();

  var openingbalanceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffbfb28f),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              "Add Agents",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),

            // Title brand name

            SizedBox(height: 30),
            // Row for date
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  // Row element 1st
                  Text("Date:"),

                  SizedBox(
                    width: MediaQuery.of(context).size.width * .21,
                  ),
                  // input field

                  Container(
                    height: 25.0,
                    width: 150.0,
                    color: Colors.white,
                    child: Container(
                      child: TextField(
                          decoration: InputDecoration(
                        border: InputBorder.none,
                      )),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Row for party name
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Row(
                children: [
                  // Row element 1st
                  Text("Agent Name:"),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .085,
                  ),
                  // input field
                  Container(
                    height: 25.0,
                    width: 150.0,
                    color: Colors.white,
                    child: Container(
                      child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "")),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),

            SizedBox(
              height: 10,
            ),
            // Row for opening balance
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  // Row element 1st
                  Text("Opening balance:"),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .006,
                  ),
                  // input field
                  Container(
                    height: 25.0,
                    width: 150.0,
                    color: Colors.white,
                    child: Container(
                      child: TextField(
                          controller: openingbalanceController,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "")),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // Button
            GestureDetector(
              onTap: () {
                if (nameController.text.isNotEmpty &&
                    openingbalanceController.text.isNotEmpty) {
                  Provider.of<AgentProvider>(context, listen: false)
                      .addAgentData({
                    "name": nameController.text,
                    "opening_balance": openingbalanceController.text,
                  });

                  nameController.clear();

                  openingbalanceController.clear();
                }
              },
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Container(
                  height: 20,
                  width: 60,
                  color: Color(0xffffffff),
                  child: Center(child: Text("Submit")),
                ),
              ),
            ),
            //Back to HomePage
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: Container(
                      height: 20,
                      width: 60,
                      color: Color(0xffffffff),
                      child: Center(child: Text("Back")),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShowAgent()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width - 100,
                    color: Color(0xffffffff),
                    child: Center(child: Text("Show Agents")),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
