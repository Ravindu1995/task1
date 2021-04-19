
import 'package:TODO/core/usecases/usecase.dart';
import 'package:TODO/features/profile/domain/entities/users.dart';
import 'package:TODO/features/profile/domain/repositories/profileRepository.dart';
import 'package:flutter/cupertino.dart';

class ProfileUsecase extends StreamUseCase<UserEntity, NoParams> {
  final ProfileRepository profileRepository;

  ProfileUsecase({@required this.profileRepository})
      : assert(profileRepository != null, 'Repository cannot be null');

  @override
  Stream<UserEntity> call(NoParams params) {
    return profileRepository.getUsers();
  }
}


