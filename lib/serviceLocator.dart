import 'package:TODO/features/homePage/data/datasources/toDoDataSource.dart';

import 'package:TODO/features/homePage/data/repositories/toDoRepositoryImpl.dart';
import 'package:TODO/features/homePage/domain/repositories/toDoRepository.dart';
import 'package:TODO/features/homePage/domain/usecases/deleteToDoUsecase.dart';
import 'package:TODO/features/homePage/domain/usecases/insertToDoUsecase.dart';
import 'package:TODO/features/homePage/domain/usecases/stream.dart';
import 'package:TODO/features/homePage/domain/usecases/toDoUsecase.dart';
import 'package:TODO/features/homePage/domain/usecases/updateToDoUsecase.dart';
import 'package:TODO/features/homePage/presentation/pages/toDoViewModel.dart';
import 'package:TODO/features/login/data/datasources/loginDataSource.dart';
import 'package:TODO/features/login/data/repositories/loginRepositoryImpl.dart';
import 'package:TODO/features/login/domain/repositories/loginRepository.dart';

import 'package:TODO/features/login/domain/usecases/login_usecase.dart';
import 'package:TODO/features/login/presentation/pages/loginViewModel.dart';
import 'package:TODO/features/profile/data/datasources/profileDataSource.dart';
import 'package:TODO/features/profile/data/respositories/profileRepositoryImpl.dart';
import 'package:TODO/features/profile/domain/repositories/profileRepository.dart';
import 'package:TODO/features/profile/domain/usecases/profileUsecase.dart';
import 'package:TODO/features/profile/presentation/pages/profileModel.dart';
import 'package:TODO/features/signUp/data/datasources/signUpDataSource.dart';
import 'package:TODO/features/signUp/data/repositories/signUpRepositoryImpl.dart';
import 'package:TODO/features/signUp/domain/repositories/signUpRepository.dart';
import 'package:TODO/features/signUp/domain/usecases/signUpUsecase.dart';
import 'package:TODO/features/signUp/presentation/pages/signUpViewModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

GetIt locator = GetIt.instance;

setupServiceLocator() {
  initLogin();
  initSignUp();
  initShow();
  initProfile();
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

  // locator.registerLazySingleton<SignUpRepository>(
  //     () => SignUpRepositoryImpl(signUpDataSource: locator()));
  locator.registerLazySingleton<SignUpRepository>(
      () => SignUpRepositoryImpl(signUpDataSource: locator()));
  locator.registerLazySingleton(() => FirebaseFirestore.instance);
  locator.registerLazySingleton<SignUpDataSource>(() => SignUpDataSourceImpl(
      firebaseAuth: locator(), firebaseFirestore: locator()));

  locator
      .registerLazySingleton(() => SignUpViewModel(signUpUsecase: locator()));
}

initShow() {
  locator.registerLazySingleton(
      () => InsertToDoUsecase(toDoRepository: locator()));
  locator.registerLazySingleton(() => ToDoUsecase(toDoRepository: locator()));
  locator.registerLazySingleton(() => StreamUse(toDoRepository: locator()));
  locator.registerLazySingleton(
      () => UpdateToDoUsecase(toDoRepository: locator()));
  locator.registerLazySingleton(
      () => DeleteToDoUsecase(toDoRepository: locator()));
  //locator.registerLazySingleton(() => SignOutUsecase(signOutRepository: locator()));

  locator.registerLazySingleton<ToDoRepository>(
      () => ToDoRepositoryImpl(toDoDataSource: locator()));

  //locator.registerLazySingleton(() => FirebaseFirestore.instance);
  locator.registerLazySingleton<ToDoDataSource>(
      () => ToDoDataSourceImpl(firestore: locator(), uuid: locator()));

  locator.registerLazySingleton(() => Uuid());

  locator.registerLazySingleton(() => ToDoViewModel(
        streamUse: locator(),
        toDoUsecase: locator(),
        insertToDoUsecase: locator(),
        updateToDoUsecase: locator(),
        deleteToDoUsecase: locator(),
        //signOutUsecase: locator(),
      ));
}

void initProfile() {
  locator.registerLazySingleton(
      () => ProfileUsecase(profileRepository: locator()));

  locator.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(profileDataSource: locator()));

  locator.registerLazySingleton<ProfileDataSource>(() =>
      ProfileDataSourceImpl(firestore: locator(), firebaseAuth: locator()));

  locator.registerLazySingleton(() => ProfileModel(usecase : locator(),));
}
