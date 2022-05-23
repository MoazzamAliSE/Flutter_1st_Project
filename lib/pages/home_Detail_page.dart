import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/home_widgets/add_to_cart.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
// import 'package:google_fonts/google_fonts.dart';

class AddIntent extends Intent {}

class SubIntent extends Intent {}

class ZeroIntent extends Intent {}

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);
  final Item catalog;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      // backgroundColor: Mytheme.creamColor,
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: Shortcuts(
          shortcuts: {
            LogicalKeySet(LogicalKeyboardKey.arrowUp): AddIntent(),
            LogicalKeySet(LogicalKeyboardKey.arrowDown): SubIntent(),
            LogicalKeySet(LogicalKeyboardKey.digit0): ZeroIntent(),
          },
          child: Actions(
            actions: {
              AddIntent: CallbackAction<AddIntent>(
                onInvoke: (intent) =>
                    ChangeQuantity(catalog, catalog.quantity + 1),
              ),
              SubIntent: CallbackAction<SubIntent>(
                onInvoke: (Intent) =>
                    ChangeQuantity(catalog, catalog.quantity - 1),
              ),
              ZeroIntent: CallbackAction<ZeroIntent>(
                onInvoke: (Intent) => ChangeQuantity(catalog, 0),
              ),
            },
            child: VxBuilder(
              mutations: {ChangeQuantity},
              builder: (BuildContext context, store, VxStatus? status) {
                print(catalog.quantity);
                return Focus(
                  autofocus: true,
                  child: ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: EdgeInsets.zero,
                    children: [
                      "\$${catalog.price}".text.bold.xl4.red800.make(),
                      VxStepper(
                        key: UniqueKey(),
                        defaultValue: catalog.quantity,
                        onChange: (value) => ChangeQuantity(catalog, value),
                      ),
                      10.heightBox,
                      AddToCart(
                        catalog: catalog,
                      ).wh(120, 50)
                    ],
                    // ElevatedButton(
                    //   onPressed: () {},
                    //   style: ButtonStyle(
                    //     backgroundColor:
                    //         MaterialStateProperty.all(Mytheme.darkBluishColor),
                    //     shape: MaterialStateProperty.all(StadiumBorder()),
                    //   ),
                    //   child: "Add to Cart".text.make(),
                    // ).wh(120, 50),
                  ).p32(),
                );
              },
            ),
          ),
        ),
      ),

      body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image),
              ).h32(context),
              Expanded(
                child: VxArc(
                  height: 30.0,
                  arcType: VxArcType.CONVEY,
                  edge: VxEdge.TOP,
                  child: Container(
                    color: context.cardColor,
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        catalog.name.text.xl4
                            .color(context.theme.accentColor)
                            .bold
                            .make(),
                        catalog.desc.text.xl.make(),
                        10.heightBox,
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Text(
                              "GeeksForGeeks : Learn Anything, Anywhere"
                              "\nGeeksForGeeks is a good platform to learn programming."
                              "\nIt is an educational website."
                              "GeeksForGeeks : Learn Anything, Anywhere"
                              "\nGeeksForGeeks is a good platform to learn programming."
                              "\nIt is an educational website."
                              "\nGeeksForGeeks : Learn Anything, Anywhere"
                              "\nGeeksForGeeks is a good platform to learn programming."
                              "\nIt is an educational website.",
                              style: TextStyle(
                                color: context.accentColor,
                                fontWeight: FontWeight.bold,
                                fontFamily: GoogleFonts.lato().fontFamily,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        )
                      ],
                    ).py64(),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
