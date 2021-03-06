import 'dart:ffi';

import 'package:TODO/core/error/failures.dart';
import 'package:TODO/features/homePage/domain/repositories/toDoRepository.dart';
import 'package:TODO/features/homePage/domain/usecases/insertToDoUsecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockInsert extends Mock implements ToDoRepository {}

void main() {
  // final todo = ToDoList(
  //    '',
  //   'abc',
  //    'bcd'
  // );

  MockInsert mockInsert;
  InsertToDoUsecase insertToDoUsecase;

  setUp(() {
    mockInsert = MockInsert();
    insertToDoUsecase = InsertToDoUsecase(toDoRepository: mockInsert);
  });
  test('should return success added return from repository', () async {
    when(mockInsert.insertTask('abc','bcd'))
        .thenAnswer((realInvocation) async => Right(Void));
    expect(await insertToDoUsecase(Params(title: 'abc',task: 'bcd')),
        Right(Void));
  });

  test('should return fail added', () async {
    when(mockInsert.insertTask('abc','bcd'))
        .thenAnswer((realInvocation) async => Left(ServerFailure('Error')));
    expect(await insertToDoUsecase(Params(title: 'abc',task: 'bcd')),
        Left(ServerFailure('Error')));
  });
}
