import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // int days = 30;
    // double pi = 3.14; // it can be change because it is not final or const
    // String name = "Moazzam";
    // bool isMale = true;
    // num anyDecimalValue = 30.5; // any numerical value
    // var day = "tuesday"; // var can be any value it can be string or num
    // const piVakue = 3.14; //let the value that will never change
    // final list = [
    //   2,
    //   4
    // ]; // final is modifiable means a list can be modifiable after a while
    return MaterialApp(
      home: Homepage(),
    );
  }
}
