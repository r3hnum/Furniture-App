import 'dart:convert';

List<ProductData> productDataFromJson(String str) => List<ProductData>.from(json.decode(str).map((x) => ProductData.fromJson(x)));

String productDataToJson(List<ProductData> data) => json.encode(List<dynamic>.from(data.map( (x)=> x.toJson() )));


class ProductData {
  ProductData({
    required this.id,
    required this.price,
    required this.title,
    required this.description,
    required this.image,
  });

  int id;
  int price;
  String? title;
  String? description;
  String? image;


  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
    id: json["id"],
    price: json["price"],
    title: json["title"],
    description: json["description"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "title": title,
    "description": description,
    "image": image,
  };
}