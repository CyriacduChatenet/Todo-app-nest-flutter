import 'package:client/blocs/todo/todo_event.dart';

import 'package:bloc/bloc.dart';
import 'package:client/blocs/todo/todo_state.dart';
import 'package:client/models/todo_model.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc()
      : super(const TodoState(title: '', description: '', completed: false)) {
    on<AddTodo>((event, emit) {
      final Todo todo = event.todo;
      final currentState = state;
      emit(currentState.copyWith(
        title: todo.title,
        description: todo.description,
        completed: todo.completed,
      ));
    });

    on<UpdateTodo>((event, emit) {
      final Todo todo = event.todo;
      final currentState = state;
      emit(currentState.copyWith(
        title: todo.title,
        description: todo.description,
        completed: todo.completed,
      ));
    });

    on<DeleteTodo>((event, emit) {
      final Todo todo = event.todo;
      final currentState = state;
      emit(currentState.copyWith(
        title: todo.title,
        description: todo.description,
        completed: todo.completed,
      ));
    });

    on<LoadTodos>((event, emit) {
      final currentState = state;
      emit(currentState.copyWith(
        title: '',
        description: '',
        completed: false,
      ));
    });

    on<ClearTodos>((event, emit) {
      final currentState = state;
      emit(currentState.copyWith(
        title: '',
        description: '',
        completed: false,
      ));
    });
  }
}
