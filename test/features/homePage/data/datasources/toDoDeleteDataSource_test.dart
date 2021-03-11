import 'dart:ffi';

import 'package:TODO/features/homePage/data/datasources/toDoDeleteDataSource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks/firebaseMocks.dart';

void main() {
  MockFirebaseFirestore mockFirebaseFirestore;
  MockCollctionRef mockCollctionRef;
  MockDocumentRef mockDocumentRef;
  //MockDocumentSnapshot mockDocumentSnapshot;
  ToDoDeleteDataSourceImpl toDoDeleteDataSourceImpl;
  //MockQuerySnapshot mockQuerySnapshot;

  setUp(() {
   // mockQuerySnapshot = MockQuerySnapshot();
    mockFirebaseFirestore = MockFirebaseFirestore();
    toDoDeleteDataSourceImpl =
        ToDoDeleteDataSourceImpl(firebaseFirestore: mockFirebaseFirestore);
    mockCollctionRef = MockCollctionRef();
    //mockDocumentSnapshot = MockDocumentSnapshot();
    mockDocumentRef = MockDocumentRef();
  });
  test('should return bool value True', () async {
    when(mockFirebaseFirestore.collection('todo')).thenReturn(mockCollctionRef);

    when(mockCollctionRef.doc(any)).thenReturn(mockDocumentRef);

    when(mockCollctionRef.doc(any)).thenReturn(mockDocumentRef);

    when(mockDocumentRef.delete()).thenAnswer((realInvocation) async => Void);

    //when(mockDocumentRef.value).thenReturn(mockDocumentSnapshot);

    expect(await toDoDeleteDataSourceImpl.deleteTask('docID'),
        true);
  });
}
