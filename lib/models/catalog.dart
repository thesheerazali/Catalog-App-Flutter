class CatalogModel {
  static List<Items>? items;

  // Get Items by ID
  static Items getById(int id) => items!.firstWhere(
        (element) => element.id == id,
      );

  //Get Item By Postion
  //
  static Items getByPos(int pos) => items![pos];
}

class Items {
  final int? id;
  final String? name;
  final String? desc;
  final num? price;
  final String? color;
  final String? imageUrl;

  Items({
    this.id,
    this.name,
    this.desc,
    this.price,
    this.color,
    this.imageUrl,
  });

  factory Items.fromMap(Map<String, dynamic> map) {
    return Items(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      imageUrl: map["imageUrl"],
    );
  }

  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "imageUrl": imageUrl,
      };
}
