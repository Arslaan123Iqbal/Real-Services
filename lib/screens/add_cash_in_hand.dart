import 'package:flutter/material.dart';

class AddCashInHand extends StatefulWidget {
  @override
  _AddCashInHandState createState() => _AddCashInHandState();
}

class _AddCashInHandState extends State<AddCashInHand> {
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
              "Add Cash In hand",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 30),
            // Row for date
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Row(
                children: [
                  // Row element 1st
                  Text("Date:"),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .08,
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
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  // Row element 1st
                  Text("Name:"),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .09,
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
            // Expense amount
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Row(
                children: [
                  // Row element 1st
                  Text("Opening Balance:"),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .04,
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
            // Row Expense date

            SizedBox(
              height: 10,
            ),
            // Row for opening balance

            SizedBox(
              height: 30,
            ),
            // Button
            Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Container(
                height: 20,
                width: 60,
                color: Color(0xffffffff),
                child: Center(child: Text("Add ")),
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
