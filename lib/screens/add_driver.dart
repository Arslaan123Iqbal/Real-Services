import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:real_services/provider%20model/driver_provider.dart';
import 'package:real_services/show_screen/driver_show.dart';

class AddDriver extends StatefulWidget {
  @override
  _AddDriverState createState() => _AddDriverState();
}

class _AddDriverState extends State<AddDriver> {
  var formkey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var vehicleController = TextEditingController();
  var contactController = TextEditingController();

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
              "Add Driver",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 30),
            // Row forDriver name
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Form(
                key: formkey,
                child: Row(
                  children: [
                    // Row element 1st
                    Text("Driver Name:"),
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
            ),
            SizedBox(
              height: 10,
            ),
            // Vehicle no
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Row(
                children: [
                  // Row element 1st
                  Text("Vehicle No:"),
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
                          controller: vehicleController,
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
            // Phone no
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Row(
                children: [
                  // Row element 1st
                  Text("Phone No:"),
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
              height: 30,
            ),
            // Button

            GestureDetector(
              onTap: () {
                if (nameController.text.isNotEmpty &&
                    vehicleController.text.isNotEmpty &&
                    contactController.text.isNotEmpty) {
                  Provider.of<DriverProvider>(context, listen: false)
                      .addDriver({
                    "name": nameController.text,
                    "vihical_no": vehicleController.text,
                    "contact": contactController.text
                  });
                  nameController.clear();
                  vehicleController.clear();
                  contactController.clear();
                }
              },
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Container(
                  height: 50,
                  width: 120,
                  color: Color(0xffffffff),
                  child: Center(child: Text("Add Driver")),
                ),
              ),
            ),
            SizedBox(
              height: 10,
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
                  MaterialPageRoute(builder: (context) => ShowDriver()),
                );
              },
              child: Container(
                height: 50,
                width: 200,
                color: Colors.white60,
                child: Center(
                  child: Text(
                    "Show Driver",
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
