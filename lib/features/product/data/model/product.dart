
class Product {
  final String name;
   final String id;
   String uid;
  final int price;
  final String image;
  final bool bestSeller;
  final String category;

  Product(this.name, this.price, this.image, this.bestSeller, this.category,this.id,this.uid);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'image': image,
      'bestSeller': bestSeller,
      'category': category,
      'id':id,
      'uid':uid
    };
  }

  factory Product.fromJson(Map<String, dynamic> map) {
    return Product(
      map['name'] ?? '',
      map['price']?.toInt() ?? 0,
      map['image'] ?? '',
      map['bestSeller'] ?? false,
      map['category'] ?? '',
       map['id']??'',
      map['uid']??'',
    );
  }

}
