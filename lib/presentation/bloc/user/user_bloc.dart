// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:suitmedia/core/error/failure.dart';
import 'package:suitmedia/domain/entities/user.dart';

import 'package:suitmedia/domain/use_cases/user/get_all_user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetAllUser getAllUser;
  UserBloc({
    required this.getAllUser,
  }) : super(UserStateInitital()) {
    on<UserEventGetAll>((event, emit) async {
      try {
        emit(UserStateLoading());
        Either<Failure, List<User>> resultListUser =
            await getAllUser.call(event.page, event.perPage);

        resultListUser.fold((left) {
          if (left is ServerFailure) {
            emit(UserStateError(left.message));
          } else if (left is GeneralFailure) {
            emit(UserStateError(left.message));
          } else if (left is ConnectionFailure) {
            emit(UserStateError(left.message));
          } else {
            emit(const UserStateError("Get all user failed"));
          }
          log("ERROR : $left");
        }, (right) {
          log("SUCCESS : $right");
          emit(UserStateSuccessGetAll(right));
        });
      } catch (e) {
        emit(const UserStateError("Get all user failed"));
      }
    });
  }
}
