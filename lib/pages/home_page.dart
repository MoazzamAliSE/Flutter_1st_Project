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
        // backgroundColor: Colors.white,
        // elevation: 0.0,
        // iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Catalog App",
          // style: TextStyle(color: Colors.black),
        ),
      ),
      // Widgets are immutable means they are not changeable   blueprint  not paint only configuration     create element
      // elememnt is mutable
      // 3 widget trees one is on which we are working
      // widget tree-
      // to
      // element tree-
      // to
      // render tree -
      // canvass paper draw
      // body:
      // Container(
      //   width: 100,
      //   height: 100,
      //   color: Colors.amberAccent,
      // ),

      // Container(
      //   constraints: BoxConstraints(
      //     maxHeight: 200,
      //     maxWidth: 200,
      //     minHeight: 70,
      //     minWidth: 70,
      //   ),
      //   color: Colors.green,
      //   child: Container(
      //     height: 70,
      //     width: 120,
      //     color: Colors.amber,
      //   ),
      // ),
      body: Center(
        child: Container(
          child: Text(
            // context.runtimeType.toString(),
            'Welcome Man you are going to complete flutter before $days March Best of luck $name',
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
