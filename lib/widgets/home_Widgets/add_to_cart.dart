// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/catalog.dart';
import '../theme.dart';

class AddToCart extends StatelessWidget {
  final Items catalog;
   AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);
 
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isInCart = false;
    isInCart = _cart.items.contains(catalog);
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
          shape: MaterialStateProperty.all(const StadiumBorder())),
      onPressed: () {
        if (!isInCart) {
          isInCart = isInCart.toggle();
          final _catalog = CatalogModel();

          _cart.catalog = _catalog;

          _cart.add(catalog);
          // setState(() {});
        }
      },
      child: isInCart
          ? const Icon(Icons.done)
          : const Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
