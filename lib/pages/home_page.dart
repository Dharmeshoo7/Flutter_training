import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_training/models/catalog.dart';
import 'package:flutter_training/utils/routes.dart';
import 'package:flutter_training/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_training/widgets/home_widgets/catalog_list.dart';
import 'package:flutter_training/widgets/drawer.dart';
import 'package:flutter_training/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodeData = jsonDecode(catalogJson);
    var productsData = decodeData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final days = 20;
    final name = "Codepur";
    // final dummyList = List.generate(30, (index) => CatalogModel.items[0]);

    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: context.theme.primaryColor,
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.cartRoute);
          },
          label: Row(
            children: [
              Icon(
                CupertinoIcons.cart,
                color: Colors.white,
              )
            ],
          )).wh(64, 64).p16(),
      body: SafeArea(
        child: Container(
          padding: Vx.m24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
                CatalogList().py8().expand()
              else
                CircularProgressIndicator().centered().py16().expand(),
            ],
          ),
        ),
      ).pOnly(bottom: 40.0),
    );
  }
}
