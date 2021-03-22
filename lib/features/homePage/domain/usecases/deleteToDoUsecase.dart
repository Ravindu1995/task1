import 'package:TODO/core/error/failures.dart';
import 'package:TODO/core/usecases/usecase.dart';
import 'package:TODO/features/homePage/domain/repositories/toDoRepository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class DeleteToDoUsecase implements UseCase<void, Params>{
  final ToDoRepository toDoRepository;

  DeleteToDoUsecase({@required this.toDoRepository}) : 
      assert(toDoRepository != null ,"this repository cant be null");
  @override
  Future<Either<Failure, void>> call(Params params) async {
    return await toDoRepository.deleteTask(params.docID);
  }

}

class Params extends Equatable {
  final String docID;
  //  final String title;
  //  final String task;
  Params({
    @required this.docID,
    //  @required this.title,
    //  @required this.task,
  });

  @override
  List<Object> get props => [docID];
}