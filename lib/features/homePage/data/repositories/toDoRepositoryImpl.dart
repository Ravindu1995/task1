//import 'package:TODO/core/error/exceptions.dart';
import 'package:TODO/core/error/exceptions.dart';
import 'package:TODO/features/homePage/data/models/toDoModel.dart';
import 'package:TODO/features/homePage/domain/entities/toDoList.dart';
import 'package:dartz/dartz.dart';
import 'package:TODO/core/error/failures.dart';
import 'package:TODO/features/homePage/data/datasources/toDoDataSource.dart';
import 'package:TODO/features/homePage/domain/repositories/toDoRepository.dart';

class ToDoRepositoryImpl implements ToDoRepository {
  final ToDoDataSource toDoDataSource;

  ToDoRepositoryImpl({
    this.toDoDataSource,
  }) : assert((toDoDataSource) != null, 'Data source cannot be null');

  @override
  Future<Either<Failure, void>> deleteTask(String docID) async {
    try {
      return Right(await toDoDataSource.deleteTask(docID));
    } on FailException {
      return Left(ServerFailure('Error'));
    }
  }

  @override
  Future<Either<Failure, List<ToDoModel>>> getToDoList() async {
    try {
      final todolist = await toDoDataSource.getTodoList();
      return Right(todolist);
    } on FailException {
      return Left(ServerFailure('Error'));
    }
  }

  @override
  Stream<List<ToDoModel>> getListOfTodo() {
    return toDoDataSource.getListOfTodo();
  }

  @override
  Future<Either<Failure, void>> insertTask(String title, String task) async {
    try {
      return Right(await toDoDataSource.insertTask(title, task));
    } on FailException {
      return Left(ServerFailure('Error'));
    }
  }

  @override
  Future<Either<Failure, void>> updateTask(String title, String task) async {
    try {
      return Right(await toDoDataSource.updateTask(title, task));
    } on FailException {
      return Left(ServerFailure('Error'));
    }
  }
}
