import '../models/product.dart';
import '../services/product_service.dart';

class ProductRepository {
  final ProductService _productService;

  ProductRepository(this._productService);

  Future<Product> fetchProduct() async {
    final data = await _productService.fetchProductJson();
    return Product.fromJson(data);
  }
}