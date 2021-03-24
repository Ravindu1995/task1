import 'dart:ffi';

//import 'package:TODO/core/error/exceptions.dart';
import 'package:TODO/features/homePage/data/datasources/toDoDataSource.dart';
import 'package:TODO/features/homePage/data/models/toDoModel.dart';
import 'package:TODO/features/homePage/domain/entities/toDoList.dart';
//import 'package:TODO/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

import '../../../mocks/firebaseMocks.dart';

class MockQuerySnapshot extends Mock implements QuerySnapshot {}

class MockQueryDocSnapshot extends Mock implements QueryDocumentSnapshot {}

class MockUuid extends Mock implements Uuid {}

void main() {
  //final tData = {''};
  MockQuerySnapshot mockQuerySnapshot;
  MockFirebaseFirestore mockFirebaseFirestore;
  MockCollctionRef mockCollctionRef;
  MockQueryDocSnapshot mockQueryDocSnapshot;
  ToDoDataSourceImpl toDoDataSourceImpl;
  MockDocumentRef mockDocumentRef;
  MockUuid mockUuid;

  setUp(() {
    mockFirebaseFirestore = MockFirebaseFirestore();
    mockCollctionRef = MockCollctionRef();
    mockQuerySnapshot = MockQuerySnapshot();
    mockQueryDocSnapshot = MockQueryDocSnapshot();
    mockDocumentRef = MockDocumentRef();
    mockUuid = MockUuid();
    toDoDataSourceImpl =
        ToDoDataSourceImpl(firestore: mockFirebaseFirestore, uuid: mockUuid);
  });

  final todo = ToDoModel(docId: 'af', task: 'af', title: 'af');

  final todo1 = ToDoList('', 'Todo2', 'go to office');

  final Map<String, dynamic> tData = {
    'docID': '',
    'title': "Todo2",
    'task': "go to office",
  };

  group('get ToDo Test', () {
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
  });

  group('Insert ToDO Test', () {
    test('should add todo list Successfully', () async {
      when(mockFirebaseFirestore.collection('todo'))
          .thenReturn(mockCollctionRef);
      when(mockUuid.v1()).thenAnswer((_)  => 'Void');
      when(mockCollctionRef.doc(any)).thenReturn(mockDocumentRef);
      when(mockDocumentRef.set({
        'title': 'title',
        'task': 'task',
      })).thenAnswer((_) async => Void);

      expect(
          toDoDataSourceImpl.insertTask('title', 'task'), isA<Future<void>>());
    });

    test('should throw  exception when trying to insert ', () async {
      when(mockFirebaseFirestore.collection('todo'))
          .thenReturn(mockCollctionRef);
      when(mockUuid.v1()).thenAnswer((_)  => 'abc');
      when(mockCollctionRef.doc('abc')).thenReturn(mockDocumentRef);
      when(mockDocumentRef.set({
        'id' : 'abc',
        'title': 'title',
        'task': 'task',
      })).thenAnswer((realInvocation) async => throw Exception('Error'));

      final call = toDoDataSourceImpl.insertTask;

      expect(() => call('title', 'task'), throwsException);
    });
  });

  group('Delete toDO test', () {
    test('Should delete task successfully', () async {
      when(mockFirebaseFirestore.collection('todo'))
          .thenReturn(mockCollctionRef);

      when(mockCollctionRef.doc('docID')).thenReturn(mockDocumentRef);

      when(mockDocumentRef.delete()).thenAnswer((_) async => Void);

      expect(
          toDoDataSourceImpl.deleteTask('docID'), isA<Future<void>>());
    });

    test('should throw exception ', () async {
      when(mockFirebaseFirestore.collection(any)).thenReturn(mockCollctionRef);

      when(mockCollctionRef.doc(any)).thenReturn(mockDocumentRef);

      when(mockDocumentRef.delete())
          .thenAnswer((_) async => throw Exception('Error'));

      final call = toDoDataSourceImpl.deleteTask;

      expect(() => call('docID'), throwsException);
    });
  });

  group('update todo test', () {
    test('Should update task successfully', () async {
      when(mockFirebaseFirestore.collection('todo'))
          .thenReturn(mockCollctionRef);

      when(mockCollctionRef.doc(any)).thenReturn(mockDocumentRef);

      when(mockDocumentRef.set({
        'title': 'title',
        'task': 'task',
      }))..thenAnswer((_) async => Void);

      expect(
          toDoDataSourceImpl.updateTask('',''), isA<Future<void>>());
    });

    test('should throw  exception when trying to Update ', () async {
      when(mockFirebaseFirestore.collection('todo')).thenReturn(mockCollctionRef);

      when(mockCollctionRef.doc('docId')).thenReturn(mockDocumentRef);

      when(mockDocumentRef.set({
        'title': 'title',
        'task': 'task',
      }))..thenAnswer((realInvocation) async => throw Exception('Error'));

      final call = toDoDataSourceImpl.updateTask;

      expect(() => call('title','task'), throwsException);
      
    });
  });
}
