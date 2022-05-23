import 'dart:convert';

import 'package:flutter_application_1/models/cart.dart';

// 3.19 json
//import 'package:flutter/material.dart';
class CatalogModel {
  static final cataModel = CatalogModel._internal();
  CatalogModel._internal();
  factory CatalogModel() => cataModel;
  static List<Item>? items;

  // set catalog(CatalogModel catalog) {}

  // static expand() {}
  // =[
  //   Item(
  //     id: 1,
  //     name: "IPhone 12 Pro",
  //     desc: "Apple",
  //     price: 1999,
  //     color: "#33505a",
  //     image:
  //         // "https://images.unsplash.com/photo-1611791485440-24e8239a0377?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80",
  //         "https://images.priceoye.pk/apple-iphone-12-pro-max-pakistan-priceoye-swc34-500x500.webp",
  //   )
  // ];

  // get Item by ID
  Item getById(int id) =>
      items!.firstWhere((element) => element.id == id, orElse: null);

  // Get item by position
  Item getByPosition(int pos) => items![pos];

  // void add(Item catalog) {}
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

  Item copyWith({
    int? id,
    String? name,
    String? desc,
    num? price,
    String? color,
    String? image,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      color: color ?? this.color,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'desc': desc});
    result.addAll({'price': price});
    result.addAll({'color': color});
    result.addAll({'image': image});

    return result;
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    // ignore: unnecessary_null_comparison
    // if (map == null) return null;
    return Item(
      id: map['id'],
      name: map['name'],
      desc: map['desc'],
      price: map['price'],
      color: map['color'],
      image: map['image'],
      // map['id']?.toInt() ?? 0,
      // map['name'] ?? '',
      // map['desc'] ?? '',
      // map['price'] ?? 0,
      // map['color'] ?? '',
      // map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, price: $price, color: $color, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.price == price &&
        other.color == color &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        color.hashCode ^
        image.hashCode;
  }
}
