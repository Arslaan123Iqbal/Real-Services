import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Check2 extends StatefulWidget {
  @override
  _Check2State createState() => _Check2State();
}

class _Check2State extends State<Check2> {
  final df = new DateFormat('dd-MM-yyyy');

  DateTime myvalue = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(onPressed: () {
        print(df.format(myvalue));
      }),
    );
  }
}
