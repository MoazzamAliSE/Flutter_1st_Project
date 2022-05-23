import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/utils/routes.dart';

import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_application_1/models/catalog.dart';
import '../models/catalog.dart';
import '../widgets/drawer.dart';
import '../widgets/home_widgets/Catalog_Header.dart';
import '../widgets/home_widgets/Catalog_list.dart';
import '../widgets/themes.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  // const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final int days = 30;
  final String name = "Moazzam";
  // final url = 'https://api.jsonbin.io/b/604dbddb683e73079c433fd3';

  // final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";
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
    // final response = await http.get(Uri(host: url));

    // final response = await http.get(Uri.parse(url));
    // final catalogJson = response.body;
    final decodedData = jsonDecode(
        catalogJson); // jsonEncode means map to string     decode means string to map    map key value or any other format
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    (VxState.store as MyStore).items = CatalogModel.items!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final _cart = (VxState.store as MyStore).cart;
    final MyStore store = VxState.store;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.canvasColor,
      ),
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => store.navigator.routeManager.push(
          Uri.parse(MyRoutes.cartRoute),
        ),
        // VxBuilder(
        //   mutations: {AddMutation, RemoveMutation},
        //   builder: (BuildContext context, store, VxStatus? status) =>

        // onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        backgroundColor: context.theme.buttonColor,
        child: Icon(
          CupertinoIcons.cart,
          color: Colors.white,
        ),
      ),
      // .badge(
      //   color: Vx.red500,
      //   size: 22,
      //   count: _cart.items.length,
      //   textStyle:
      //       TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      // ),

      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              CupertinoSearchTextField(
                onChanged: (value) {
                  SearchMutation(value);
                },
              ).p32(),
              if (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().py16().expand(),
            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}



  // @override
  // Widget build(BuildContext context) {
  //   // final dummyList = List.generate(50, (index) => CatalogModel.item[0]);
  //   // final dummyList = List.generate(10, (index) => CatalogModel.items[0]);

  //   return Scaffold(
      // /// Scaffold has a body head and footer
      // appBar: AppBar(
      //   // backgroundColor: Colors.white,
      //   // elevation: 0.0,
      //   // iconTheme: IconThemeData(color: Colors.black),
      //   title: Text(
      //     "Catalog App",
      //     // style: TextStyle(color: Colors.black),
      //   ),
      // ),
      // // Widgets are immutable means they are not changeable   blueprint  not paint only configuration     create element
      // // elememnt is mutable
      // // 3 widget trees one is on which we are working
      // // widget tree-
      // // to
      // // element tree-
      // // to
      // // render tree -
      // // canvass paper draw
      // // body:
      // // Container(
      // //   width: 100,
      // //   height: 100,
      // //   color: Colors.amberAccent,
      // // ),

      // // Container(
      // //   constraints: BoxConstraints(
      // //     maxHeight: 200,
      // //     maxWidth: 200,
      // //     minHeight: 70,
      // //     minWidth: 70,
      // //   ),
      // //   color: Colors.green,
      // //   child: Container(
      // //     height: 70,
      // //     width: 120,
      // //     color: Colors.amber,
      // //   ),
      // // ),
      // body: Padding(
      //   padding: const EdgeInsets.all(18.0),
      //   child: (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
      //       ? GridView.builder(
      //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //             crossAxisCount: 2,
      //             mainAxisSpacing: 16,
      //             crossAxisSpacing: 16,
      //           ),

      //           itemCount: CatalogModel.items!.length, // fix the length
      //           itemBuilder: (BuildContext context, int index) {
      //             final item = CatalogModel.items![index];
      //             return Card(
      //               clipBehavior: Clip.antiAlias,
      //               shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(10)),
      //               child: GridTile(
      //                   header: Container(
      //                     child: Text(
      //                       item.name,
      //                       style: TextStyle(color: Colors.white),
      //                     ),
      //                     padding: const EdgeInsets.all(12),
      //                     decoration: BoxDecoration(color: Colors.deepPurple),
      //                   ),
      //                   child: Image.network(
      //                     item.image,
      //                     // height: 60,//// no change because sizes go down
      //                     // fit: BoxFit.contain,// no change because sizes go down
      //                   ),
      //                   footer: Container(
      //                     child: Text(
      //                       item.price.toString(),
      //                       style: TextStyle(color: Colors.white),
      //                     ),
      //                     padding: const EdgeInsets.all(12),
      //                     decoration: BoxDecoration(color: Colors.black),
      //                   )),
      //             );
      //           },
      //         )

      //       // ListView.builder(
      //       //     itemCount: CatalogModel.items!.length,
      //       //     itemBuilder: (context, index) {
      //       //       return ItemWidget(
      //       //         item: CatalogModel.items![index],
      //       //       );
      //       //     },
      //       //   )
      //       : const Center(
      //           child: CircularProgressIndicator(),
      //         ),
      // ),
      // // Center(
      // //   child: Container(
      // //     child: Text(
      // //       // context.runtimeType.toString(),
      // //       'Welcome Man you are going to complete flutter before $days March Best of luck $name',
      // //     ),
      // //   ),
      // // ),
      // drawer: MyDrawer(),
//     );
//   }
// }
