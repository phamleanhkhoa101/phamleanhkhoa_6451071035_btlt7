import 'package:flutter/material.dart';
import '../common/widget/loading_widget.dart';
import '../controllers/user_controller.dart';
import '../data/models/user.dart';

class UserListView extends StatelessWidget {
  const UserListView({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController controller = UserController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách User \nMSSV:6415071035'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: FutureBuilder<List<User>>(
        future: controller.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingWidget();
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Lỗi: ${snapshot.error}'),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('Không có dữ liệu user'),
            );
          }

          final users = snapshot.data!;

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(user.id.toString()),
                  ),
                  title: Text(user.name),
                  subtitle: Text(user.email),
                ),
              );
            },
          );
        },
      ),
    );
  }
}