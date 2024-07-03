import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_day_49/services/todos_firebase_service.dart';

import '../models/todo.dart';

class TodosController {
  final _todosFirebaseService = TodosFirebaseService();

  Stream<QuerySnapshot> get todos {
    return _todosFirebaseService.getTodos();
  }

  Future<void> addTodo(Todo todo) async {
    await _todosFirebaseService.addTodo(todo);
  }
}
