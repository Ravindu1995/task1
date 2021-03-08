import 'package:TODO/core/error/failures.dart';
import 'package:TODO/features/homePage/domain/entities/toDoList.dart';
import 'package:TODO/features/homePage/domain/repositories/toDoRepository.dart';
import 'package:TODO/features/homePage/domain/usecases/updateToDoUsecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUpdate extends Mock implements ToDoRepository {}

void main() {
  final tTodo = ToDoList(
      'Lunch', 'Hilton cafe',
  );

  MockUpdate mockUpdate;
  UpdateToDoUsecase updateToDoUsecase;

  setUp(() {
    mockUpdate = MockUpdate();
    updateToDoUsecase = UpdateToDoUsecase(toDoRepository: mockUpdate);
  });
  test('should update a task succesfully', () async {
    when(mockUpdate.updateTask(any)).
    thenAnswer((realInvocation) async => Right('Updated'));
    expect(await updateToDoUsecase(tTodo),
    Right('Updated'));
  });

  test('should fail while updating', () async {
    when(mockUpdate.updateTask(any)).
    thenAnswer((realInvocation) async =>  Left(ServerFailure('Error')));
    expect(await updateToDoUsecase(tTodo),
     Left(ServerFailure('Error')));
  });

}
