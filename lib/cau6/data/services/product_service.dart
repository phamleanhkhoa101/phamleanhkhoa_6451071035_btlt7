import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';

class ProductService {
  Future<List<dynamic>> searchProductsJson(String keyword) async {
    try {
      final url = Uri.parse(
        '${AppConstants.baseUrl}${AppConstants.searchProductsEndpoint}?q=$keyword',
      );

      final response = await http.get(url).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data is Map<String, dynamic> && data['products'] is List) {
          return data['products'] as List<dynamic>;
        } else {
          throw Exception('Dữ liệu trả về không hợp lệ');
        }
      } else {
        throw Exception('Search thất bại: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Lỗi khi tìm kiếm sản phẩm: $e');
    }
  }
}