


class CatalogModel {
  static List<Items>? items;

 
}

class Items {
  final int? id;
  final String? name;
  final String? desc;
  final num? price;
  final String? color;
  final String? image;

  Items(
      {this.id,
      this.name,
      this.desc,
      this.price,
      this.color,
      this.image,
       });

  factory Items.fromMap(Map<String, dynamic> map) {
    return Items(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
    );
  }

  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image,
      };
}
