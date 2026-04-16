import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';


class PostService {
  Future<Map<String, dynamic>> createPost({
    required String title,
    required String body,
    required int userId,
  }) async {
    try {
      final url = Uri.parse('${AppConstants.baseUrl}${AppConstants.postEndpoint}');

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode({
          'title': title,
          'body': body ,
          'userId': userId,
        }),
      );

      if (response.statusCode ==201 || response.statusCode == 200){
        final data = jsonDecode(response.body);
        if (data is Map<String, dynamic>){
          return data;
        } else{
          throw Exception('Response không hợp lệ');
        }

      } else {
        throw Exception('Tạo bài viết thất bại. Mã lỗi: ${response.statusCode}');
      }
    }catch (e){
      throw Exception('Lỗi khi gửi POST API: $e');
    }
  }
}