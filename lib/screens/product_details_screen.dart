import 'package:flutter/material.dart';
import 'package:craigshop/models/product_model.dart';
import 'package:craigshop/controllers/wishlist_controller.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product;
  final WishlistController wishlistController = Get.find<WishlistController>();

  ProductDetailsScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    RxBool isFavorite = wishlistController.isProductInWishlist(product).obs;
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        actions: [
          IconButton(
            icon: Obx(() => Icon(
                  isFavorite.value ? Icons.favorite : Icons.favorite_border,
                  color: Colors.pink,
                )),
            onPressed: () {
              if (isFavorite.value) {
                wishlistController.removeFromWishlist(product);
              } else {
                wishlistController.addToWishlist(product);
              }
              isFavorite.toggle(); // Toggle the value of isFavorite
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.image,
              fit: BoxFit.cover,
              height: deviceSize.height * 0.6,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.description,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            // Add more details about the product
          ],
        ),
      ),
    );
  }
}
