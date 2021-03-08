import 'package:TODO/features/homePage/data/datasources/toDoDataSource.dart';
//import 'package:TODO/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
//import 'package:mockito/mockito.dart';

import '../../../mocks/firebaseMocks.dart';
//import '../repositories/toDoRepositoryImpl_test.dart';

void main() {

  final Map<String, dynamic> tData = {
    'title': "Todox",
    'task': "dinner",
    
  };


  MockFirebaseFirestore mockFirebaseFirestore;
  MockCollctionRef mockCollctionRef;
  MockDocumentRef mockDocumentRef;
  MockDocumentSnapshot mockDocumentSnapshot;
  ToDoDataSourceImpl toDoDataSourceImpl;
  MockQuerySnapshot mockQuerySnapshot;

  setUp(() {
    mockQuerySnapshot = MockQuerySnapshot();
    mockFirebaseFirestore = MockFirebaseFirestore();
    toDoDataSourceImpl = ToDoDataSourceImpl(firestore: mockFirebaseFirestore);
    mockCollctionRef = MockCollctionRef();
    mockDocumentSnapshot = MockDocumentSnapshot();
  });

/*
  test('should return todo model list', () async {
    when(mockFirebaseFirestore.collection('todo')).thenReturn(mockCollctionRef);

    when(mockDocumentSnapshot.data).thenReturn();

    when(mockQuerySnapshot.docs).thenReturn([]);

    when(mockCollctionRef.doc(any)).
        thenReturn(mockDocumentRef);
        when(mockDocumentRef.set({
      'title': 'todo',
      'task': 'task',
    })).thenAnswer((realInvocation) async => );
    when(mockUseCredential.doc).thenReturn(mockFirebaseFirestore);

     

    expect(await toDoDataSourceImpl.getTodoList(), todolist);
  });

  */
}
