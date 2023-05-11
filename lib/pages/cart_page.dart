import 'package:catalog_app_flutter/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creemColor,
      appBar: AppBar(
        title: "Cart".text.make(),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
