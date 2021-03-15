//import 'package:TODO/core/usecases/usecase.dart';
import 'package:TODO/core/error/exceptions.dart';
import 'package:TODO/features/homePage/data/datasources/toDoDataSource.dart';
import 'package:TODO/features/homePage/data/repositories/toDoRepositoryImpl.dart';
import 'package:TODO/features/homePage/domain/entities/toDoList.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'dart:html';

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
  // test('should emit task list successfully ', () async {
  //   when(mockToDoDatasources.getTodoList('abc', 'abc'))
  //       .thenAnswer((realInvocation) async => 'Loaded');
  //   expect(await toDoRepositoryImpl.getToDoList('abc', 'abc'), Right('Loaded'));
  // });

  /*test('should return fail load ', () async {
      when(mockToDoDatasources.getTodoList())
      .thenAnswer(((_) async => throw Left(ServerFailure('Error'))));
    expect(await toDoRepositoryImpl.getToDoList(),
        Left(ServerFailure('Error')));
  });*/
  /// error not work
  ///

  ///Testing FoR InsertTask()
  test('should return string from dat source when inserted', () async {
    when(mockToDoDatasources.insertTask(todo))
        .thenAnswer((realInvocation) async => 'Insered Successfully');
    expect(await toDoRepositoryImpl.insertTask(todo),
        Right('Insered Successfully'));
  });

  test('should return failure when authenticationexception is thrown',
      () async {
    when(mockToDoDatasources.insertTask(todo)).thenAnswer(
        (realInvocation) async => throw FailException(message: 'Error'));
    expect(await toDoRepositoryImpl.insertTask(todo),
        Left(FailException()));
  });
}
