import 'package:catalog_app_flutter/models/catalog.dart';
import 'package:catalog_app_flutter/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Items catalog;
  const HomeDetailPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.creemColor,
      ),
      backgroundColor: MyTheme.creemColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price!}".text.red800.bold.xl4.make(),
            ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.darkBluishColor),
                        shape:
                            MaterialStateProperty.all(const StadiumBorder())),
                    onPressed: () {},
                    child: "Buy".text.make())
                .wh(100, 50)
          ],
        ).p32(),
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
                          .make()
                    ],
                  ).py64()),
            ),
          )
        ]),
      ),
    );
  }
}
