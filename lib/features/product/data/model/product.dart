
class Product {
  final String name;
  final String id;
  final int price;
  final String image;
  final bool bestSeller;
  final String category;

  Product(this.name, this.price, this.image, this.bestSeller, this.category,this.id);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'image': image,
      'bestSeller': bestSeller,
      'category': category,
      'id':id,
    };
  }

  factory Product.fromJson(Map<String, dynamic> map) {
    return Product(
      map['name'] ?? '',
      map['price']?.toInt() ?? 0,
      map['image'] ?? '',
      map['bestSeller'] ?? false,
      map['category'] ?? '',
       map['id'],
    );
  }

}
