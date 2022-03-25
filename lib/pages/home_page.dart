import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int days = 30;
    final String name = "Moazzam";
    return Scaffold(
      /// Scaffold has a body head and footer
      appBar: AppBar(
        title: Text("Catalog App"),
      ),

      body: Center(
        child: Container(
          child: Text(
              'Welcome Man you are going to complete flutter before $days March Best of luck $name'),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
