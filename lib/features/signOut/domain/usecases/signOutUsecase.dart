import 'package:TODO/core/error/failures.dart';
import 'package:TODO/features/signOut/domain/repositories/signOutRepository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class SignOutUsecase  {
  final SignOutRepository signOutRepository;

  SignOutUsecase({@required this.signOutRepository})
   : assert(signOutRepository != null, 'Repository cannot be null');

  Future<Either<Failure, String>> call() {
    return signOutRepository.signout();
  }
}

// class Params extends Equatable {
//   final String email;
  
//   Params({
//     @required this.email,
    
//   });

//   @override
//   List<Object> get props => [email];
// }
