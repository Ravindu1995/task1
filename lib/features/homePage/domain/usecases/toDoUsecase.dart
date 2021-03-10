import 'package:TODO/core/error/failures.dart';
import 'package:TODO/core/usecases/usecase.dart';
import 'package:TODO/features/homePage/domain/entities/toDoList.dart';
import 'package:TODO/features/homePage/domain/repositories/toDoRepository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class ToDoUsecase extends UseCase<List<ToDoList>, Params> {
  final ToDoRepository toDoRepository;

  ToDoUsecase({@required this.toDoRepository})
      : assert(toDoRepository != null, 'Repository cannot be null');

  @override
  Future<Either<Failure, List<ToDoList>>> call(Params params) async {
    return await toDoRepository.getToDoList(params.docID);
  }
}

class Params extends Equatable {
  final String docID;
  
  Params({
    @required this.docID,
    
  });

  @override
  List<Object> get props => [docID];
}
