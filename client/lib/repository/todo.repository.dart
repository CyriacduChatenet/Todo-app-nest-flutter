import 'package:http/http.dart' as http;

class TodoRepository {

  Future<void> createTodo (String todo) async {
    final response = await http.post(Uri.parse('http://localhost:8000/api/v1/todo'), body: todo);

    if(response.statusCode != 200) {
      throw Exception('Failed to create todo');
    }
    
    print(response.body);
  }
}