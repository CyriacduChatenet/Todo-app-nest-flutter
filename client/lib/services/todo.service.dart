import 'package:client/interfaces/todo.interface.dart';
import 'package:client/repository/todo.repository.dart';
import '../models/todo.dart';

class TodoService implements TodoInterface {
  final todoRepository = TodoRepository();

  @override
  Future<List<Todo>> getTodos() async {
    final todosJson = await todoRepository.getTodos();
    print(todosJson);

    List<Todo> todos = [];

    todosJson.forEach((Map<String, dynamic> todo) {
  // Accédez aux données de chaque tâche en utilisant 'todo'
  String title = todo['title'];
  String content = todo['content'];
  bool completed = todo['completed'];

  // Faites quelque chose avec les données de la tâche
  print('Title: $title, Content: $content, Completed: $completed');
  final Todo newTodo = Todo(title: title, content: content, completed: completed);
  todos.add(newTodo);
});
    
    return todos;
  }

  @override
  Future<Todo> getTodoById(String id) async {
    return Todo(
      id: '1',
      title: 'Todo 1',
      content: 'Todo 1 content',
      completed: false,
    );
  }

  @override
  Future<Todo> createTodo({ required String title, required String content, required bool completed }) async {
   final Map<String, dynamic> todoMap = {
      'title': title,
      'content': content,
      'completed': completed,
    };
    
  final Map<String, dynamic> response = await todoRepository.createTodo(todoMap);
  return Todo(
    id: response['id'],
    title: response['title'],
    content: response['content'],
    completed: response['completed'],
  );
}

  @override
  Future<Todo> updateTodo({
    required String id,
    required String title,
    required String content,
    required bool completed,
  }) async {
    return Todo(
      id: '1',
      title: 'Todo 1',
      content: 'Todo 1 content',
      completed: false,
    );
  }

  @override
  Future<void> deleteTodoById(String id) async {
    return;
  }
}