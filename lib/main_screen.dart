import 'package:flutter/material.dart';
import 'package:real_services/screens/warehouse_dispatch.dart';
import 'package:real_services/show_screen/Show_Customer.dart';
import 'package:real_services/widget/my_appbar.dart';

class MainScreenPage extends StatefulWidget {
  @override
  _MainScreenPageState createState() => _MainScreenPageState();
}

class _MainScreenPageState extends State<MainScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff575881),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            // For home Tile
            Container(
              decoration: BoxDecoration(
                  color: Color(0xffF4F4F7),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            // Title for warehouse
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WarehouseDispatch()),
                );
              },
              title: Text("WAREHOUSE DISPATCH"),
              leading: Icon(Icons.home_outlined),
            ),
            Divider(
              color: Colors.grey,
            ),
            // Title for Add Company
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WarehouseDispatch()),
                );
              },
              title: Text("ADD COMPANY"),
              leading: Icon(Icons.home_outlined),
            ),
            // Title for warehouse
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WarehouseDispatch()),
                );
              },
              title: Text("ADD BRAND"),
              leading: Icon(Icons.home_outlined),
            ),
            // Title for warehouse
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WarehouseDispatch()),
                );
              },
              title: Text("ADD DRIVER"),
              leading: Icon(Icons.home_outlined),
            ),
            // Title for warehouse
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WarehouseDispatch()),
                );
              },
              title: Text("ADD AGENT"),
              leading: Icon(Icons.home_outlined),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width - 600,
                    color: Color(0xffffffff),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/truck.png",
                          width: 150,
                          height: 120,
                        ),
                        Divider(),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Warehouse Dispatch",
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    )),
              ),
              SizedBox(
                width: 40,
              ),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width - 600,
                    color: Color(0xffffffff),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/truck.png",
                          width: 150,
                          height: 120,
                        ),
                        Divider(),
                        Text(
                          "Warehouse Dispatch",
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
