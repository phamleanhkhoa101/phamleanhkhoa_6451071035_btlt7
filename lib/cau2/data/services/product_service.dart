import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';

class ProductService {
  Future<Map<String, dynamic>> fetchProductJson() async {
    final url = Uri.parse('${AppConstants.baseUrl}${AppConstants.productEndpoint}');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Không thể tải chi tiết sản phẩm');
    }
  }
}