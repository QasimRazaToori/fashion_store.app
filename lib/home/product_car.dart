import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utiles/app_textstyle.dart';
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
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              // Product image
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

              // Favorite button
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
                  onPressed: () {
                    // Add your favorite toggle logic here
                  },
                ),
              ),

              // Old price label (if available)
              if (product.oldPrice != null)
                Positioned(
                  left: 8,
                  top: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'Old Price: \$${product.oldPrice}',
                      style: AppTextStyle.withColor(
                        AppTextStyle.withWeight(
                          AppTextStyle.BodySmall,
                          FontWeight.bold,
                        ),
                        Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          // Product details
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: AppTextStyle.withColor(
                    AppTextStyle.withWeight(
                      AppTextStyle.h3,
                      FontWeight.bold,
                    ),
                    Theme.of(context).textTheme.bodyLarge!.color!,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: screenWidth * 0.01),
                Text(
                  product.category,
                  style: AppTextStyle.withColor(
                    AppTextStyle.withWeight(
                      AppTextStyle.BodyMeddium,
                      FontWeight.bold,
                    ),
                    isDark ? Colors.grey[400]! : Colors.grey[600]!,
                  ),
                ),
                SizedBox(height: screenWidth * 0.01),
                Text(
                  'Price: \$${product.price.toStringAsFixed(2)}',
                  style: AppTextStyle.withColor(
                    AppTextStyle.withWeight(
                      AppTextStyle.BodyLarge,
                      FontWeight.bold,
                    ),
                    isDark ? Colors.grey[400]! : Colors.grey[600]!,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
