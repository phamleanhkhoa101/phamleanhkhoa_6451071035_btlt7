import '../data/models/user.dart';
import '../data/repository/user_repository.dart';
import '../data/services/user_service.dart';

class UserController {
  late final UserRepository _repository;

  UserController() {
    _repository = UserRepository(UserService());
  }

  Future<User> getUser() async {
    return await _repository.fetchUser();
  }

  Future<User> updateUser(User user) async {
    return await _repository.updateUser(user);
  }
}