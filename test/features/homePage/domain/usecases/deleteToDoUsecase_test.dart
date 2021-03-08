import 'package:TODO/core/error/failures.dart';
import 'package:TODO/features/homePage/domain/repositories/toDoRepository.dart';
import 'package:TODO/features/homePage/domain/usecases/deleteToDoUsecase.dart';
//import 'package:TODO/features/homePage/domain/usecases/toDoUsecase.dart';
import 'package:dartz/dartz.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockToDoRepository extends Mock implements ToDoRepository {}

MockToDoRepository mockToDoRepository;
DeleteToDoUsecase deleteToDoUsecase;

void main() {

  String title;
  setUp(() {
    mockToDoRepository = MockToDoRepository();
    deleteToDoUsecase = DeleteToDoUsecase(toDoRepository: mockToDoRepository);
  });

  test('should delete task successfully', () async {
    when(mockToDoRepository.deleteTask(title))
        .thenAnswer((realInvocation) async => Right('Deleted'));
    
    expect(await deleteToDoUsecase(title), Right("Deleted"));
  });

  test('should return task delete failure', () async {
    when(mockToDoRepository.deleteTask(title))
        .thenAnswer((realInvocation) async => Left(ServerFailure('Error')));
    
    expect(await deleteToDoUsecase(title), Left(ServerFailure('Error')));
  });

}
