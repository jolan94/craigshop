import 'dart:convert';

import 'package:craigshop/models/product_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<ProductModel>> getProducts() async {
    try {
      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        List<ProductModel> products =
            data.map((json) => ProductModel.fromJson(json)).toList();
        return products;
      } else {
        throw Exception('Failed to fetch products');
      }
    } catch (e) {
      throw Exception('Failed to fetch products: $e');
    }
  }
}
