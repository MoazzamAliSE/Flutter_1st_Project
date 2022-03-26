import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/catalog.dart';
import '../models/catalog.dart';
import '../widgets/drawer.dart';
import '../widgets/items_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final int days = 30;
  final String name = "Moazzam";
  @override
  void initState() {
    // init method class is initialized and before build it load the data and passed to the widget
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString(
        "assets/files/catalog.json"); // data reached but we have to decrypt the loaded data
    final decodedData = jsonDecode(
        catalogJson); // jsonEncode means map to string     decode means string to map    map key value or any other format
    var productData = decodedData["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(50, (index) => CatalogModel.item[0]);
    // final dummyList = List.generate(10, (index) => CatalogModel.items[0]);

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
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
            ? ListView.builder(
                itemCount: CatalogModel.items!.length,
                itemBuilder: (context, index) {
                  return ItemWidget(
                    item: CatalogModel.items![index],
                  );
                },
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
      // Center(
      //   child: Container(
      //     child: Text(
      //       // context.runtimeType.toString(),
      //       'Welcome Man you are going to complete flutter before $days March Best of luck $name',
      //     ),
      //   ),
      // ),
      drawer: MyDrawer(),
    );
  }
}
