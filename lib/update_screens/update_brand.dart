import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_services/provider%20model/brand_model_provider.dart';

updateBrandwidget(BuildContext context, var id, var name) {
  TextEditingController nameController = TextEditingController(text: name);
  return Scaffold(
      backgroundColor: Color(0xffbfb28f),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          // Title brand name
          Text("Add New Brand Name"),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Row element 1st
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  children: [
                    // Row element 1st
                    Text("Brand Name:"),
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
            ],
          ),
          SizedBox(height: 10),
          // For submit button
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: GestureDetector(
              onTap: () {
                if (nameController.text.isNotEmpty) {
                  Provider.of<BrandProvider>(context, listen: false)
                      .updatedata({
                    "name": nameController.text,
                  }, id);

                  nameController.clear();
                }
              },
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width - 200,
                color: Color(0xffffffff),
                child: Center(child: Text("Update")),
              ),
            ),
          ),
          SizedBox(height: 10),
          //Back to HomePage
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 20,
                width: 60,
                color: Color(0xffffffff),
                child: Center(child: Text("Back")),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width - 100,
                color: Color(0xffffffff),
                child: Center(child: Text("Show brand")),
              ),
            ),
          ),
        ],
      ));
}
