import 'package:e_commerce/helper/extenstion.dart';
import 'package:flutter/material.dart';

class ProductModel {
  late String name, category, image, dis, size, productId;
  late String price;
  late Color color;

  ProductModel({
    required this.name,
    //required this.category,
    required this.image,
    //required this.dis,
    //required this.price,
    //required this.color,
    //required this.size,
    //required this.productId,
  });

  ProductModel.fromJson(Map<String, dynamic>? map) {
    if (map == null) {
      return;
    }
    productId = map['productId'];
    name = map['name'];
    category = map['category'];
    image = map['image'];
    dis = map['dis'];
    price = map['price'];
    color = HexColor.fromHex(map['color']);
    size = map['size'];
  }

  toJson() {
    return {
      'productId': productId,
      'name': name,
      'category': category,
      'image': image,
      'dis': dis,
      'price': price,
      'color': color,
      'size': size,
    };
  }
}