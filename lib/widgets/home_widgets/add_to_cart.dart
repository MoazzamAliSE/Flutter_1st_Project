import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/cart.dart';
import '../../models/catalog.dart';
import '../../core/store.dart';
import 'package:vxstate/vxstate.dart';

class AddToCart extends StatelessWidget {
  AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);
  final Item catalog;
//   @override
//   State<AddToCart> createState() => AddToCartState();
// }

// class AddToCartState extends State<AddToCart> {
  // f2 for changing name at all places

  // final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    // VxState.events;
    VxState.watch(context, on: [AddMutation, RemoveMutation]);

    final CartModel _cart = (VxState.store as MyStore).cart;
    // final CatalogModel _catalog = (VxState.store as MyStore).catalog;
    bool isInCart = _cart.items.contains(catalog);
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          // isInCart = isInCart.toggle();

          // final _catalog = CatalogModel();
          AddMutation(catalog);
          // _cart.catalog = _catalog;
          // _cart.add(catalog);
          // setState(() {});
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
        shape: MaterialStateProperty.all(
          StadiumBorder(),
        ),
      ),
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
