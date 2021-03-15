//import 'package:TODO/core/error/exceptions.dart';
import 'package:TODO/core/error/exceptions.dart';


import 'package:dartz/dartz.dart';
//import 'package:flutter/cupertino.dart';

import 'package:TODO/core/error/failures.dart';
import 'package:TODO/features/homePage/data/datasources/toDoDataSource.dart';

import 'package:TODO/features/homePage/domain/entities/toDoList.dart';
import 'package:TODO/features/homePage/domain/repositories/toDoRepository.dart';

class ToDoRepositoryImpl implements ToDoRepository {
  final ToDoDataSource toDoDataSource;
  //final ToDoDeleteDataSource toDoDeleteDataSource;
  //final ToDoInsertDataSource toDoInsertDataSource;
  //final ToDoUpdateDataSource toDoUpdateDataSource;

  ToDoRepositoryImpl({
    this.toDoDataSource,
    //this.toDoDataSource,

    //this.toDoUpdateDataSource,
  }) : assert((toDoDataSource) != null, 'Data source cannot be null');

  @override
  Future<Either<Failure, String>> deleteTask(String docID) async {
    try {
      return Right(await toDoDataSource.deleteTask(docID));
    } on FailException {
      return Left(ServerFailure('Error'));
    }
  }

  @override
  Future<Either<Failure, List<ToDoList>>> getToDoList() async {
    try {
      final todolist = await toDoDataSource.getTodoList();
      return Right(todolist);
    } on FailException {
      return Left(ServerFailure('Error'));
    }
  }

  @override
  Future<Either<Failure, String>> insertTask(ToDoList toDoList) async {
    try {
      return Right(await toDoDataSource.insertTask(toDoList));
    } on FailException {
      return Left(ServerFailure('Error'));
    }
  }

  @override
  Future<Either<Failure, String>> updateTask(ToDoList toDoList) async {
    try {
      await toDoDataSource.updateTask(toDoList);
      return Right(toDoList.docId);
    } on FailException {
      return Left(ServerFailure('Error'));
    }
  }
}
