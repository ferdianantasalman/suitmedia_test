import 'package:get_it/get_it.dart';
import 'package:suitmedia/data/data_sources/remote/user_remote_datasource.dart';
import 'package:suitmedia/data/repositories/user_repositoy_impl.dart';
import 'package:suitmedia/domain/repositories/user_repository.dart';
import 'package:suitmedia/domain/use_cases/user/get_all_user.dart';
import 'package:suitmedia/presentation/bloc/palindrome/palindrome_bloc.dart';
import 'package:suitmedia/presentation/bloc/user/user_bloc.dart';

final injection = GetIt.instance;

Future<void> initDependencyInjection() async {
  // ====== Bloc =====
  injection.registerFactory(
    () => PalindromeBloc(),
  );

  injection.registerFactory(
    () => UserBloc(
      getAllUser: injection.call(),
    ),
  );

  // ====== Use Case ========
  injection.registerLazySingleton(
    () => GetAllUser(
      userRepository: injection.call(),
    ),
  );

  //  ====== Repository =====
  injection.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      userRemoteDataSource: injection.call(),
    ),
  );

  //  ====== Data Source ======
  injection.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(),
  );
}
