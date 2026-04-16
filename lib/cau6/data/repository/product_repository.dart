import '../models/product.dart';
import '../services/product_service.dart';

class ProductRepository {
  final ProductService _productService;

  ProductRepository(this._productService);

  Future<List<Product>> searchProducts(String keyword) async {
    final data = await _productService.searchProductsJson(keyword);
    return data.map((e) => Product.fromJson(e)).toList();
  }
}