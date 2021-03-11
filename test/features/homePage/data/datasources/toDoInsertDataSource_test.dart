import 'dart:ffi';

import 'package:TODO/features/homePage/data/datasources/toDoInsertDataSource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks/firebaseMocks.dart';

void main() {
  ToDoInsertDataSourceImpl toDoInsertDataSourceImpl;
  MockFirebaseFirestore mockFirebaseFirestore;
  MockCollctionRef mockCollctionRef;
  MockDocumentRef mockDocumentRef;

  setUp(() {
    mockFirebaseFirestore = MockFirebaseFirestore();
    mockCollctionRef = MockCollctionRef();
    mockDocumentRef = MockDocumentRef();
    toDoInsertDataSourceImpl =
        ToDoInsertDataSourceImpl(firebaseFirestore: mockFirebaseFirestore);
  });
  test('should return string when successfully Inserted', () async {
    when(mockFirebaseFirestore.collection(any)).thenReturn(mockCollctionRef);
    // when(mockDocumentRef.add({
    //   'title': 'todo',
    //   'task': 'abc',
    // })).thenAnswer((realInvocation) async => 'todo');
    when(mockCollctionRef.add({
      'title': 'todo',
      'task': 'abc',
    })).thenAnswer((realInvocation) async => mockDocumentRef);

    expect(await toDoInsertDataSourceImpl.insertTask('todo', 'abc'),
        'Insered Successfully');
  });

  test('should throw exception when document ref is null', () async {
    when(mockFirebaseFirestore.collection(any)).thenReturn(mockCollctionRef);
    when(mockCollctionRef.add({
      'title': 'todo',
      'task': 'abc',
    })).thenAnswer((realInvocation) async => null);
    final call = toDoInsertDataSourceImpl.insertTask;

    expect(() => call('todo', 'abc'), throwsException);
  });

  test('should throw exception when document there  is null', () async {
    when(mockFirebaseFirestore.collection(any)).thenReturn(mockCollctionRef);
    when(mockCollctionRef.add({
      'title': 'todo',
      'task': 'abc',
    })).thenAnswer((realInvocation) async => throw Exception('Error'));
    final call = toDoInsertDataSourceImpl.insertTask;

    expect(() => call('todo', 'abc'), throwsException);
  });
}
