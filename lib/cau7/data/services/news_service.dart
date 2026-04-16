import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';

class NewsService {
  Future<List<dynamic>> fetchNewsJson() async {
    try {
      final url = Uri.parse('${AppConstants.baseUrl}${AppConstants.newsEndpoint}');
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'User-Agent': 'PostmanRuntime/7.28.4',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data is List) {
          return data;
        } else {
          throw Exception('Dữ liệu trả về không hợp lệ');
        }
      } else {
        throw Exception('Lỗi API: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Lỗi khi tải danh sách tin tức: $e');
    }
  }
}
