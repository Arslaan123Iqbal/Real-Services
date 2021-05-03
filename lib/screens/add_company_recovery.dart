import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_services/provider%20model/add_company_provider.dart';
import 'package:real_services/provider%20model/agent_provider.dart';
import 'package:real_services/provider%20model/company_recovery_provider.dart';

class AddCompanyRecovery extends StatefulWidget {
  @override
  _AddCompanyRecoveryState createState() => _AddCompanyRecoveryState();
}

class _AddCompanyRecoveryState extends State<AddCompanyRecovery> {
  TextEditingController amountPaidContoroller = new TextEditingController();
  TextEditingController amountOpeningController = new TextEditingController();
  String companySelection;
  String agentSelection;

  @override
  void initState() {
    Provider.of<CompanyProvider>(context, listen: false).fetchData();
    Provider.of<AgentProvider>(context, listen: false).fetchAgentData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffbfb28f),
      body: Container(
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 30,
            ),
            Text(
              "Add Agent Company Recovery",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),

            // Title brand name

            SizedBox(height: 30),
            // Row for Company Drop down

            SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  // Row element 1st
                  Text("Company:"),

                  // input field
                  DropdownButton<dynamic>(
                    value: companySelection,
                    items: Provider.of<CompanyProvider>(context, listen: false)
                        .companyList
                        .map((item) {
                      return new DropdownMenuItem(
                          child: new Text(item["name"]),
                          value: item["id"].toString());
                    }).toList(),
                    onChanged: (newVal) {
                      setState(() {
                        companySelection = newVal;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Row for Agent Drop down
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Row(
                children: [
                  // Row element 1st
                  Text("Agent:"),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .03,
                  ),
                  // input field
                  DropdownButton<dynamic>(
                    value: agentSelection,
                    items: Provider.of<AgentProvider>(context, listen: false)
                        .agentlist
                        .map((item) {
                      return new DropdownMenuItem(
                          child: new Text(item["name"]),
                          value: item["id"].toString());
                    }).toList(),
                    onChanged: (newVal) {
                      setState(() {
                        agentSelection = newVal;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Row for Amount paid
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  // Row element 1st
                  Text("Amount Paid:"),
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
                          controller: amountPaidContoroller,
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
            // Row for Agent opening
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  // Row element 1st
                  Text("Agent opening:"),
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
                          controller: amountOpeningController,
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
                Provider.of<CompanyRecoveryProvider>(context, listen: false)
                    .addCompanyRecoveryData({
                  "amount_paid": amountPaidContoroller.text,
                  "agent_opening": amountOpeningController.text,
                  "company": companySelection.toString(),
                  "agent": agentSelection.toString()
                });

                amountOpeningController.clear();
                amountOpeningController.clear();
              },
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Container(
                  height: 20,
                  width: 80,
                  color: Color(0xffffffff),
                  child: Center(child: Text("Add Party")),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            //Back to HomePage
            Container(
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
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 100,
                color: Colors.white60,
                child: Center(child: Text("show Company Recovery")),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
