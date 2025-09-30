import 'package:flutter/material.dart';

class Product {
  final String name;
  final String category;
  final double price;
  final double? oldPrice;
  final String imageUrl;
  final bool isFav;
  final String description;
  Product({
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.name,
    this.oldPrice,
    required this.price,
    this.isFav = false,
  });
}

final List<Product> products = [
  Product(
      category: 'Footwear',
      description: 'This is description of the product 1',
      imageUrl: 'assets/images/shoe.jpg',
      name: 'Shoes',
      price: 69.00,
      oldPrice: 189.00),
  Product(
      category: 'Electronics',
      description: 'This is description of the product 2',
      imageUrl: 'assets/images/laptop.jpg',
      name: 'Laptop',
      price: 69.00,
      oldPrice: 189.00),
  Product(
      category: 'Footwear',
      description: 'This is description of the product 3',
      imageUrl: 'assets/images/shoe2.jpg',
      name: 'Jorden Shoes',
      price: 69.00,
      oldPrice: 189.00),
  Product(
      category: 'Footwear',
      description: 'This is description of the product 4',
      imageUrl: 'assets/images/shoes2.jpg',
      name: 'Puma Shoes',
      price: 69.00,
      oldPrice: 189.00)
];
