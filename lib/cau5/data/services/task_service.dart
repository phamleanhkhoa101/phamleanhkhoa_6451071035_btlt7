import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';

class TaskService {
  Future<List<dynamic>> fetchTasksJson() async {
    try {
      final url = Uri.parse('${AppConstants.baseUrl}${AppConstants.endpoint}');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data is List) {
          return data;
        } else {
          throw Exception('Dữ liệu task không hợp lệ');
        }
      } else {
        throw Exception('Không thể tải danh sách task: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Lỗi khi tải task: $e');
    }
  }

  Future<bool> deleteTask(int id) async {
    try {
      final url = Uri.parse('${AppConstants.baseUrl}${AppConstants.endpoint}/$id');
      final response = await http.delete(url);

      if (response.statusCode == 200 || response.statusCode == 204) {
        return true;
      } else {
        throw Exception('Xóa task thất bại: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Lỗi khi xóa task: $e');
    }
  }
}