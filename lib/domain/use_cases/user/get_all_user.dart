import 'package:dartz/dartz.dart';
import 'package:suitmedia/domain/entities/user.dart';
import 'package:suitmedia/domain/repositories/user_repository.dart';

import '../../../core/error/failure.dart';

class GetAllUser {
  final UserRepository userRepository;
  GetAllUser({
    required this.userRepository,
  });

  Future<Either<Failure, List<User>>> call(int page, int perPage) async {
    return await userRepository.getAllUser(page, perPage);
  }
}
