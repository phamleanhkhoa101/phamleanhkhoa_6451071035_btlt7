import '../data/models/user.dart';
import '../data/repository/user_repository.dart';
import '../data/services/user_service.dart';

class UserController {
  late final UserRepository _repository;

  UserController() {
    _repository = UserRepository(UserService());
  }

  Future<List<User>> getUsers() async {
    return await _repository.fetchUsers();
  }
}