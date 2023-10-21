part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

class TodoSubmitEvent extends TodoEvent {
  final String title;
  final String content;
  final bool completed;

  TodoSubmitEvent(this.title, this.completed, this.content);
}