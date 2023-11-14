import 'package:equatable/equatable.dart';

import 'package:client/models/todo_model.dart';

abstract class TodosState extends Equatable {
  const TodosState();

  @override
  List<Object> get props => [];
}

class TodosLoading extends TodosState {}

class TodosLoaded extends TodosState {
  final List<Todo> todos;

  const TodosLoaded({this.todos = const <Todo>[]});

  @override
  List<Object> get props => [todos];
}

class TodosError extends TodosState {
  final String? message;
  const TodosError(this.message);
}
