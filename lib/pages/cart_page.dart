import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart.dart';
// import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:vxstate/vxstate.dart';
// import 'package:vxstate/vxstate.dart';
import '../core/store.dart';
import 'package:pay/pay.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.color(context.theme.accentColor).xl4.make(),
      ),
      body: Column(children: [
        _CartList().p32().expand(),
        Divider(),
        _CartTotal(),
      ]),
    );
  }
}

class _CartTotal extends StatelessWidget {
  _CartTotal({Key? key}) : super(key: key);
  // final _cart = CartModel();
  final _paymentItems = <PaymentItem>[];
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    // print(" rebuild happened");

    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            //  Notification:{},
            mutations: {RemoveMutation},
            notifications: {},
            builder: (BuildContext context, store, VxStatus? status) {
              // print("remove rebuild happened");
              {
                return "\$${_cart.totalPrice}"
                    .text
                    .xl5
                    .color(context.theme.accentColor)
                    .make();
              }
            },
          ),
          30.widthBox,
          Row(
            children: [
              // ApplePayButton(
              //   paymentConfigurationAsset: 'applepay.json',
              //   paymentItems: _paymentItems,
              //   width: 200,
              //   height: 50,
              //   style: ApplePayButtonStyle.black,
              //   type: ApplePayButtonType.buy,
              //   margin: const EdgeInsets.only(top: 15.0),
              //   onPaymentResult: (data) {
              //     if (kDebugMode) {
              //       print(data);
              //     }
              //   },
              //   loadingIndicator: const Center(
              //     child: CircularProgressIndicator(),
              //   ),
              // ),
              GooglePayButton(
                paymentConfigurationAsset: 'gpay.json',
                paymentItems: _paymentItems,
                width: 200,
                height: 50,
                style: GooglePayButtonStyle.black,
                type: GooglePayButtonType.buy,
                margin: const EdgeInsets.only(top: 15.0),
                onPaymentResult: (data) {
                  print(data);
                },
                loadingIndicator: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     ScaffoldMessenger.of(context).showSnackBar(
          //       SnackBar(
          //         content: "Buying not supported yet".text.make(),
          //       ),
          //     );
          //   },
          //   style: ButtonStyle(
          //       backgroundColor:
          //           MaterialStateProperty.all(context.theme.buttonColor)),
          //   child: "Buy".text.white.make(),
          // ).w32(context),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
//   _CartList({Key? key}) : super(key: key);

//   @override
//   State<_CartList> createState() => _CartListStateState();
// }

// class _CartListStateState extends State<_CartList> {

//   final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;

    return _cart.items.isEmpty
        ? "Notihng to Show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (BuildContext context, int index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () {
                  RemoveMutation(_cart.items[index]);
                  // _cart.remove(_cart.items[index]);
                  // setState(() {});
                },
              ),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}
