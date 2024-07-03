import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  final String? id;
  final String title;
  final String date;

  const Todo({
    this.id,
    required this.title,
    required this.date,
  });

  @override
  String toString() {
    return 'Todo{id: $id, title: $title, date: $date}';
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'date': date,
    };
  }

  factory Todo.fromMap(QueryDocumentSnapshot query) {
    return Todo(
      id: query.id,
      title: query['title'] as String,
      date: query['date'] as String,
    );
  }
}
