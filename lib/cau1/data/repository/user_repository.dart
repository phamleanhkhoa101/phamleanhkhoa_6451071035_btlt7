import '../models/user.dart';
import '../services/user_service.dart';

class UserRepository {
  final UserService _userService;

  UserRepository(this._userService);

  Future<List<User>> fetchUsers() async {
    final data = await _userService.fetchUsersJson();
    return data.map((e) => User.fromJson(e)).toList();
  }
}