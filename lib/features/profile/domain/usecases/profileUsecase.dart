
import 'package:TODO/core/usecases/usecase.dart';
import 'package:TODO/features/profile/domain/entities/users.dart';
import 'package:TODO/features/profile/domain/repositories/profileRepository.dart';
import 'package:flutter/cupertino.dart';

class ProfileUsecase extends StreamUseCase<List<User>, NoParams> {
  final ProfileRepository profileRepository;

  ProfileUsecase({@required this.profileRepository})
      : assert(profileRepository != null, 'Repository cannot be null');

  @override
  Stream<List<User>> call(NoParams params) {
    // TODO: implement call
    return profileRepository.getUsers();
  }
}

// class Params extends Equatable {
//   final String uID;

//   Params({
//     @required this.uID,
//   });

//   @override
//   List<Object> get props => [uID];
// }
