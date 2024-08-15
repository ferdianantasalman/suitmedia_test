part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class UserStateInitital extends UserState {
  @override
  List<Object?> get props => [];
}

class UserStateLoading extends UserState {
  @override
  List<Object?> get props => [];
}

class UserStateError extends UserState {
  final String message;

  const UserStateError(this.message);
  @override
  List<Object?> get props => [
        message,
      ];
}

class UserStateSuccessGetAll extends UserState {
  final List<User> listUser;

  const UserStateSuccessGetAll(this.listUser);
  @override
  List<Object?> get props => [
        listUser,
      ];
}
