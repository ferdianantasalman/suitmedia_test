import 'package:dartz/dartz.dart';
import 'package:suitmedia/core/error/failure.dart';
import 'package:suitmedia/domain/entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, List<User>>> getAllUser(int page, int perPage);
}
