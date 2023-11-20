import 'package:flutter_training/core/store.dart';
import 'package:flutter_training/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  // Singleton for only one time object created and used every times
  // static final cartModel = CartModel._singleton();

  // CartModel._singleton();

  // factory CartModel() => cartModel;

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

  num get TotalMPrice =>
      items.fold(0, (total, current) => total - current.price);

// add items
  // void add(Item item) {
    // _itemIds.add(item.id);
  // }

//  remove items
  // void remove(Item item) {
  //   _itemIds.remove(item.id);
  // }
}

class AdMutation extends VxMutation<MyStore> {
  final Item item;

  AdMutation(this.item);


  @override
  perform() {
    store!.cart._itemIds.add(item.id);
  }
}


class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);


  @override
  perform() {
    store!.cart._itemIds.remove(item.id);
  }
}