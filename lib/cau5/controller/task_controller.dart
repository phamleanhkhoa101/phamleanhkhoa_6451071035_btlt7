import '../data/models/task.dart';
import '../data/repository/task_repository.dart';
import '../data/services/task_service.dart';

class TaskController {
  late final TaskRepository _repository;

  TaskController() {
    _repository = TaskRepository(TaskService());
  }

  Future<List<Task>> getTasks() async {
    return await _repository.fetchTasks();
  }

  Future<bool> deleteTask(int id) async {
    return await _repository.deleteTask(id);
  }
}