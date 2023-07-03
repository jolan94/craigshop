import 'package:craigshop/controllers/wishlist_controller.dart';
import 'package:craigshop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishlistScreen extends StatelessWidget {
  final WishlistController wishlistController = Get.put(WishlistController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: wishlistController.wishlist.length,
          itemBuilder: (context, index) {
            ProductModel product = wishlistController.wishlist[index];
            return Card(
              elevation: 0,
              color: Colors.grey.shade100,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: ListTile(
                title: Text(product.title),
                subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                leading: Image.network(
                  product.image,
                  width: 50,
                  fit: BoxFit.cover,
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.delete_outline,
                    color: Colors.red.shade400,
                  ),
                  onPressed: () {
                    wishlistController.removeFromWishlist(product);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
