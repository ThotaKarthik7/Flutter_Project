import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class TodoModel extends ChangeNotifier {
  final List<String> _todos = [];

  List<String> get todos => _todos;

  void addTodo(String todo) {
    if (todo.isNotEmpty) {
      _todos.add(todo);
      notifyListeners();
    }
  }

  void removeTodo(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }
}


class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final todoModel = Provider.of<TodoModel>(context);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const Text('Todo List', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter todo',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                todoModel.addTodo(_controller.text);
                _controller.clear();
              },
              child: const Text('Add Todo'),
            ),
            const SizedBox(height: 10),
            if (todoModel.todos.isEmpty)
              const Text('No todos yet!')
            else
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: todoModel.todos.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(todoModel.todos[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => todoModel.removeTodo(index),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
