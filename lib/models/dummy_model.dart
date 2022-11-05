class Product {
  final int id, price;
  final String title, description, image;

  Product({
    required this.id,
    required this.price,
    required this.title,
    required this.description,
    required this.image}
    );
}

// list of products
List<Product> products = [
  Product(
    id: 1,
    price: 1500,
    title: "Classic Leather Arm Chair",
    image: "assets/images/Item_1.png",
    description:
    "This is the description for Item 1",
  ),

  Product(
    id: 2,
    price: 1850,
    title: "Poppy Plastic Tub Chair",
    image: "assets/images/Item_2.png",
    description:
    "This is the description for Item 2",
  ),
  Product(
    id: 3,
    price: 1200,
    title: "Bar Stool Chair",
    image: "assets/images/Item_3.png",
    description:
    "This is the description for Item 3",
  ),
];