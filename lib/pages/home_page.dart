import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:catalog_app_flutter/models/catalog.dart';
import 'package:catalog_app_flutter/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodeData = jsonDecode(catalogJson);
    var productsData = decodeData["products"];

    CatalogModel.items = List.from(productsData)
        .map<Items>((item) => Items.fromMap(item))
        .toList();
    setState(() {});
  }

  // Future<List> loadData() async {
  //   final jsonData = await rootBundle.loadString("assets/files/catalog.json");
  //   final list = json.decode(jsonData) as List<dynamic>;

  //   return list.map((item) => Items.fromMap(item)).toList();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Catalog App",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final item = CatalogModel.items![index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GridTile(
                      header: Text(
                        item.name.toString(),
                      ),
                      footer: Text(
                        item.price.toString(),
                      ),
                      child: Image.network(
                        item.imageUrl.toString(),
                      ),
                    ),
                  );
                },
                itemCount: CatalogModel.items!.length,
              )
            // ?
            // ListView.builder(
            //     itemCount: CatalogModel.items!.length,
            //     itemBuilder: (context, index) {
            //       return ItemWidget(
            //         item: CatalogModel.items![index],
            //       );
            //     },
            //   )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
