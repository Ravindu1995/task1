import 'package:TODO/core/usecases/usecase.dart';
import 'package:TODO/features/homePage/domain/entities/toDoList.dart';
import 'package:TODO/features/homePage/domain/repositories/toDoRepository.dart';
import 'package:TODO/features/homePage/domain/usecases/stream.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockToDoRepository extends Mock implements ToDoRepository {}

void main() {


  final List<ToDoList> taskList = [
    ToDoList('', "todo", "fadf"),
    ToDoList('', "dfd", "faddfdff"),
    ToDoList('', "tdsfdfodo", "fadgddf"),
  ];


  MockToDoRepository mockToDoRepository;
  StreamUse streamUse;

  setUp(() {
    mockToDoRepository = MockToDoRepository();
    streamUse = StreamUse(toDoRepository: mockToDoRepository);

  });
  test('should return task list', ()  {
    when(mockToDoRepository.getListOfTodo())
      .thenAnswer((realInvocation)  => Stream.fromIterable([taskList]) );
        expect( streamUse(NoParams()), emitsInOrder([taskList]));
  });

  test('should return empty', ()  {
    when(mockToDoRepository.getListOfTodo())
      .thenAnswer((realInvocation)  => Stream.empty() );
        expect( streamUse(NoParams()), emitsDone);
  });

  test('should return Error Strems', ()  {
    when(mockToDoRepository.getListOfTodo())
      .thenAnswer((realInvocation)  => Stream.error('StremErr'));
        expect( streamUse(NoParams()), emitsError('StremErr'));
  });
}
