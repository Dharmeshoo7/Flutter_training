import 'package:flutter/material.dart';
import 'package:flutter_training/models/catalog.dart';
import 'package:flutter_training/widgets/home_widgets/add_to_cart.dart';
import 'package:flutter_training/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    var s =
        "Hello this is testing first flutter app with Listview And Image Shared Animations and Pass the " +
            "data to Next Page using MaterialPageRoute with Velocity X Usage";
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.red500.bold.xl4.make(),
            AddToCart(catalog: catalog)
          ],
        ).p24(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image))
                .h32(context),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: context.cardColor,
                child: Column(
                  children: [
                    catalog.name.text.xl4
                        .color(MyTheme.darkBluishColor)
                        .bold
                        .make(),
                    catalog.desc.text.xl2
                        .maxLines(2)
                        .textStyle(context.captionStyle)
                        .make(),
                    10.heightBox,
                    s.text.textStyle(context.captionStyle).bold.xl2.make(),
                  ],
                ).p32(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
