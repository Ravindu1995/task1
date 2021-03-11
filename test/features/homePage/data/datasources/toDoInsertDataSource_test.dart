
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
    toDoInsertDataSourceImpl = ToDoInsertDataSourceImpl(
        firebaseFirestore: mockFirebaseFirestore);
  });
  test('should return string when successfully Inserted',
      () async {
    when(mockFirebaseFirestore.collection(any)).
              thenReturn(mockCollctionRef);
    when(mockDocumentRef.set({
      'title': 'todo',
      'task': 'abc',
    })).thenAnswer((realInvocation) async => 'todo');

    expect(await toDoInsertDataSourceImpl.insertTask('todo', 'abc'),
        'Insered Successfully');
  });

}