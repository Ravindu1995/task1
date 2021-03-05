import 'package:TODO/core/error/failures.dart';
import 'package:TODO/core/usecases/usecase.dart';
import 'package:TODO/features/signUp/domain/repositories/signUpRepository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class SignUpUsecase extends UseCase<String,Params> {
  final SignUpRepository signUpRepository;

  SignUpUsecase({@required this.signUpRepository})
      : assert(signUpRepository != null, 'Repository cannot be null');

  @override
  Future<Either<Failure, String>> call(Params params) =>
      signUpRepository.signUp(params.name, params.email, params.password);
}

class Params extends Equatable {
  final String name;
  final String email;
  final String password;
  Params({
    @required this.name,
    @required this.email,
    @required this.password,
  });

  @override
  List<Object> get props => [name ,email, password];
}
