import 'package:flutter/material.dart';
import 'package:catalog_app_flutter/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.item});

  final Items item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {},
        leading: Image(
          image: NetworkImage(
            item.image.toString(),
          ),
        ),
       
        title: Text(item.name.toString()),
        subtitle: Text(item.desc.toString()),
        trailing: Text(
          "\$${item.price}",
          textScaleFactor: 1.5,
          style: const TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
