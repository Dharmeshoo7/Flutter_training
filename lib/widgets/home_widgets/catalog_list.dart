import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_training/models/cart.dart';
import 'package:flutter_training/models/catalog.dart';
import 'package:flutter_training/pages/homedetail_page.dart';
import 'package:flutter_training/widgets/home_widgets/catalog_image.dart';
import 'package:flutter_training/widgets/themes.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items!.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items![index];
        // final catalog = CatalogModel.getByPosition(index);
        return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeDetailPage(catalog: catalog
                          // catalog: CatalogModel.getById(2)
                          )));
            },
            child: CatalogItem(catalog: catalog));
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog});

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
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.xl.color(MyTheme.darkBluishColor).bold.make(),
            catalog.desc.text
                .maxLines(2)
                .textStyle(context.captionStyle)
                .make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.price}".text.bold.xl.make(),
                _AddToCart(catalog: catalog)
              ],
            ).pOnly(right: 8)
          ],
        ))
      ],
    ))
        .color(context.cardColor)
        .roundedSM
        .square(150)
        .make()
        .py12()
        .w32(context);
  }
}

class _AddToCart extends StatefulWidget {
  final Item catalog;

  const _AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);
  @override
  State<_AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {
  bool _isAdded = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          _isAdded = _isAdded.toggle();
          final _catalog = CatalogModel();
          final _cart = CartModel();
          _cart.catalog = _catalog;
          _cart.add(widget.catalog);
          setState(() {});
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              context.primaryColor,
            ),
            shape: MaterialStateProperty.all(StadiumBorder())),
        child: _isAdded ? Icon(Icons.done) : "Add to Cart".text.make());
  }
}
