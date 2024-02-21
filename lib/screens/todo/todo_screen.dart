import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/todo_provider.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TodoProvider>(context, listen: false).getAllTodo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Screen'),
        elevation: 0.9,
      ),
      body: Consumer<TodoProvider>(
        builder: (context, todoProvider, _) {
          if (todoProvider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          } else {
            return RefreshIndicator(
              onRefresh: todoProvider.getAllTodo,
              child: ListView.builder(
                itemCount: todoProvider.todo.length,
                itemBuilder: (context, index) {
                  final todo = todoProvider.todo[index];
                  return Container(
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(todo.id.toString()),
                      ),
                      title: Text(todo.title),
                      subtitle: Text(
                        'Completed: ${todo.completed.toString()}',
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
