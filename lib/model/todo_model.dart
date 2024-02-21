// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TodoModel {
  final int id;
  final int userId;
  final String title;
  final bool completed;

  TodoModel(
    this.id,
    this.userId,
    this.title,
    this.completed,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'title': title,
      'completed': completed,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      map['id'] as int,
      map['userId'] as int,
      map['title'] as String,
      map['completed'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
