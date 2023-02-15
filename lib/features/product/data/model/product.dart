import 'dart:convert';

class Product {
  final String name;
  final int price;
  final String image;
  final bool bestSeller;
  final String category;

  Product(this.name, this.price, this.image, this.bestSeller, this.category);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'image': image,
      'bestSeller': bestSeller,
      'category': category,
    };
  }

  factory Product.fromJson(Map<String, dynamic> map) {
    return Product(
      map['name'] ?? '',
      map['price']?.toInt() ?? 0,
      map['image'] ?? '',
      map['bestSeller'] ?? false,
      map['category'] ?? '',
    );
  }

}
