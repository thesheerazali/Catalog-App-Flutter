import 'package:catalog_app_flutter/models/catalog.dart';
import 'package:catalog_app_flutter/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/home_Widgets/add_to_cart.dart';

class HomeDetailPage extends StatelessWidget {
  final Items catalog;
  const HomeDetailPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      backgroundColor: MyTheme.creemColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price!}".text.red800.bold.xl4.make(),
           

                AddToCart(catalog: catalog).wh(120, 50),
          ],
        ).p20(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: Image.network(catalog.imageUrl.toString()),
          ).h32(context),
          Expanded(
            child: VxArc(
              height: 30,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                  width: context.screenWidth,
                  color: Colors.white,
                  child: Column(
                    children: [
                      catalog.name!.text.xl4
                          .color(MyTheme.darkBluishColor)
                          .bold
                          .make(),
                      catalog.desc!.text.xl
                          .textStyle(context.captionStyle)
                          .make(),
                      10.heightBox,
                      "Elitr dolores gubergren accusam labore sed voluptua magna. Sed dolor sit ipsum amet et lorem ut est, no sit et dolores elitr diam. No diam at vero sed nonumy et diam vero at, sit invidunt sea dolore et eos no. Magna kasd et dolor amet at sed dolor diam. Diam."
                          .text
                          .textStyle(context.captionStyle)
                          .make()
                          .scrollVertical()
                          .p16()
                    ],
                  ).py64()),
            ),
          )
        ]),
      ),
    );
  }
}
