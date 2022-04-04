import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  // static final cartModel = CartModel._internal();  // these line are to make cart singleton
  // CartModel._internal();
  // factory CartModel() => cartModel;
  //catalog Field
  late CatalogModel _catalog;

  //collection of Ids - store Ids of each item
  final List<int> _itemIds = [];
  // get cataalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

// Get Items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

//get Total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //add items

  void add(Item item) {
    _itemIds.add(item.id);
  }

// remove Item

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    store!.cart._itemIds.add(item.id);
  }
}
class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);

  @override
  perform() {
    store!.cart._itemIds.remove(item.id);
  }
}
