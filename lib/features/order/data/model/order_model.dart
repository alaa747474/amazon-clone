


import 'package:flutter_amazon_app/features/product/data/model/product.dart';

class OrderModel {
  final String fullName;
  final String phoneNumber;
  final String city;
  final String address;
  final String total;
  final List<Product>products;
  final String country;
  OrderModel(this.fullName, this.phoneNumber, this.city, this.address, this.total,this.products,this.country);





  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'city': city,
      'address': address,
      'total':total,
      'products':products.map((e) => e.name).toList(),
      'country':country
    };
  }

  factory OrderModel.fromJson(Map<String, dynamic> map) {
    return OrderModel(
      map['fullName'] ?? '',
      map['phoneNumber'] ?? '',
      map['city'] ?? '',
      map['address'] ?? '',
      map['total']??'',
      map['products']??'',
      map['country']??''
    );
  }

}
