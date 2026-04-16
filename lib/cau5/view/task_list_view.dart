import 'package:flutter/material.dart';
import '../common/widget/loading_widget.dart';
import '../controller/task_controller.dart';
import '../data/models/task.dart';

class TaskListView extends StatefulWidget {
  const TaskListView({super.key});

  @override
  State<TaskListView> createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  final TaskController _controller = TaskController();

  bool _isLoading = true;
  String _errorMessage = '';
  List<Task> _tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      final tasks = await _controller.getTasks();

      setState(() {
        _tasks = tasks.take(10).toList();
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Lỗi: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _deleteTask(Task task, int index) async {
    try {
      final success = await _controller.deleteTask(task.id);

      if (success) {
        setState(() {
          _tasks.removeAt(index);
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Đã xóa task: ${task.title}'),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Xóa thất bại: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Task List'),
        ),
        body: const LoadingWidget(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Task List'),
      ),
      body: _errorMessage.isNotEmpty
          ? Center(
        child: Text(
          _errorMessage,
          style: const TextStyle(color: Colors.red),
        ),
      )
          : _tasks.isEmpty
          ? const Center(
        child: Text('Không còn task nào'),
      )
          : ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          final task = _tasks[index];

          return Dismissible(
            key: Key(task.id.toString()),
            direction: DismissDirection.endToStart,
            background: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.red,
              child: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            onDismissed: (_) {
              _deleteTask(task, index);
            },
            child: Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(task.id.toString()),
                ),
                title: Text(task.title),
                subtitle: Text(
                  task.completed ? 'Completed' : 'Not completed',
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}