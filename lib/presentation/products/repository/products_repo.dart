import 'package:dio/dio.dart';

import '../../../helpers/utils/api constants/api_const.dart';
import 'data model/products_model.dart';

class ProductRepository {
  final Dio _dio = Dio();

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await _dio.get(getProductsUrl);

      if (response.statusCode == 200) {
        final productResponse = ProductResponse.fromJson(response.data);
        return productResponse.data.products;
      } else {
        throw Exception("Failed to load products: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching products: $e");
    }
  }

  Future<Product> fetchProductById(String id) async {
    try {
      final response = await _dio.get("$getSingleProductUrl$id");

      if (response.statusCode == 200) {
        // Some APIs return `{ data: product }` or `{ data: { product: {...} } }`
        final data = response.data;

        if (data['data'] is Map<String, dynamic> &&
            data['data']['product'] != null) {
          return Product.fromJson(data['data']['product']);
        } else if (data['data'] is Map<String, dynamic>) {
          return Product.fromJson(data['data']);
        } else {
          return Product.fromJson(data);
        }
      } else {
        throw Exception("Failed to load product: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching product by ID: $e");
    }
  }

  Future<List<Product>> fetchProductsByCategory(String categoryName) async {
    try {
      final response = await _dio.get(
        getProductsUrl,
        queryParameters: {"category": categoryName},
      );

      if (response.statusCode == 200) {
        final productResponse = ProductResponse.fromJson(response.data);

        // Filter by category (case-insensitive)
        return productResponse.data.products
            .where((product) =>
                product.category.toLowerCase() == categoryName.toLowerCase())
            .toList();
      } else {
        throw Exception("Failed to fetch products by category");
      }
    } catch (e) {
      throw Exception("Error fetching category products: $e");
    }
  }
}
