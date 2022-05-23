import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/utils/routes.dart';

import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_application_1/models/catalog.dart';
import '../models/catalog.dart';
import '../widgets/drawer.dart';
import '../widgets/home_widgets/Catalog_Header.dart';
import '../widgets/home_widgets/Catalog_list.dart';
import '../widgets/themes.dart';

class Homepage extends StatefulWidget {
  // const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
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
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: context.canvasColor,
        
      ),
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: context.theme.buttonColor,
          child: Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          )),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
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
