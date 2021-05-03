import 'dart:io';

import 'package:flutter/material.dart';

class AddExpenseHead extends StatefulWidget {
  @override
  _AddExpenseHeadState createState() => _AddExpenseHeadState();
}

class _AddExpenseHeadState extends State<AddExpenseHead> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffbfb28f),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          // Title
          Text("Add Expense Head"),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Row element 1st
              Text("Expense"),
              SizedBox(
                width: 30,
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
          SizedBox(height: 10),
          // For submit button
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Container(
              height: 20,
              width: 60,
              color: Color(0xffffffff),
              child: Center(child: Text("Submit")),
            ),
          ),
          //Back to HomePage
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
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
    );
  }
}
