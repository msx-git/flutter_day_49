import 'package:flutter/material.dart';
import 'package:flutter_day_49/controllers/todos_controller.dart';
import 'package:flutter_day_49/models/todo.dart';
import 'package:flutter_day_49/services/local_notification_service.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({super.key});

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  final todosController = TodosController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todos"),
      ),
      body: StreamBuilder(
        stream: todosController.todos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data == null || !snapshot.hasData) {
            return const Center(
              child: Text("No questions"),
            );
          }

          final todos = snapshot.data!.docs;

          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = Todo.fromMap(todos[index]);
              return ListTile(
                leading: Text("${index + 1}"),
                title: Text(todo.title),
                subtitle: Text(todo.date),
                trailing: IconButton(
                  onPressed: () {
                    LocalNotificationService.showTodoNotification(
                      title: "Todo title",
                      body: "Todo body",
                      dateTime: DateTime.parse(todo.date),
                    );
                  },
                  icon: Icon(Icons.notification_add_outlined),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          todosController.addTodo(
            Todo(
              title: "New Todo",
              date: DateTime.now().toString(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
