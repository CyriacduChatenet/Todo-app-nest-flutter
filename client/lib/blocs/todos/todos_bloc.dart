import 'package:bloc/bloc.dart';

import 'package:client/blocs/todos/todos_event.dart';
import 'package:client/blocs/todos/todos_state.dart';
import 'package:client/models/todo_model.dart';
import 'package:client/repository/todo_repository.dart';

class TodosBloc extends Bloc<TodoEvent, TodosState> {
  final TodoRepository _todoRepository;

  TodosBloc(this._todoRepository) : super(const TodosLoaded()) {
    on<LoadTodo>(_onLoadTodo);
    on<AddTodo>(_onAddTodo);
    on<DeleteTodo>(_onDeleteTodo);
    on<UpdateTodo>(_onUpdateTodo);
  }

  Future<void> _onLoadTodo(LoadTodo event, Emitter<TodosState> emit) async {
    emit(TodosLoading());
    try {
      final todos = await _todoRepository.findAllTodos();
      emit(TodosLoaded(todos: todos));
    } catch (e) {
      emit(TodosError(e.toString()));
    }
  }

  void _onAddTodo(AddTodo event, Emitter<TodosState> emit) {
    final state = this.state;
    if (state is TodosLoaded) {
      emit(TodosLoaded(todos: List.from(state.todos)..add(event.todo)));
    }
  }

  void _onDeleteTodo(DeleteTodo event, Emitter<TodosState> emit) {
    final state = this.state;
    if (state is TodosLoaded) {
      List<Todo> todos = state.todos.where((todo) {
        return todo.id != event.todo.id;
      }).toList();
      emit(TodosLoaded(todos: todos));
    }
  }

  void _onUpdateTodo(UpdateTodo event, Emitter<TodosState> emit) {
    final state = this.state;
    if (state is TodosLoaded) {
      List<Todo> todos = (state.todos.map((todo) {
        return todo.id == event.todo.id ? event.todo : todo;
      })).toList();
      emit(TodosLoaded(todos: todos));
    }
  }
}
