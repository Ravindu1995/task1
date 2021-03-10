//import 'package:TODO/core/error/exceptions.dart';
import 'package:dartz/dartz.dart';
//import 'package:flutter/cupertino.dart';

import 'package:TODO/core/error/failures.dart';
import 'package:TODO/features/homePage/data/datasources/toDoDataSource.dart';
import 'package:TODO/features/homePage/data/datasources/toDoDeleteDataSource.dart';
import 'package:TODO/features/homePage/domain/entities/toDoList.dart';
import 'package:TODO/features/homePage/domain/repositories/toDoRepository.dart';

class ToDoRepositoryImpl implements ToDoRepository {
  final ToDoDataSource toDoDataSource;
  final ToDoDeleteDataSource toDoDeleteDataSource;

  ToDoRepositoryImpl({
    this.toDoDataSource,
    this.toDoDeleteDataSource,
  }) : assert((toDoDataSource) != null, 'Data source cannot be null');

  

  @override
  Future<Either<Failure, bool>> deleteTask(String docId) async {
    try {
      return Right(await toDoDataSource.deleteTask(docID));
    } on Exception {
      return Left(ServerFailure('Error'));
    }
  }

  @override
  Future<Either<Failure, List<ToDoList>>> getToDoList(String docID) async {
    try {
      return Right(await toDoDataSource.getTodoList(docID));
    } on Exception {
      return Left(ServerFailure('Error'));
    }
  }

  @override
  Future<Either<Failure, String>> insertTask(ToDoList toDoList) {
    // TODO: implement insertTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> updateTask(ToDoList toDoList) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
}
