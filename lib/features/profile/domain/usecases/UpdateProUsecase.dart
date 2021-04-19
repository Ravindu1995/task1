import 'package:TODO/core/error/failures.dart';
import 'package:TODO/core/usecases/usecase.dart';
import 'package:TODO/features/profile/domain/repositories/profileRepository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class UpdateProUsecase extends UseCase<void, Params> {
  final ProfileRepository repository;

  UpdateProUsecase({@required this.repository})
      : assert(repository != null, 'Repository can not be null');

  @override
  Future<Either<Failure, void>> call(Params params) {
    // TODO: implement call
    return repository.updateUser(params.name);
  }
}

class Params extends Equatable {
  final String name;
  
  Params({ 
    @required this.name,
  });

  @override
  List<Object> get props => [name];
}
