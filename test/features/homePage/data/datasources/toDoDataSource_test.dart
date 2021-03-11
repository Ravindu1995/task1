import 'package:TODO/features/homePage/data/datasources/toDoDataSource.dart';
import 'package:TODO/features/homePage/data/models/toDoModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks/firebaseMocks.dart';

class MockQuerySnapshot extends Mock implements QuerySnapshot {}

class MockQueryDocSnapshot extends Mock implements QueryDocumentSnapshot {}

void main() {
  //final tData = {''};
  MockQuerySnapshot mockQuerySnapshot;
  MockFirebaseFirestore mockFirebaseFirestore;
  MockCollctionRef mockCollctionRef;
  MockQueryDocSnapshot mockQueryDocSnapshot;
  ToDoDataSourceImpl toDoDataSourceImpl;

  setUp(() {
    mockFirebaseFirestore = MockFirebaseFirestore();
    mockCollctionRef = MockCollctionRef();
    mockQuerySnapshot = MockQuerySnapshot();
    mockQueryDocSnapshot = MockQueryDocSnapshot();
    toDoDataSourceImpl = ToDoDataSourceImpl(firestore: mockFirebaseFirestore);
  });
  final todo = ToDoModel(docId: 'af', task: 'af', title: 'af');
  test('should return todo model list', () async {
    when(mockFirebaseFirestore.collection(any)).thenReturn(mockCollctionRef);

    when(mockCollctionRef.get()).thenAnswer((_) async => mockQuerySnapshot);

    when(mockQuerySnapshot.docs).thenReturn([mockQueryDocSnapshot]);
    when(mockQueryDocSnapshot.data()).thenReturn(todo.toMap());

    final result = await toDoDataSourceImpl.getTodoList();

    expect(result, [todo]);
  });

  test('should throw  exception ', () async {
    when(mockFirebaseFirestore.collection(any)).thenReturn(mockCollctionRef);

    when(mockCollctionRef.get())
        .thenAnswer((_) async => throw Exception('Erro'));

    final call = toDoDataSourceImpl.getTodoList;

    expect(() => call(), throwsException);
  });

  test('should throw  exception ', () async {
    when(mockFirebaseFirestore.collection(any)).thenReturn(mockCollctionRef);

    when(mockCollctionRef.get()).thenAnswer((_) async => null);

    final call = toDoDataSourceImpl.getTodoList;

    expect(() => call(), throwsException);
  });
}
