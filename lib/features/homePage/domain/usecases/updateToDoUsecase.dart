import 'package:TODO/core/error/failures.dart';
import 'package:TODO/core/usecases/usecase.dart';
//import 'package:TODO/features/homePage/domain/entities/toDoList.dart';
import 'package:TODO/features/homePage/domain/repositories/toDoRepository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';


class UpdateToDoUsecase extends UseCase<void, Params> {
  final ToDoRepository toDoRepository;

  UpdateToDoUsecase({@required this.toDoRepository})
      : assert(toDoRepository != null, 'Repository can not be null');

  @override
  Future<Either<Failure, void>> call(Params params) {
    return toDoRepository.updateTask(params.title,params.task);
  }
}

class Params extends Equatable {
  //final String docID;
  final String title;
  final String task;
  Params({
     //this.docID,
    @required this.title,
    @required this.task,
  });

  @override
  List<Object> get props => [title, task];
}