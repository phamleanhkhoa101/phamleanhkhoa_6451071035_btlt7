import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';

class UserService {
  Future<Map<String, dynamic>> fetchUserJson() async {
    try {
      final url = Uri.parse('${AppConstants.baseUrl}${AppConstants.endpoint}');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data is Map<String, dynamic>) {
          return data;
        } else {
          throw Exception('Dữ liệu user không hợp lệ');
        }
      } else {
        throw Exception('GET thất bại: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Lỗi khi tải user: $e');
    }
  }

  Future<Map<String, dynamic>> updateUserJson({
    required Map<String, dynamic> body,
  }) async {
    try {
      final url = Uri.parse('${AppConstants.baseUrl}${AppConstants.endpoint}');
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data is Map<String, dynamic>) {
          return data;
        } else {
          throw Exception('Response update không hợp lệ');
        }
      } else {
        throw Exception('PUT thất bại: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Lỗi khi update user: $e');
    }
  }
}