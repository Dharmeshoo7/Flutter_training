import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_training/models/catalog.dart';
import 'package:flutter_training/widgets/drawer.dart';
import 'package:flutter_training/widgets/item_widget.dart';

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
      appBar: AppBar(
        title: Text(
          "Codepur",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
            ? ListView.builder(
                itemCount: CatalogModel.items!.length,
                itemBuilder: (context, index) {
                  return ItemWidget(
                    item: CatalogModel.items![index],
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
