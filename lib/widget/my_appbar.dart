import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  MyAppBar({Key key, Widget title})
      : super(
            key: key,
            title: title,
            actions: [],
            leading: Drawer(
              child: Column(
                children: [],
              ),
            ));
}
