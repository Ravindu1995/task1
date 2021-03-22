import 'package:TODO/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';


abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

// class Params extends Equatable {
//   final Object object;

//   Params({@required this.object});

//   @override
//   // TODO: implement props
//   List<Object> get props => [object];
// }






