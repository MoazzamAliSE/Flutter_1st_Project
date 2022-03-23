import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/loginPage.dart';
// import 'pages';
import 'pages/home_page.dart';
// import 'pages/loginpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //naming connventions as for function ftnName() first word's letter is small and other all words letters are capital
    // buildContext is paramater ..
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
    // bringVegetables(thaila: true);  // method

    return MaterialApp(
      // home: Homepage(), // i havve removed or comment this route because i use it in below by "/" because it is homepage
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      darkTheme:
          ThemeData(brightness: Brightness.light, primarySwatch: Colors.green),
      initialRoute: "/home",
      routes: {
        "/": (context) =>
            new LoginPage(), //naming connventions as for object NameObject() first word's letter and all words letters are capital
        "/home": (context) => Homepage(),
        "/login": (context) => LoginPage(),
      },
    );
  }

  // bringVegetables({required bool thaila,int rupees=100}) {
  //   // take bike

  //   // go to mandi
  // }
}
