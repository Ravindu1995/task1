//import 'package:TODO/core/usecases/usecase.dart';
import 'dart:ffi';

import 'package:TODO/core/error/exceptions.dart';
import 'package:TODO/core/error/failures.dart';
import 'package:TODO/features/homePage/data/datasources/toDoDataSource.dart';
import 'package:TODO/features/homePage/data/repositories/toDoRepositoryImpl.dart';
import 'package:TODO/features/homePage/domain/entities/toDoList.dart';
import 'package:TODO/main.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
//import 'dart:html';

class MockToDoDatasources extends Mock implements ToDoDataSource {}

void main() {
  final todo = ToDoList(
    '',
    'Todo 1',
    'todo one',
  );

  MockToDoDatasources mockToDoDatasources;
  ToDoRepositoryImpl toDoRepositoryImpl;

  setUp(() {
    mockToDoDatasources = MockToDoDatasources();
    toDoRepositoryImpl =
        ToDoRepositoryImpl(toDoDataSource: mockToDoDatasources);
    mockToDoDatasources = MockToDoDatasources();
  });
  test('should emit task list successfully ', () async {
    when(mockToDoDatasources.getTodoList())
        .thenAnswer((realInvocation) async => []);
    expect(await toDoRepositoryImpl.getToDoList(), Right(todolist));
  });

  
  test('should return fail load ', () async {
      when(mockToDoDatasources.getTodoList())
      .thenAnswer(((_) async => throw Left(FailException())));
    expect(await toDoRepositoryImpl.getToDoList(),
        Left(ServerFailure('Error')));
  });
  /// error not work
  ///

  //Testing FoR InsertTask()
  // test('should inserted todo', () async {
  //   when(mockToDoDatasources.insertTask('abc','bcd'))
  //       .thenAnswer((realInvocation) async => Void);
  //   expect(await toDoRepositoryImpl.insertTask('abc','bcd'),
  //       Right(Void));
  // });

  // test('should return failure',
  //     () async {
  //   when(mockToDoDatasources.insertTask('abc','bcd')).thenAnswer(
  //       (realInvocation) async => throw FailException(message: 'Error'));
  //   expect(await toDoRepositoryImpl.insertTask('abc','bcd'),
  //       Left(ServerFailure('Error')));
  // });
}
