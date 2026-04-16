import '../models/user.dart';
import '../services/user_service.dart';

class UserRepository {
  final UserService _userService;

  UserRepository(this._userService);

  Future<User> fetchUser() async {
    final data = await _userService.fetchUserJson();
    return User.fromJson(data);
  }

  Future<User> updateUser(User user) async {
    final data = await _userService.updateUserJson(
      body: user.toJson(),
    );
    return User.fromJson(data);
  }
}