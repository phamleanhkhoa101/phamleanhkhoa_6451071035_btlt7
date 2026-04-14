import '../data/models/product.dart';
import '../data/repository/product_repository.dart';
import '../data/services/product_service.dart';

class ProductController {
  late final ProductRepository _repository;

  ProductController() {
    _repository = ProductRepository(ProductService());
  }

  Future<Product> getProduct() async {
    return await _repository.fetchProduct();
  }
}