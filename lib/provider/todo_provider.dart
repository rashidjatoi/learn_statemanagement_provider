import 'package:flutter/material.dart';

import '/model/todo_model.dart';
import '/service/todo_service.dart';

class TodoProvider extends ChangeNotifier {
  final _todoService = TodoService();
  bool isLoading = false;

  List<TodoModel> _todo = [];
  List<TodoModel> get todo => _todo;

  Future<void> getAllTodo() async {
    isLoading = true;
    notifyListeners();
    final response = await _todoService.getAllTodo();
    _todo = response;
    isLoading = false;
    notifyListeners();
  }
}
