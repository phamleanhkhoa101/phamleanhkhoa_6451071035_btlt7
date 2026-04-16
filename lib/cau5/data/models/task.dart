class Task {
  final int id;
  final String title;
  final bool completed;

  Task({
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: int.tryParse('${json['id']}') ?? 0,
      title: json['title']?.toString() ?? '',
      completed: json['completed'] == true,
    );
  }
}