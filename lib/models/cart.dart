import 'dart:ffi';

import 'package:flutter_training/models/catalog.dart';

class CartModel {
  // catalog list
  late CatalogModel _catalog;

// collection of ids or store id of each items
  final List<int> _itemIds = [];

// get catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newcatalog) {
    assert(newcatalog != null);
    _catalog = newcatalog;
  }

  // Get items in the cart
  List<Item>? get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  num get totalPrice =>
      items!.fold(0, (total, current) => total + current.price);

  // Add items

  void add(Item item) {
    _itemIds.add(item.id);
  }

  // Remove items
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
