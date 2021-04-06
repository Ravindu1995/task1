import 'package:TODO/core/usecases/usecase.dart';
import 'package:TODO/features/root/domain/repositories/rootRepository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';

class RootUsecase extends StreamUseCase<User, NoParams> {
  final RootRepository repository;

  RootUsecase({@required this.repository})
      : assert(RootUsecase != null, 'Repository cannot be null');

  @override
  Stream<User> call(NoParams params) {
    return repository.authStateChange;
  }

  //@override
  // Future<bool> call(NoParams params) async {
  //   // TODO: implement call
  //   return await repository.isUserLoggedIn();
  // }
}
