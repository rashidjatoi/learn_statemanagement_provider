import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_statemanagement/model/todo_model.dart';

class TodoService {
  Future<List<TodoModel>> getAllTodo() async {
    try {
      const url = 'https://jsonplaceholder.typicode.com/todos';
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List;
        final todos = json
            .map(
              (e) => TodoModel(
                e['id'],
                e['userId'],
                e['title'],
                e['completed'],
              ),
            )
            .toList();
        return todos;
      } else {
        return [];
      }
    } catch (e) {
      throw "Something went wrong";
    }
  }
}
