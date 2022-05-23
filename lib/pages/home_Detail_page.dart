import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

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
      backgroundColor: Mytheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Mytheme.darkBluishColor),
                shape: MaterialStateProperty.all(StadiumBorder()),
              ),
              child: "Add to Cart".text.make(),
            ).wh(120, 50),
          ],
        ).p32(),
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
                    color: Colors.white,
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        catalog.name.text.xl4
                            .color(Mytheme.darkBluishColor)
                            .bold
                            .make(),
                        catalog.desc.text.xl.make(),
                        10.heightBox,
                        const Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Text(
                              "GeeksForGeeks : Learn Anything, Anywhere"
                              "\nGeeksForGeeks is a good platform to learn programming."
                              "\nIt is an educational website.",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
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
