// 3.19 json
//import 'package:flutter/material.dart';
class CatalogModel {
  static final item = [
    Item(
      id: 1,
      name: "IPhone 12 Pro",
      desc: "Apple",
      price: 1999,
      color: "#33505a",
      image:
          // "https://images.unsplash.com/photo-1611791485440-24e8239a0377?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80",
          "https://images.priceoye.pk/apple-iphone-12-pro-max-pakistan-priceoye-swc34-500x500.webp",
    )
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}
