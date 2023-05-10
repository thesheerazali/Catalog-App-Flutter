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
              color: Colors.white,
              
            ),
            
          ),
          )
        ]),
      ),
    );
  }
}
