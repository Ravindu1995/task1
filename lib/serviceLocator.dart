import 'package:TODO/features/login/data/datasources/loginDataSource.dart';
import 'package:TODO/features/login/data/repositories/loginRepositoryImpl.dart';
import 'package:TODO/features/login/domain/repositories/loginRepository.dart';

import 'package:TODO/features/login/domain/usecases/login_usecase.dart';
import 'package:TODO/features/login/presentation/pages/loginViewModel.dart';
import 'package:TODO/features/signUp/data/datasources/signUpDataSource.dart';
import 'package:TODO/features/signUp/data/repositories/signUpRepositoryImpl.dart';
import 'package:TODO/features/signUp/domain/repositories/signUpRepository.dart';
import 'package:TODO/features/signUp/domain/usecases/signUpUsecase.dart';
import 'package:TODO/features/signUp/presentation/pages/signUpViewModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

setupServiceLocator() {
  initLogin();
  initSignUp();
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

void initSignUp() {
  locator
      .registerLazySingleton(() => SignUpUsecase(signUpRepository: locator()));

  locator.registerLazySingleton<SignUpRepository>(
      () => SignUpRepositoryImpl(signUpDataSource: locator()));

  locator.registerLazySingleton<SignUpDataSource>(
      () => SignUpDataSourceImpl(firebaseAuth: locator()));

  locator.registerLazySingleton(() => FirebaseAuth.instance);

  locator
      .registerLazySingleton(() => SignUpViewModel(signUpUsecase: locator()));
}
