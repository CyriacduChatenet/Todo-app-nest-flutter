import 'package:equatable/equatable.dart';

import 'package:client/models/todo_model.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class FindAllTodos extends TodoEvent {
  FindAllTodos();

  @override
  List<Object> get props => [];
}

class FindTodoById extends TodoEvent {
  final String id;

  FindTodoById({required this.id});

  @override
  List<Object> get props => [id];
}

class AddTodo extends TodoEvent {
  final Todo todo;

  const AddTodo({required this.todo});

  @override
  List<Object> get props => [todo];
}

class UpdateTodo extends TodoEvent {
  final Todo todo;

  const UpdateTodo({required this.todo});

  @override
  List<Object> get props => [todo];
}

class DeleteTodo extends TodoEvent {
  final Todo todo;

  const DeleteTodo({required this.todo});

  @override
  List<Object> get props => [todo];
}
