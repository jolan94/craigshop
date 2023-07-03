import 'package:craigshop/controllers/product_controller.dart';
import 'package:craigshop/models/product_model.dart';
import 'package:craigshop/screens/category_products_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCategoriesScreen extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    List<String> categories = productController.getCategories();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Categories'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          String category = categories[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(category),
              leading: const Icon(
                Icons.category,
                color: Colors.purple,
              ),
              trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
              onTap: () {
                Get.to(() => CategoryProductsScreen(category: category));
              },
            ),
          );
        },
      ),
    );
  }
}
