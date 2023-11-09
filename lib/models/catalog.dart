class CatalogModel {
  static final items = [
    Item(
      id: "codepur1",
      name: "LinkedIn 1",
      desc:
          "The REST API provides a simple, consistent representation of people, companies, jobs, and the interactions and relationships between them.",
      price: 500,
      color: "#33505a",
      image: "https://cdn-icons-png.flaticon.com/512/709/709325.png",
    )
  ];
}

class Item {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}
