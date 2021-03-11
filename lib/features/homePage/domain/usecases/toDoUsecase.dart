import 'package:TODO/core/error/failures.dart';
import 'package:TODO/core/usecases/usecase.dart';
import 'package:TODO/features/homePage/domain/repositories/toDoRepository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class ToDoUsecase extends UseCase<String, Params> {
  final ToDoRepository toDoRepository;

  ToDoUsecase({@required this.toDoRepository})
      : assert(toDoRepository != null, 'Repository cannot be null');

  @override
  Future<Either<Failure, String>> call(Params params) =>
     toDoRepository.getToDoList(params.title,params.task);
  
}

class Params extends Equatable {
  final String title;
  final String task;
  
  Params({
    @required this.title,
    @required this.task,
    
  });

  @override
  List<Object> get props => [title,task];
}
