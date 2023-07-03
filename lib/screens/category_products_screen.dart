import 'package:craigshop/controllers/product_controller.dart';
import 'package:craigshop/models/product_model.dart';
import 'package:craigshop/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryProductsScreen extends StatelessWidget {
  final String category;
  final ProductController productController = Get.put(ProductController());

  CategoryProductsScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    List<ProductModel> categoryProducts =
        productController.getProductsByCategory(category);

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: ListView.builder(
        itemCount: categoryProducts.length,
        itemBuilder: (context, index) {
          ProductModel product = categoryProducts[index];
          return Card(
            elevation: 0,
            color: Colors.grey.shade100,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(product.title),
                trailing: Text('\$${product.price.toStringAsFixed(2)}'),
                leading: Image.network(
                  product.image,
                  width: 50,
                  fit: BoxFit.fill,
                ),
                onTap: () {
                  Get.to(() => ProductDetailsScreen(product: product));
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
