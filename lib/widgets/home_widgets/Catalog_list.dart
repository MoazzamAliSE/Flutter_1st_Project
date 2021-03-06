import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_1/pages/home_Detail_page.dart';
import 'package:flutter_application_1/widgets/home_widgets/Catalog_Images.dart';
import 'package:flutter_application_1/widgets/home_widgets/add_to_cart.dart';
import '../../models/catalog.dart';
import '../../widgets/themes.dart';
// import '../';

class CatalogList extends StatelessWidget {
  // const CatalogList({Key? key}) : super(key: key);
  // final MyStore store = VxState.store;
  @override
  Widget build(BuildContext context) {
    final MyStore store = VxState.store;
    return Scrollbar(
      child: VxBuilder(
        mutations: {SearchMutation},
        builder: (BuildContext context, store, VxStatus? status) =>
            !context.isMobile
                ? GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, crossAxisSpacing: 20.0),
                    shrinkWrap: true,
                    itemCount: CatalogModel.items!.length,
                    itemBuilder: (context, index) {
                      final Item catalog = CatalogModel.items![index];
                      // final catalog = CatalogModel.getByPosition(index);
                      return InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeDetailPage(
                              // catalog: CatalogModel.getById(2),// only to chech the getbyid is ok
                              catalog: catalog,
                            ),
                          ),
                        ),
                        child: CatalogItem(catalog: catalog),
                      );
                    },
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: CatalogModel.items!.length,
                    itemBuilder: (context, index) {
                      final Item catalog = CatalogModel.items![index];
                      // final catalog = CatalogModel.getByPosition(index);
                      return InkWell(
                        onTap: () => context.vxNav.push(
                          Uri(
                            path: MyRoutes.homeDetailsRoute,
                            queryParameters: {
                              "id": catalog.id.toString(),
                            },
                          ),
                        ),
                        // context,
                        // MaterialPageRoute(
                        //   builder: (context) => HomeDetailPage(
                        // catalog: CatalogModel.getById(2),// only to chech the getbyid is ok
                        // catalog: catalog,

                        child: CatalogItem(catalog: catalog),
                      );
                    },
                  ),
      ),
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({
    Key? key,
    required this.catalog,
  })  : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(
              image: catalog.image,
            ),
          ),
          VxBuilder(
            mutations: {ChangeQuantity},
            builder: (BuildContext context, store, VxStatus? status) =>
                Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  catalog.name.text.lg.color(context.accentColor).bold.make(),
                  catalog.desc.text.make(),
                  10.heightBox,
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: EdgeInsets.zero,
                    children: [
                      "\$${catalog.price}".text.bold.xl.make(),
                      AddToCart(catalog: catalog),
                    ],
                  ).pOnly(right: 8.0)
                ],
              ),
            ),
          ),
        ],
      ),
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}
