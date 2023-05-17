import 'package:catalog_app_flutter/core/store.dart';
import 'package:catalog_app_flutter/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
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

 
}

class AddMutation extends VxMutation<MyStore> {
  final Items item;

  AddMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.add(item.id!);
  }
}


class RemoveMutation extends VxMutation<MyStore> {
  final Items item;

  RemoveMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.remove(item.id!);
  }
}
