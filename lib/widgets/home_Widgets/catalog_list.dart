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
                    ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    MyTheme.darkBluishColor),
                                shape: MaterialStateProperty.all(
                                    const StadiumBorder())),
                            onPressed: () {},
                            child: "Add To Cart".text.make())
                        .wh(110, 40)
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
