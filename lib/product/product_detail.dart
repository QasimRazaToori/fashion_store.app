import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utiles/app_textstyle.dart';
import 'package:flutter_application_1/model/product.dart';
import 'package:share_plus/share_plus.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWeight = screenSize.width;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: isDark ? Colors.white : Colors.black,
            )),
        title: Text(
          'Details',
          style: AppTextStyle.withColor(
            AppTextStyle.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () => _shareProduct(
                    context,
                    product.name,
                    product.description,
                  ),
              icon: Icon(
                Icons.share,
                color: isDark ? Colors.white : Colors.black,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset(
                    product.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                ////favorate button
              ],
            ),
          ],
        ),
      ),
    );
  }

  //share Product
  Future<void> _shareProduct(
    BuildContext context,
    String productName,
    String description,
  ) async {
    //get the reander box share position origin(required for iPad)
    final box = context.findRenderObject() as RenderBox?;
    String shopLink = 'https//youtshop.com/product/cotton-tshirt';
    final String ShareMessage = '$description\n\nShop now at $shopLink';
    try {
      final ShareResult result = await Share.share(
        ShareMessage,
        subject: productName,
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
      );
      if (result.status == ShareResultStatus) {
        debugPrint('Thank you for sharing!');
      }
    } catch (e) {
      debugPrint('Error Sharing $e');
    }
  }
}
