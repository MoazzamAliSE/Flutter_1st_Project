import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import '../models/catalog.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({Key? key, required this.item})
      : assert(item !=
            null), // assert is used to check the item is null or not  it is also use in debugging
        super(key: key);
  final Item item;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      // shape: StadiumBorder(),
      // elevation: 0.5,
      child: ListTile(
          onTap: () {
            print("${item.name} is pressed");
          },
          leading: Image.network(item.image),
          title: Text(
            item.name,
            textScaleFactor: 1.2,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
          subtitle: Text(item.desc),
          trailing: Text(
            "\$${item.price}",
            textScaleFactor: 1.5,
            style: TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}
