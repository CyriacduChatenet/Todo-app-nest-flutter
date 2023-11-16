part of 'users_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetTodos extends UserEvent {}

class LoadUser extends UserEvent {
  final List<User> users;

  const LoadUser({this.users = const <User>[]});

  @override
  List<Object> get props => [users];
}

class AddUser extends UserEvent {
  final User user;

  const AddUser({required this.user});

  @override
  List<Object> get props => [User];
}

class UpdateUser extends UserEvent {
  final User user;

  const UpdateUser({required this.user});

  @override
  List<Object> get props => [User];
}

class DeleteUser extends UserEvent {
  final User user;

  const DeleteUser({required this.user});

  @override
  List<Object> get props => [User];
}
