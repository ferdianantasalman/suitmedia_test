part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UserEventGetAll extends UserEvent {
  final int page;
  final int perPage;

  const UserEventGetAll({
    required this.page,
    required this.perPage,
  });
  @override
  List<Object> get props => [page, perPage];
}
