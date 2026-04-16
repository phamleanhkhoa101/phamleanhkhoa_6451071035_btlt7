import '../models/task.dart';
import '../services/task_service.dart';

class TaskRepository {
  final TaskService _taskService;

  TaskRepository(this._taskService);

  Future<List<Task>> fetchTasks() async {
    final data = await _taskService.fetchTasksJson();
    return data.map((e) => Task.fromJson(e)).toList();
  }

  Future<bool> deleteTask(int id) async {
    return await _taskService.deleteTask(id);
  }
}