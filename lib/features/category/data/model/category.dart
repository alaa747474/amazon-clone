
class Category {
  final String name;
  final String image;

  Category(this.name, this.image);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
    };
  }

  factory Category.fromJson(Map<String, dynamic> map) {
    return Category(
      map['name'] ?? '',
      map['image'] ?? '',
    );
  }

}
