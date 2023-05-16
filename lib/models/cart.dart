import 'package:catalog_app_flutter/models/catalog.dart';

class CartModel {
  static final _cartModel = CartModel.internal();
  CartModel.internal();

  factory CartModel() => _cartModel;

  //Catalog field
  late CatalogModel _catalog;

  //Collection of ids > store ids of each item

  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel? newCatalog) {
    _catalog = newCatalog!;
  }

  List<Items> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  num get totalPrice =>
      items.fold(0, (previousValue, element) => previousValue + element.price!);

  void add(Items item) {
    _itemIds.add(item.id!);
  }

  void remove(Items item) {
    _itemIds.remove(item.id!);
  }
}
