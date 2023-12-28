import 'package:flutter/material.dart';

import 'package:custom_switch_button/custom_switch_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Custom Switch Button example app'),
        ),
        body: GestureDetector(
          onTap: () {
            setState(() {
              isChecked = !isChecked;
            });
          },
          child: Center(
            child: CustomSwitchButton(
              backgroundColor: Colors.blueGrey,
              unCheckedColor: Colors.white,
              animationDuration: Duration(milliseconds: 400),
              checkedColor: Colors.lightGreen,
              checked: isChecked,
            ),
          ),
        ),
      ),
    );
  }
}
