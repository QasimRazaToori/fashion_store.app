import 'package:flutter/material.dart';
import 'package:flutter_application_1/home/product_car.dart';
import 'package:flutter_application_1/model/product.dart';

class productGrid extends StatelessWidget {
  const productGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16),
      itemCount: 2,
      itemBuilder: (context, index) {
        final Product = products[index];
        return GestureDetector(
          onTap: () {},
          child: ProductCard(product: Product),
        );
      },
    );
  }
}
