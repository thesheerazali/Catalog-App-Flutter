import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/catalog.dart';
import '../theme.dart';

class AddToCart extends StatefulWidget {
  final Items catalog;
  const AddToCart({super.key, required this.catalog});

  @override
  State<AddToCart> createState() => AddToCartState();
}

class AddToCartState extends State<AddToCart> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isInCart = false;
    isInCart = _cart.items.contains(widget.catalog);
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
            shape: MaterialStateProperty.all(const StadiumBorder())),
        onPressed: () {
          if (!isInCart) {
            isInCart = isInCart.toggle();
            final _catalog = CatalogModel();

            _cart.catalog = _catalog;

            _cart.add(widget.catalog);
            setState(() {});
          }
        },
        child: isInCart
            ? const Icon(Icons.done)
            : Icon(CupertinoIcons.cart_badge_plus));
  }
}
