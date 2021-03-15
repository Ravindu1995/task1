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
  MockDocumentRef mockDocumentRef;

  setUp(() {
    mockFirebaseFirestore = MockFirebaseFirestore();
    mockCollctionRef = MockCollctionRef();
    mockQuerySnapshot = MockQuerySnapshot();
    mockQueryDocSnapshot = MockQueryDocSnapshot();
    mockDocumentRef = MockDocumentRef();
    toDoDataSourceImpl = ToDoDataSourceImpl(firestore: mockFirebaseFirestore);
  });
  final todo = ToDoModel(docId: 'af', task: 'af', title: 'af');
  test('should return todo model list', () async {
    when(mockFirebaseFirestore.collection(any)).thenReturn(mockCollctionRef);

    when(mockCollctionRef.get()).thenAnswer((_) async => mockQuerySnapshot);

    when(mockQuerySnapshot.docs).thenReturn([mockQueryDocSnapshot]);
    when(mockQueryDocSnapshot.data()).thenReturn(todo.toMap(todo));

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

  //=============INSERT_TEST====================//

  test('should add todo list Successfully', () async {
    when(mockFirebaseFirestore.collection('todo')).thenReturn(mockCollctionRef);

    when(mockCollctionRef.doc(any)).thenReturn(mockDocumentRef);
    when(mockDocumentRef.set({
      'title': 'title',
      'task': 'task',
    })).thenAnswer((_) async => mockDocumentRef);

    final result = await toDoDataSourceImpl.insertTask(todo);

    expect(result, todo);
  });

  test('should thrown an exception when user is  null ', () async {
    when(mockFirebaseFirestore.collection('todo')).thenReturn(mockCollctionRef);

    when(mockCollctionRef.add({
      'title': 'title',
      'task': 'task',
    })).thenAnswer((_) async => throw Exception('Error'));

    final call = toDoDataSourceImpl.insertTask;

    expect(() => call(todo), throwsException);
  });

  test('should throw  exception  ', () async {
    when(mockFirebaseFirestore.collection('todo')).thenReturn(mockCollctionRef);

    when(mockCollctionRef.add({
      'title': 'title',
      'task': 'task',
    })).thenAnswer((_) async => null);

    final call = toDoDataSourceImpl.insertTask;

    expect(() => call(todo), throwsException);
  });

//=============DELETE_TEST====================//

  test('Should delete task successfully', () async {
    when(mockFirebaseFirestore.collection('todo')).thenReturn(mockCollctionRef);

    when(mockCollctionRef.doc('docID')).thenReturn(mockDocumentRef);

    when(mockDocumentRef.delete()).thenAnswer((_) => Future.value(true));

    final result = await toDoDataSourceImpl.deleteTask('docID');

    expect(result, 'Deleted');
  });

  // test('should throw exception ', () async {
  //   when(mockFirebaseFirestore.collection(any)).thenReturn(mockCollctionRef);

  //   when(mockCollctionRef.doc())
  //       .thenReturn(mockDocumentRef);

  //   when(mockDocumentRef.delete()).thenAnswer((_) => throw Exception('Cannot Delete Task'));

  //   final call = toDoDataSourceImpl.deleteTask;

  //   expect(() => call('docID'), throwsException);
  // });
}
