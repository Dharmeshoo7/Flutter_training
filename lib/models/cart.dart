import 'package:flutter_training/models/catalog.dart';

class CartModel {

  // Singleton for only one time object created and used every times
  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;

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
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  num get TotalPrice =>
      items.fold(0, (total, current) => total + current.price);

// add items
  void add(Item item) {
    _itemIds.add(item.id);
  }

//  remove items
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
