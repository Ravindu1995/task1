//import 'package:TODO/core/error/exceptions.dart';
import 'package:TODO/features/homePage/data/datasources/toDoDataSource.dart';
import 'package:TODO/features/homePage/domain/entities/toDoList.dart';
import 'package:TODO/core/error/failures.dart';
import 'package:TODO/features/homePage/domain/repositories/toDoRepository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class ToDoRepositoryImpl implements ToDoRepository {
  final ToDoDataSource toDoDataSource;

  ToDoRepositoryImpl({@required this.toDoDataSource}):
  assert(toDoDataSource != null, 'Data source cannot be null');

  @override
  Future<Either<Failure, String>> deleteTask(String title) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ToDoList>>> getToDoList() async {
    try {
      final todolist = await toDoDataSource.getTodoList();
      return Right(await toDoDataSource.getTodoList());
    } on Exception {
      return Left(ServerFailure('Error'));
    }

  }

  @override
  Future<Either<Failure, String>> insertTask(String title, String task) {
    // TODO: implement insertTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> updateTask(ToDoList toDoList) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
}
