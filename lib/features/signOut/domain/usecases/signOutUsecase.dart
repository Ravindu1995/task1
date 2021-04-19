import 'package:TODO/core/error/failures.dart';
import 'package:TODO/core/usecases/usecase.dart';
import 'package:TODO/features/signOut/domain/repositories/signOutRepository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class SignOutUsecase extends UseCase<void, NoParams> {
  final SignOutRepository signOutRepository;

  SignOutUsecase({@required this.signOutRepository})
   : assert(signOutRepository != null, 'Repository cannot be null');

  @override
  Future<Either<Failure, void>> call(NoParams params) {
    // TODO: implement call
    return signOutRepository.signout();
  }

  // Future<Either<Failure, String>> call(NoParams params) {
  //   return signOutRepository.signout();
  // }
}

// class Params extends Equatable {
//   final String email;
  
//   Params({
//     @required this.email,
    
//   });

//   @override
//   List<Object> get props => [email];
// }
