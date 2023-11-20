import 'package:equatable/equatable.dart';

import 'package:bloc/bloc.dart';
import 'package:client/models/user_model.dart';
import 'package:client/repository/user_repository.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UserEvent, UsersState> {
  final UserRepository _userRepository;

  UsersBloc(this._userRepository) : super(const UsersLoaded()) {
    on<LoadUser>(_onLoadUser);
    on<GetUser>(_onGetUser);
    on<AddUser>(_onAddUser);
    on<DeleteUser>(_onDeleteUser);
    on<UpdateUser>(_onUpdateUser);
  }

  Future<void> _onLoadUser(LoadUser event, Emitter<UsersState> emit) async {
    emit(UsersLoading());
    try {
      final users = await _userRepository.findAllUsers();
      emit(UsersLoaded(users: users));
    } catch (e) {
      emit(UsersError(e.toString()));
    }
  }

  Future<void> _onGetUser(GetUser event, Emitter<UsersState> emit) async {
    emit(UsersLoading());
    try {
      final user =
          await _userRepository.findUserByEmail(email: event.userEmail);
      emit(UsersLoaded(
          users: [user])); // Vous pouvez ajuster la liste selon vos besoins
    } catch (e) {
      emit(UsersError(e.toString()));
    }
  }

  void _onAddUser(AddUser event, Emitter<UsersState> emit) {
    final state = this.state;
    if (state is UsersLoaded) {
      emit(UsersLoaded(users: List.from(state.users)..add(event.user)));
    }
  }

  void _onDeleteUser(DeleteUser event, Emitter<UsersState> emit) {
    final state = this.state;
    if (state is UsersLoaded) {
      List<User> users = state.users.where((user) {
        return user.id != event.user.id;
      }).toList();
      emit(UsersLoaded(users: users));
    }
  }

  void _onUpdateUser(UpdateUser event, Emitter<UsersState> emit) {
    final state = this.state;
    if (state is UsersLoaded) {
      List<User> users = (state.users.map((user) {
        return user.id == event.user.id ? event.user : user;
      })).toList();
      emit(UsersLoaded(users: users));
    }
  }
}
