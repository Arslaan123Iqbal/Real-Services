import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:real_services/provider%20model/agent_provider.dart';
import 'package:real_services/provider%20model/customer_provider.dart';
import 'package:real_services/provider%20model/customer_recovery_provider.dart';
import 'package:real_services/show_screen/Show_Customer.dart';

class CustomerRecovery extends StatefulWidget {
  @override
  _CustomerRecoveryState createState() => _CustomerRecoveryState();
}

class _CustomerRecoveryState extends State<CustomerRecovery> {
  var formkey = GlobalKey<FormState>();
  var agentopeningController = TextEditingController();
  var amtpaidController = TextEditingController();

  String customerslection;
  String agentslection;
  @override
  void initState() {
    Provider.of<CustomerProvider>(context, listen: false).fetchCustomerData();
    Provider.of<AgentProvider>(context, listen: false).fetchAgentData();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var agents = Provider.of<AgentProvider>(context, listen: false).agentlist;
    return Scaffold(
      backgroundColor: Color(0xffbfb28f),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "Customer Recovery ",
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
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: Container(
                        height: 20,
                        width: 60,
                        color: Color(0xffffffff),
                        child: Center(child: Text("Press")),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // Row for party name
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Row element 1st
                    Text("Customer:"),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .09,
                    ),
                    // input field drop down menu
                    DropdownButton<dynamic>(
                      value: customerslection,
                      hint: Text('Click Here'),
                      items: Provider.of<CustomerProvider>(context)
                          .customerlist
                          .map((item) {
                        return new DropdownMenuItem(
                            child: new Text(item["name"]),
                            value: item["id"].toString());
                      }).toList(),
                      onChanged: (newVal) {
                        setState(() {
                          customerslection = newVal;
                          print(customerslection);
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Row element 1st
                    Text("Agents:"),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .09,
                    ),
                    // input field drop down menu
                    DropdownButton<dynamic>(
                      value: agentslection,
                      hint: Text('Click Here'),
                      items: agents.map((item) {
                        return new DropdownMenuItem(
                            child: new Text(item["name"].toString()),
                            value: item["id"].toString());
                      }).toList(),
                      onChanged: (newVal) {
                        setState(() {
                          agentslection = newVal;
                          print(agentslection);
                        });
                      },
                    ),
                  ],
                ),
              ),
              // Row for party phone number
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  children: [
                    // Row element 1st
                    Text("Agent Opening"),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .03,
                    ),
                    // input field
                    Container(
                      height: 25.0,
                      width: 150.0,
                      color: Colors.white,
                      child: Container(
                        child: TextField(
                            controller: agentopeningController,
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
              // Row for opening balance
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    // Row element 1st
                    Text("Amount Paid"),
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
                            controller: amtpaidController,
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
                  if (agentopeningController.text.isNotEmpty &&
                      amtpaidController.text.isNotEmpty) {
                    Provider.of<CustomerRecoveryProvider>(context,
                            listen: false)
                        .addCustomerRecoveryData({
                      "amount_paid": amtpaidController.text,
                      "agent_opening": agentopeningController.text,
                      "customer": customerslection.toString(),
                      "agent": agentslection.toString(),
                    });
                    print("'Amount'${amtpaidController.text}");
                    print("'opening'${agentopeningController.text}");

                    print(customerslection.toString());
                    amtpaidController.clear();
                    agentopeningController.clear();
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
                      MaterialPageRoute(builder: (context) => ShowCustomer()),
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
                      child: Center(child: Text("Show Customers  Recovery")),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
