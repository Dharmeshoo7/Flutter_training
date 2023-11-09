import 'package:flutter/material.dart';
import 'package:flutter_training/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.lightBlue.shade50,
      onTap: () {
        print("${item.name} Pressed");
      },
      leading: Image.network(
          "https://imageflix.cam/images/2023/05/31/5898ec7bbfa0cda33adcf212ed5ba92a.md.jpg"),
      title: Text(item.name),
      subtitle: Text(item.desc),
      trailing: Text(
        "\$${item.price}",
        textScaleFactor: 1.5,
        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
      ),
    );
  }
}
