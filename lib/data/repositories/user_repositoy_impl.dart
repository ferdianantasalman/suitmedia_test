import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:suitmedia/core/error/exception.dart';
import 'package:suitmedia/core/error/failure.dart';
import 'package:suitmedia/data/data_sources/remote/user_remote_datasource.dart';
import 'package:suitmedia/domain/entities/user.dart';
import 'package:suitmedia/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl({required this.userRemoteDataSource});

  @override
  Future<Either<Failure, List<User>>> getAllUser(int page, int perPage) async {
    try {
      log("====Loading Get All User====");

      List<User> response =
          await userRemoteDataSource.getAllUser(page, perPage);

      log("====Berhasil Get All User : $response ====");

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return const Left(GeneralFailure(message: "List User gagal diterima"));
    }
  }
}
