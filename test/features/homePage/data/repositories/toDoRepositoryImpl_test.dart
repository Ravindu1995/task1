//import 'package:TODO/core/usecases/usecase.dart';
import 'dart:ffi';

import 'package:TODO/core/error/exceptions.dart';
import 'package:TODO/core/error/failures.dart';
import 'package:TODO/features/homePage/data/datasources/toDoDataSource.dart';
import 'package:TODO/features/homePage/data/models/toDoModel.dart';
import 'package:TODO/features/homePage/data/repositories/toDoRepositoryImpl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
//import 'dart:html';

class MockToDoDatasources extends Mock implements ToDoDataSource {}

void main() {
  final todo = [ToDoModel(docId: 'af', task: 'af', title: 'af')];

  //final todo1 = ToDoList('af', 'af', 'af');

  MockToDoDatasources mockToDoDatasources;
  ToDoRepositoryImpl toDoRepositoryImpl;

  setUp(() {
    mockToDoDatasources = MockToDoDatasources();
    toDoRepositoryImpl =
        ToDoRepositoryImpl(toDoDataSource: mockToDoDatasources);
  });

  group('Get ToDo Test', () {
    test('should emit task list successfully ', () async {
      when(mockToDoDatasources.getTodoList())
          .thenAnswer((realInvocation) async => Future.value(todo));
      expect(await toDoRepositoryImpl.getToDoList(), Right(todo));
    });

    test('should return fail load ', () async {
      when(mockToDoDatasources.getTodoList())
          .thenAnswer(((realInvocation) async => throw FailException()));
      expect(
          await toDoRepositoryImpl.getToDoList(), Left(ServerFailure('Error')));
    });
  });

  group('Insert ToDo Test', () {
    test('should inserted todo', () async {
      when(mockToDoDatasources.insertTask('abc', 'bcd'))
          .thenAnswer((realInvocation) async => Void);
      expect(await toDoRepositoryImpl.insertTask('abc', 'bcd'), Right(Void));
    });

    test('should return failure', () async {
      when(mockToDoDatasources.insertTask('abc', 'bcd')).thenAnswer(
          (realInvocation) async => throw FailException(message: 'Error'));
      expect(await toDoRepositoryImpl.insertTask('abc', 'bcd'),
          Left(ServerFailure('Error')));
    });
  });

  group('Delete todo test', () {
    test('should delete todo', () async {
      when(mockToDoDatasources.deleteTask('docID'))
          .thenAnswer((realInvocation) async => Void);
      expect(await toDoRepositoryImpl.deleteTask('docID'), Right(Void));
    });

    test('should throw failure', () async {
      when(mockToDoDatasources.deleteTask('docID')).thenAnswer(
          (realInvocation) async => throw FailException(message: 'Error'));
      expect(await toDoRepositoryImpl.deleteTask('docID'),
          Left(ServerFailure('Error')));
    });
  });

  // group('Update todo test', () {
  //   test('should Updated todo', () async {
  //   when(mockToDoDatasources.updateTask(todo1))
  //       .thenAnswer((realInvocation) async => Void);
  //   expect(await toDoRepositoryImpl.updateTask(todo1), Right(Void));
  // });

  // test('should throw failure', () async {
  //   when(mockToDoDatasources.updateTask(todo1)).thenAnswer(
  //       (realInvocation) async => throw FailException(message: 'Error'));
  //   expect(await toDoRepositoryImpl.updateTask(todo1),
  //       Left(ServerFailure('Error')));
  // });
  // });

  group('Update todo test', () {
    test('should Updated todo', () async {
    when(mockToDoDatasources.updateTask('abc','cde'))
        .thenAnswer((realInvocation) async => Void);
    expect(await toDoRepositoryImpl.updateTask('abc','cde'), Right(Void));
  });

  test('should throw failure', () async {
    when(mockToDoDatasources.updateTask('abc','cde')).thenAnswer(
        (realInvocation) async => throw FailException(message: 'Error'));
    expect(await toDoRepositoryImpl.updateTask('abc','cde'),
        Left(ServerFailure('Error')));
  });
  });


  test('should emit  list ', () {
      when(mockToDoDatasources.getListOfTodo())
          .thenAnswer((realInvocation)  => Stream.fromIterable([todo]));
      expect( toDoRepositoryImpl.getListOfTodo(), emitsInOrder([todo]) );
    });

    test('should return  empty ', () {
      when(mockToDoDatasources.getListOfTodo())
          .thenAnswer((realInvocation)  => Stream.empty());
      expect( toDoRepositoryImpl.getListOfTodo(), emitsDone );
    });

    test('should return Error ', () {
      when(mockToDoDatasources.getListOfTodo())
          .thenAnswer((realInvocation)  => Stream.error('ERR'));
      expect( toDoRepositoryImpl.getListOfTodo(), emitsError('ERR') );
    });
  
}
