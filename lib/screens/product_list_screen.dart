import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:craigshop/controllers/product_controller.dart';
import 'package:craigshop/models/product_model.dart';
import 'package:craigshop/screens/product_details_screen.dart';

class ProductListScreen extends StatefulWidget {
  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ProductController productController = Get.put(ProductController());

  @override
  void initState() {
    productController.fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Craigshop'),
      ),
      body: Obx(
        () => GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columns
            childAspectRatio: 0.75, // Adjust as needed for desired aspect ratio
            mainAxisSpacing: 12, crossAxisSpacing: 12,
          ),
          itemCount: productController.products.length,
          itemBuilder: (context, index) {
            ProductModel product = productController.products[index];
            return GestureDetector(
              onTap: () {
                // Navigate to product details screen
                Get.to(() => ProductDetailsScreen(product: product));
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        child: Image.network(
                          product.image,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        product.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('\$${product.price.toStringAsFixed(2)}'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
