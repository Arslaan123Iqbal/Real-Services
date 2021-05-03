import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:real_services/provider%20model/add_company_provider.dart';
import 'package:real_services/show_screen/show_company_data.dart';

class AddCompany extends StatefulWidget {
  @override
  _AddCompanyState createState() => _AddCompanyState();
}

class _AddCompanyState extends State<AddCompany> {
  var formkey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var contactController = TextEditingController();
  var openingbalController = TextEditingController();

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
              "Add Company",
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
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
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
              padding: const EdgeInsets.only(left: 30.0),
              child: Row(
                children: [
                  // Row element 1st
                  Text("Company Name:"),
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
            // Row for party phone number
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Row(
                children: [
                  // Row element 1st
                  Text("Party Phone no:"),
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
                          controller: contactController,
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
                          controller: openingbalController,
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
                    contactController.text.isNotEmpty &&
                    openingbalController.text.isNotEmpty) {
                  Provider.of<CompanyProvider>(context, listen: false).addData({
                    "name": nameController.text,
                    "contact": contactController.text,
                    "opening_Balance": openingbalController.text,
                  });
                  nameController.clear();
                  contactController.clear();
                  openingbalController.clear();
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShowCompany()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width - 100,
                  color: Color(0xffffffff),
                  child: Center(child: Text("Show Companies")),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
