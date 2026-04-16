import '../data/models/product.dart';
import '../data/repository/product_repository.dart';
import '../data/services/product_service.dart';

class ProductController {
  late final ProductRepository _repository;

  ProductController() {
    _repository = ProductRepository(ProductService());
  }

  Future<List<Product>> searchProducts(String keyword) async {
    return await _repository.searchProducts(keyword);
  }
}