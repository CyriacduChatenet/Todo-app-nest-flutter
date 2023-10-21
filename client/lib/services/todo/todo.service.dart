import 'package:client/interfaces/todo.interface.dart';
import 'package:client/repository/todo.repository.dart';
import '../../models/todo.dart';

class TodoService implements TodoInterface {
  final todoRepository = TodoRepository();

  @override
  Future<List<Todo>> getTodos() async {
    final todosJson = await todoRepository.getTodos();
    List<Todo> todos = [];

    todosJson.forEach((Map<String, dynamic> todo) {
      String title = todo['title'];
      String content = todo['content'];
      bool completed = todo['completed'];

      final Todo newTodo =
          Todo(title: title, content: content, completed: completed);
      todos.add(newTodo);
    });
    return todos;
  }

  @override
  Future<Todo> getTodoById(String id) async {
    final todoJson = await todoRepository.getTodoById(id);
    Todo todo = Todo(
      id: todoJson['id'],
      title: todoJson['title'],
      content: todoJson['content'],
      completed: todoJson['completed'],
    );
    return todo;
  }

  @override
  Future<Todo> createTodo(
      {required String title,
      required String content,
      required bool completed}) async {
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
    final Map<String, dynamic> todoMap = {
      'title': title,
      'content': content,
      'completed': completed,
    };

    final Map<String, dynamic> response = await todoRepository.updateTodo(id, todoMap);

    return Todo(
      id: response['id'],
      title: response['title'],
      content: response['content'],
      completed: response['completed'],
    );
  }

  @override
  Future<void> deleteTodoById(String id) async {
    await todoRepository.deleteTodoById(id);
  }
}
