//import 'package:TODO/core/error/exceptions.dart';
import 'package:TODO/core/error/exceptions.dart';
import 'package:TODO/features/homePage/data/datasources/toDoInsertDataSource.dart';
import 'package:TODO/features/homePage/data/datasources/toDoUpdateDataSource.dart';
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
  final ToDoInsertDataSource toDoInsertDataSource;
  final ToDoUpdateDataSource toDoUpdateDataSource;

  ToDoRepositoryImpl({
    this.toDoDataSource,
    this.toDoDeleteDataSource,
    this.toDoInsertDataSource,
    this.toDoUpdateDataSource,
  }) : assert((toDoDataSource) != null, 'Data source cannot be null');

  @override
  Future<Either<Failure, bool>> deleteTask(String docID) async {
    try {
      return Right(await toDoDeleteDataSource.deleteTask(docID));
    } on FailException {
      return Left(ServerFailure('Error'));
    }
  }

  @override
  Future<Either<Failure, String>> getToDoList(String title, String task) async {
    try {
      return Right('aas');
    } on FailException {
      return Left(ServerFailure('Error'));
    }
  }

  @override
  Future<Either<Failure, String>> insertTask(String title, String task) async {
    try {
      return Right(await toDoInsertDataSource.insertTask(title, task));
    } on FailException {
      return Left(ServerFailure('Error'));
    }
  }

  @override
  Future<Either<Failure, String>> updateTask(ToDoList toDoList) async {
    try {
      return Right(await toDoUpdateDataSource.updateTask(toDoList));
    } on FailException {
      return Left(ServerFailure('Error'));
    }
  }
}
