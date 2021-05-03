import 'package:flutter/material.dart';

class AddExpense extends StatefulWidget {
  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final List<String> subjects = ['Title 1', 'Title 2', 'Title 3'];
  String SelectedSubsjects = 'Title 1';
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
              "Add Expense",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 30),
            // Row for Expense title
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  // Row element 1st
                  Text("Expense Title:"),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .09,
                  ),
                  // input field
                  // Container(
                  //   height: 25.0,
                  //   width: 150.0,
                  //   color: Colors.white,
                  //   child: Container(

                  //       // child: TextField(
                  //       //     decoration: InputDecoration(
                  //       //         border: InputBorder.none, hintText: "")),
                  //       // decoration: BoxDecoration(
                  //       //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  //       // ),
                  //       ),
                  // ),
                  Container(
                    child: Column(
                      children: [
                        //DrpDown for Title
                        DropdownButton<String>(
                          value: SelectedSubsjects,
                          onChanged: (value) {
                            setState(() {
                              SelectedSubsjects = value;
                            });
                          },
                          items: subjects.map<DropdownMenuItem<String>>(
                            (value) {
                              return DropdownMenuItem(
                                child: Text(value),
                                value: value,
                              );
                            },
                          ).toList(),
                        )
                      ],
                    ),
                  )
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
                  Text("Expense Amount:"),
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
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Row(
                children: [
                  // Row element 1st
                  Text("Expense date:"),
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
                              hintText: DateTime.now().toString())),
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
            // Row for opening balance
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  // Row element 1st
                  Text("Description:"),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .006,
                  ),
                  // input field
                  Container(
                    height: 50.0,
                    width: 150.0,
                    color: Colors.white,
                    child: Container(
                      child: TextField(
                          keyboardType: TextInputType.multiline,
                          minLines: 1, //Normal textInputField will be displayed
                          maxLines:
                              5, // when user presses enter it will adapt to it
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
                width: 120,
                color: Color(0xffffffff),
                child: Center(child: Text("Add Expense")),
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
