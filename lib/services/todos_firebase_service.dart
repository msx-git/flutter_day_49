import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/todo.dart';

class TodosFirebaseService {
  final _todosCollection = FirebaseFirestore.instance.collection("todos");

  Stream<QuerySnapshot> getTodos() async* {
    yield* _todosCollection.snapshots();
  }

  Future<void> addTodo(Todo todo) async {
    await _todosCollection.add(todo.toJson());
  }
}
