import 'package:get_it/get_it.dart';
import 'package:qit/src/features/home/data/datasources/remote_data_sources.dart';
import 'package:qit/src/features/home/data/repositories/home_repo_impl.dart';
import 'package:qit/src/features/home/domain/usecases/categories.dart';
import 'package:qit/src/features/home/domain/usecases/category.dart';
import 'package:qit/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:qit/src/features/login/data/datasources/remote_data_sources.dart';
import 'package:qit/src/features/login/domain/repositories/login_repo.dart';
import 'package:qit/src/features/login/data/repositories/login_repo_impl.dart';
import 'package:qit/src/features/login/domain/usecases/login.dart';
import 'package:qit/src/features/login/presentation/bloc/auth_bloc.dart';

import 'features/home/domain/repositories/home_repo.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Repositories
  sl.registerLazySingleton<LoginRepo>(
      () => LoginRepoImpl(loginRemoteDataSources: sl()));
  sl.registerLazySingleton<HomeRepo>(
      () => HomeRepoImpl(homeRemoteDataSources: sl()));

  //data
  sl.registerLazySingleton<LoginRemoteDataSources>(
      () => LoginRemoteDataSourcesImp());
  sl.registerLazySingleton<HomeRemoteDataSources>(
      () => HomeRemoteDataSourcesImpl());

  //UseCase
  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(loginRepo: sl()));
  sl.registerLazySingleton<CategoriesUseCase>(() => CategoriesUseCase(homeRepo: sl()));
  sl.registerLazySingleton<CategoryUseCases>(() => CategoryUseCases(homeRepo: sl()));

  //Bloc
  sl.registerFactory(() => AuthBloc(loginUseCase: sl()));
  sl.registerFactory(() => HomeBloc(categoriesUseCase: sl(),categoryUseCases: sl()));
}
