import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      constraints: BoxConstraints(
        maxWidth: screenWidth * 0.9,
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? Colors.black.withOpacity(0.3)
                  : Colors.grey.withOpacity(0.1),
              blurRadius: 5,
              offset: Offset(0, 2),
            )
          ]),
      child: Column(
        children: [
          Stack(
            children: [
              //image
              AspectRatio(
                aspectRatio: 16 / 9,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Image.asset(
                    product.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              //favrt button
              Positioned(
                  right: 8,
                  top: 8,
                  child: IconButton(
                    icon: Icon(
                      product.isFav ? Icons.favorite : Icons.favorite_border,
                      color: product.isFav
                          ? Theme.of(context).primaryColor
                          : isDark
                              ? Colors.grey[400]
                              : Colors.grey,
                    ),
                    onPressed: () {},
                  )),
                  if(product.oldPrice!)
            ],
          )
        ],
      ),
    );
  }
}
