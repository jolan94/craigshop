import 'package:craigshop/models/product_model.dart';
import 'package:craigshop/services/api_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxList<ProductModel> products = <ProductModel>[].obs;

  Future<void> fetchProducts() async {
    try {
      final List<ProductModel> response = await ApiService.getProducts();
      products.value = response;
    } catch (e) {
      // Handle error
    }
  }

  List<String> getCategories() {
    List<String> categories = [];
    for (ProductModel product in products) {
      if (!categories.contains(product.category)) {
        categories.add(product.category);
      }
    }
    return categories;
  }

  List<ProductModel> getProductsByCategory(String category) {
    return products.where((product) => product.category == category).toList();
  }
}
