import 'package:catalog_app_flutter/models/cart.dart';
import 'package:catalog_app_flutter/pages/home_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog.dart';
import '../theme.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    final catalog = CatalogModel.items;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items!.length,
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeDetailPage(
                    catalog: catalog[index],
                  ),
                )),
            child: CatalogItem(catalog: catalog![index]));
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Items catalog;
  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(
              catalog.id.toString(),
            ),
            child: CatalogImage(
              image: catalog.imageUrl.toString(),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name!.text.lg
                    .color(MyTheme.darkBluishColor)
                    .bold
                    .make(),
                catalog.desc!.text.textStyle(context.captionStyle).make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catalog.price!}".text.bold.xl.make(),
                    _AddToCart(catalog: catalog),
                  ],
                ).pOnly(right: 8.0),
              ],
            ),
          )
        ],
      ),
    ).white.rounded.square(150).make().py16();
  }
}

class _AddToCart extends StatefulWidget {
  final Items catalog;
  const _AddToCart({super.key, required this.catalog});

  @override
  State<_AddToCart> createState() => __AddToCartState();
}

class __AddToCartState extends State<_AddToCart> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
            shape: MaterialStateProperty.all(const StadiumBorder())),
        onPressed: () {
          isAdded = isAdded.toggle();

          final _catalog = CatalogModel();
          final _cart = CartModel();

          _cart.add(widget.catalog);
          setState(() {});
        },
        child: isAdded ? const Icon(Icons.done) : "Add To Cart".text.make());
  }
}
