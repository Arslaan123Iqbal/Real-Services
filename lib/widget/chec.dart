import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:real_services/widget/appbar_drawerwidget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                color: Colors.grey, height: 50, width: 50, child: TextField())
          ],
        ),
      ),
    );
  }
}
