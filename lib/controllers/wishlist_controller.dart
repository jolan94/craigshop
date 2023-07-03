import 'package:craigshop/models/product_model.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController {
  RxList<ProductModel> wishlist = <ProductModel>[].obs;

  void addToWishlist(ProductModel product) {
    wishlist.add(product);
  }

  void removeFromWishlist(ProductModel product) {
    wishlist.remove(product);
  }

  bool isProductInWishlist(ProductModel product) {
    return wishlist.contains(product);
  }
}
