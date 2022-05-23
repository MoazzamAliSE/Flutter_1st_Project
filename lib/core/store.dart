import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/catalog.dart';

class MyStore extends VxStore {
// for manipulating the models

  late CatalogModel catalog;
  late CartModel cart;
  late VxNavigator navigator;
  late List<Item> items;
  MyStore(
      // this.catalog,
      // this.cart,
      ) {
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}
