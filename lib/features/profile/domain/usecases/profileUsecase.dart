import 'package:TODO/core/error/failures.dart';
import 'package:TODO/core/usecases/usecase.dart';
import 'package:TODO/features/profile/domain/repositories/profileRepository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class ProfileUsecase extends UseCase<String, Params> {
  final ProfileRepository profileRepository;

  ProfileUsecase({@required this.profileRepository})
      : assert(profileRepository != null, 'Repository cannot be null');

  @override
  Future<Either<Failure, String>> call(Params params) async {
    // TODO: implement call
    return await profileRepository.getUsers(params.uID);
  }
}

class Params extends Equatable {
  final String uID;
  
  Params({
    @required this.uID,
   
  });

  @override
  List<Object> get props => [uID ];
}
