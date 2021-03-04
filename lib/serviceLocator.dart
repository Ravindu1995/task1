import 'package:TODO/features/login/data/datasources/loginDataSource.dart';
import 'package:TODO/features/login/data/repositories/loginRepositoryImpl.dart';
import 'package:TODO/features/login/domain/repositories/firebase_repository.dart';
import 'package:TODO/features/login/domain/usecases/login_usecase.dart';
import 'package:TODO/features/login/presentation/pages/loginViewModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

setupServiceLocator() {
  initLogin();
}

void initLogin() {
  ///*usecase
  locator.registerLazySingleton(() => LoginUseCase(repository: locator()));

  ///* repository
  locator.registerLazySingleton<LoginRepository>(
      () => LoginReposiyoryImpl(dataSource: locator()));

  ///* datasources
  locator.registerLazySingleton<LoginDataSource>(
      () => LoginDataSourceImpl(firebaseAuth: locator()));

  ///*! core
  locator.registerLazySingleton(() => FirebaseAuth.instance);

  ///*- viewmodels
  locator.registerLazySingleton(() => LoginViewModel(loginUseCase: locator()));
}
