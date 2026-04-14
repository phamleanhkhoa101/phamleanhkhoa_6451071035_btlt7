import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';

class UserService {
  Future<List<dynamic>> fetchUsersJson() async {
    final url = Uri.parse('${AppConstants.baseUrl}${AppConstants.usersEndpoint}');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as List<dynamic>;
    } else {
      throw Exception('Không thể tải dữ liệu user');
    }
  }
}