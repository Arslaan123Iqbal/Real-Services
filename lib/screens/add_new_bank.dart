import 'package:flutter/material.dart';

class AddBank extends StatefulWidget {
  @override
  _AddBankState createState() => _AddBankState();
}

class _AddBankState extends State<AddBank> {
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
              "Add New  Bank",
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
                  Column(
                    children: [
                      Container(
                        height: 25.0,
                        width: 150.0,
                        color: Colors.white,
                        child: Container(
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: DateTime.now().toLocal().toString()),
                          ),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
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
                  Text("Bank Name:"),
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
                  Text("Bank Address:"),
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
                  Text("Bank contact person:"),
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
            Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Container(
                height: 20,
                width: 80,
                color: Color(0xffffffff),
                child: Center(child: Text("Submit")),
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
          ],
        ),
      ),
    );
  }
}
