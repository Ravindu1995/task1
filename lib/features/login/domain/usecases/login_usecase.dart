import 'package:TODO/features/login/domain/repositories/loginRepository.dart';
import 'package:dartz/dartz.dart';
import 'package:TODO/core/error/failures.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:TODO/core/usecases/usecase.dart';


class LoginUseCase extends UseCase<String, Params> {
  final LoginRepository repository;

  LoginUseCase({@required this.repository})
      : assert(repository != null, 'Repository cannot be null');

  @override
  Future<Either<Failure, String>> call(Params params) =>
      repository.login(params.email, params.password);
}

class Params extends Equatable {
  final String email;
  final String password;
  Params({
    @required this.email,
    @required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
